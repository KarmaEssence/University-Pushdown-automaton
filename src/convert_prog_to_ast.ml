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
      let newstackslist = stack :: stackslist in
      convert_actions subactionslist newstackslist
    | Reject ->
      print_string "Erreur : Fin du programme.\n";
      exit 1   


let rec convert_next (nextlist: next list) (numtransition: char) (stack_symbol: char) (states: char list) (newtransitions: Ast.transition list) : Ast.transition list =
  match nextlist with
  | [] -> List.rev newtransitions
  | element :: subnextlist ->
    match next with
    | (letter_to_read, actionslist) ->
      let actions = convert_actions actionslist [] in
      let newstate = get_state_from_actions numtransition states actions in
      let actions = list_without_state states actions [] in
      let transition = (numtransition, letter_to_read, stack_symbol, newstate, actions) in
      convert_next declarations subnextlist numtransition stack_symbol (transition :: newtransitions)



let rec convert_nexts (nextlist: next list) (numtransition: char) (stack_symbols: char list) (states: char list) (newtransitions: Ast.transition list) : Ast.transition list =
  match stack_symbols with
  | [] -> newtransitions
  | element :: substack_symbols ->
    let transitions = convert_next nextlist numtransition element states [] in
    convert_nexts declarations nextlist numtransition substack_symbols (newtransitions @ transitions)

let rec convert_top (toplist: top list) (numtransition: char) (stack_symbols: char list) (states: char list) (newtransitions: Ast.transition list) : Ast.transition list = 


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
      let restransitions = convert_top nextlist numtransition stack_symbols states [] in
      convert_transitions declarations subtransitions (newtransitions @ restransitions)



let convert_prog_to_ast (program: program) : automate = 
  match program with
  | (declarations, transitions) ->
    let newtransition = convert_transitions declarations transitions [] in
    (declarations, newtransition)