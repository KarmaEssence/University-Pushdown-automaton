open Ast

let transition_has_good_format (current_state: string) (listletter_toread: string list) (stack_topop: string) (wanted_state: string): bool =
  ((List.length listletter_toread = 1 && String.length (List.nth listletter_toread 0) = 1) || 
  List.length listletter_toread = 0)
  && String.length current_state = 1 && String.length stack_topop = 1 && 
  String.length wanted_state = 1

let rec check_transitions (transitions: transition list) (map: string list NameTable.t): unit = 
  match transitions with
  | [] -> print_string "\n"
  | transition :: subtransitions ->
    match transition with
    | (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) ->
      if transition_has_good_format current_state listletter_toread stack_topop wanted_state then
        let value = current_state ^ wanted_state in
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
            let key = " " in
            let map = NameTable.add key [value] map in
            check_transitions subtransitions map
      else 
        let error_code = 1 in
        print_string "Erreur : Mauvais format de fichier.\n"; 
        exit error_code        

let string_list_has_good_format (list: string list): bool = List.for_all (fun x -> String.length x = 1) list

let declarations_has_good_format (input_symbols: string list) (stack_symbols: string list) (states: string list) (initial_state: string) (initial_stack: string): bool = 
  string_list_has_good_format input_symbols && string_list_has_good_format stack_symbols 
  && string_list_has_good_format states && String.length initial_state = 1 
  && String.length initial_stack = 1


let check_declarations (declarations: declarations): unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    if declarations_has_good_format input_symbols stack_symbols states initial_state initial_stack then
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
    else
      let error_code = 1 in
      print_string "Erreur : Mauvais format de fichier.\n"; 
      exit error_code   

let check_automate (automate: automate): unit = 
  match automate with
  | (declarations, transitions) ->
    check_declarations declarations;
    let map = NameTable.empty in
    check_transitions transitions map 

