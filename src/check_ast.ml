(*****************************************************************************)

open Type

(*****************************************************************************)

(***********************************************************************)
(*                              check_ast                              *)  
(***********************************************************************)

let rec check_list (transition_to_read: automate_transition) (transitions: automate_transition list): bool =
  match transition_to_read with
  | (x_current_state, x_listletter_toread, x_stack_topop, _, _) ->
    match transitions with
    | [] -> true
    | (y_current_state, y_listletter_toread, y_stack_topop, _, _) :: subtransitions ->
      if x_current_state = y_current_state && x_stack_topop = y_stack_topop 
        && ((List.length x_listletter_toread = 0 && List.length y_listletter_toread > 0) ||
            (List.length y_listletter_toread = 0 && List.length x_listletter_toread > 0)) then
        false      
      else      
        check_list transition_to_read subtransitions

let rec check_transitions_in_case_of_epsilon (transitions_to_read: automate_transition list) 
(transitions: automate_transition list): unit = 
  match transitions_to_read with
  | [] -> ()
  | transition :: subtransitions_to_read ->
    if check_list transition transitions then
      check_transitions_in_case_of_epsilon subtransitions_to_read transitions
    else
      let error_code = 1 in
      print_string "Error: The product automate must be deterministic.\n";
      exit error_code                     

(*Allow to verify if transitions have good format, else print accurately the error
and exit the program.*)
let rec check_transitions (transitions: automate_transition list) (map: string list NameTable.t): unit = 
  match transitions with
  | [] -> ()
  | transition :: subtransitions ->
    match transition with
    | (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) ->
      let value = (Char.escaped current_state) ^ (Char.escaped wanted_state) ^ (Char.escaped stack_topop) in
      if List.length listletter_toread > 0 && (NameTable.mem (List.hd listletter_toread) map) then
        let key = List.hd listletter_toread in
        let list_of_word = NameTable.find key map in
        if List.exists (fun x-> (String.sub x 0 1) = (String.sub value 0 1) && (String.sub x 1 1) <> (String.sub value 1 1)) list_of_word then
          let error_code = 1 in
          print_string "Error: The product automate must be deterministic.\n";
          exit error_code
        else
          let list_of_word = List.rev(value :: List.rev list_of_word) in
          let map = NameTable.add key list_of_word map in
            check_transitions subtransitions map
      else
        if List.length listletter_toread > 0 then
          let key = List.hd listletter_toread in
          let map = NameTable.add key [value] map in
          check_transitions subtransitions map
        else
          let key = ' ' in
          let map = NameTable.add key [value] map in
          check_transitions subtransitions map

(*Allow to verify if declarations have good format, else print accurately the error
and exit the program.*)
let check_declarations (declarations: automate_declarations): unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    if List.mem initial_state states then
      if List.mem initial_stack stack_symbols then
        ()
      else
        let error_code = 1 in
        print_string "Error: the initial stack symbol must be in symbols stack set.\n";
        exit error_code  
    else
      let error_code = 1 in
      print_string "Error: the initial state symbol must be in states set.\n";
      exit error_code

(*Allow to verify if automate has good format, else print accurately the error
and exit the program.*)
let check_automate (automate: automate): unit = 
  match automate with
  | Automate(declarations, transitions) ->
    check_declarations declarations;
    let map = NameTable.empty in
    check_transitions transitions map; 
    check_transitions_in_case_of_epsilon transitions transitions
  | Program(_,_) -> ()
