(*****************************************************************************)

open Type

(*****************************************************************************)

(***********************************************************************)
(*                              check_ast                              *)  
(***********************************************************************)

(*Allow to verify if transitions have good format, else print accurately the error
and exit the program.*)
let rec check_transitions (transitions: transition list) (map: string list NameTable.t): unit = 
  match transitions with
  | [] -> print_string "\n"
  | transition :: subtransitions ->
    match transition with
    | (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) ->
      let value = (Char.escaped current_state) ^ (Char.escaped wanted_state) in
      if List.length listletter_toread > 0 && (NameTable.mem (List.hd listletter_toread) map) then
        let key = List.hd listletter_toread in
        let list_of_word = NameTable.find key map in
        if List.for_all (fun x-> (String.sub x 0 1) = (String.sub value 0 1) && x <> value) list_of_word then
          let error_code = 1 in
          print_string "L’automate doit être déterministe.\n";
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
let check_declarations (declarations: declarations): unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    if List.mem initial_state states then
      if List.mem initial_stack stack_symbols then
        ()
      else
        let error_code = 1 in
        print_string "Erreur : Le symbole de pile initial doit être dans l’ensemble des symboles de pile.\n";
        exit error_code  
    else
      let error_code = 1 in
      print_string "Erreur : L'état initial doit être un élément de l’ensemble des états.\n";
      exit error_code

(*Allow to verify if automate has good format, else print accurately the error
and exit the program.*)
let check_automate (automate: automate): unit = 
  match automate with
  | Automate(declarations, transitions) ->
    check_declarations declarations;
    let map = NameTable.empty in
    check_transitions transitions map 
  | Program(_,_) -> ()
