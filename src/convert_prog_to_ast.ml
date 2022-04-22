open Gas6_utils

let rec list_without_state (states: char list) (actions: char list) (newactions: char list): char list =
  match actions with
  | [] -> List.rev newactions
  | element :: subactions ->
    if List.mem element states then
      list_without_state states subactions newactions
    else
      list_without_state states subactions (element :: newactions)  

let rec get_state_from_actions (numtransition: char) (states: char list) (actions: char list): char = 
  match actions with
  | [] -> numtransition
  | element :: subactions ->
    if List.mem element states then
      element
    else 
      get_state_from_actions numtransition states subactions  

let rec convert_actions (actionslist: Prog.action list) (stackslist: char list): char list =
  match actionslist with
  | [] -> List.rev stackslist
  | element :: subactionslist ->
    match element with
    | Push(stack) -> 
      let newstackslist = stack :: stackslist in
      convert_actions subactionslist newstackslist
    | Pop ->
      if List.length stackslist > 0 then
        let error_code = 1 in
        print_string "Erreur : Mauvais format de fichier, le pop doit etre la première instruction.\n";
        exit error_code
      else    
        []
    | Change(state) ->
      let newstackslist = state :: stackslist in
      convert_actions subactionslist newstackslist
    | Reject ->
      print_string "Erreur : Fin du programme.\n";
      exit 1   


let rec convert_next (nextlist: Prog.next list) (numtransition: char) (stack_symbol: char) (states: char list) (newtransitions: Ast.transition list) : Ast.transition list =
  match nextlist with
  | [] -> List.rev newtransitions
  | element :: subnextlist ->
    match element with
    | (letter_to_read, actionslist) ->
      let actions = convert_actions actionslist [] in
      let newstate = get_state_from_actions numtransition states actions in
      let actions = list_without_state states actions [] in
      let list_to_read = [letter_to_read] in
      let transition = (numtransition, list_to_read, stack_symbol, newstate, actions) in
      convert_next subnextlist numtransition stack_symbol states (transition :: newtransitions)

let rec convert_nexts (nextlist: Prog.next list) (numtransition: char) (stack_symbols: char list) (states: char list) (newtransitions: Ast.transition list) : Ast.transition list =
  match stack_symbols with
  | [] -> newtransitions
  | element :: substack_symbols ->
    let transitions = convert_next nextlist numtransition element states [] in
    convert_nexts nextlist numtransition substack_symbols states (newtransitions @ transitions)

let rec convert_top (toplist: Prog.top list) (numtransition: char) (stack_symbols: char list) (states: char list) (newtransitions: Ast.transition list) : Ast.transition list = 
  match toplist with
  | [] -> newtransitions
  | element :: subtoplist ->
    match element with
    | Actions(stack_symbol, actionslist) ->
      let actions = convert_actions actionslist [] in
      let newstate = get_state_from_actions numtransition states actions in
      let actions = list_without_state states actions [] in
      let transitions = (numtransition, [' '], stack_symbol, newstate, actions) in
      convert_top subtoplist numtransition stack_symbols states (newtransitions @ [transitions])
    | Nexts(stack_symbol, nextlist) ->
      let transitions = convert_next nextlist numtransition stack_symbol states [] in 
      convert_top subtoplist numtransition stack_symbols states (newtransitions @ transitions) 

let rec convert_transitions (declarations: Ast.declarations) (transitions: Prog.transition list) (newtransitions: Ast.transition list) : Ast.transition list = 
  match transitions with
  | [] -> newtransitions
  | element :: subtransitions ->
    let stack_symbols = Ast.getSymbols declarations 2 in
    let states = Ast.getSymbols declarations 1 in
    match element with 
    | Next(numtransition, nextlist) ->
      let restransitions = convert_nexts nextlist numtransition stack_symbols states [] in
      convert_transitions declarations subtransitions (newtransitions @ restransitions)
    | Top(numtransition, toplist) ->
      let restransitions = convert_top toplist numtransition stack_symbols states [] in
      convert_transitions declarations subtransitions (newtransitions @ restransitions)

let convert_prog_to_ast (program: Prog.program) : Ast.automate = 
  match program with
  | (declarations, transitions) ->
    let newtransitions = convert_transitions declarations transitions [] in
    (declarations, newtransitions)