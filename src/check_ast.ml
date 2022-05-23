(*****************************************************************************)

open Type
open Print_ast
open Gas6_utils 

(*****************************************************************************)

(***********************************************************************)
(*                              check_ast                              *)  
(***********************************************************************)

(*Allow to verify if one transition of list is correct with other*)
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

(*Allow to verify if all transitions of list is correct with other*)        
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


let get_string_from_list (listletter_toread: string list): string =
  if List.length listletter_toread == 0 then "" else List.hd listletter_toread  

(*Allow to verify if transitions have good format, else print accurately the error
and exit the program.*)
let rec check_transitions (transitions: automate_transition list) (map: (string list) list StringNameTable.t): unit = 
  match transitions with
  | [] -> ()
  | (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) :: subtransitions ->
    let value = [current_state;get_string_from_list listletter_toread;stack_topop;wanted_state] in
    let value = value @ list_stack_topush in
    if List.length listletter_toread > 0 && (StringNameTable.mem (List.hd(listletter_toread)) map) then
      let key = List.hd listletter_toread in
      let list_of_word = StringNameTable.find key map in
      if List.exists (fun x-> (List.nth x 0) = (List.nth value 0) && (List.nth x 2) = (List.nth value 2)) list_of_word then
        let error_code = 1 in
        print_string "Error: The product automate must be deterministic.\n";
        print_string "Reason: There are two transitions for a same letter and a same symbol in the top of the stack.\n\n";
        print_string "1) ";
        print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
        print_string "2) ";
        print_stringlist (List.find (fun x-> (List.nth x 0) = (List.nth value 0) && (List.nth x 2) = (List.nth value 2)) list_of_word) 0;
        exit error_code
      else
        let list_of_word = List.rev(value :: List.rev list_of_word) in
        let map = StringNameTable.add key list_of_word map in
          check_transitions subtransitions map
    else
      if List.length listletter_toread > 0 then
        let key = List.hd listletter_toread in
        let map = StringNameTable.add key [value] map in
        check_transitions subtransitions map
      else
        let key = " " in
        let map = StringNameTable.add key [value] map in
        check_transitions subtransitions map

(*Print the error with the transition which create this one.*)        
let display_error_transition_data (declarations: automate_declarations) (transition: automate_transition) (flag: int): unit =
  match transition with
  | (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) ->
    if flag <> 0 then
      if flag <> 1 then
        if flag <> 2 then
          if flag <> 3 then
            if flag <> 4 then
              if flag <> 5 then
                ()
              else
                let find_error = List.find (fun x -> not (List.mem x (get_symbols declarations 2))) list_stack_topush in
                let error_code = 1 in
                print_string "Error: in transition: ";
                print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
                print_string ("The symbol to add in the stack " ^ find_error ^ " is not in list of stack symbols [");
                print_stringlist (get_symbols declarations 2) 3;
                print_string "]\n";
                exit error_code 

            else
              let error_code = 1 in
              print_string "Error: in transition: ";
              print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
              print_string ("The top symbol of the stack " ^ stack_topop ^ " is not in list of stack symbols [");
              print_stringlist (get_symbols declarations 2) 3;
              print_string "]\n";
              exit error_code  
          else
            let error_code = 1 in
            print_string "Error: in transition: ";
            print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
            print_string ("The letter to read " ^ List.hd listletter_toread ^ " is not in list of input symbols [");
            print_stringlist (get_symbols declarations 0) 3;
            print_string "]\n";
            exit error_code
        else
          let error_code = 1 in
          print_string "Error: in transition: ";
          print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
          print_string ("The length of letter to read [");
          print_stringlist listletter_toread 3;
          print_string ("] must be one or zero (Choose between : " ^ List.hd listletter_toread ^ " or nothing)\n");
          exit error_code       
      else 
        let error_code = 1 in
        print_string "Error: in transition: ";
        print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
        print_string ("The end state " ^ wanted_state ^ " is not in list of state [");
        print_stringlist (get_symbols declarations 1) 3;
        print_string "]\n";
        exit error_code 
    else  
      let error_code = 1 in
      print_string "Error: in transition: ";
      print_transitions [(current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush)];
      print_string ("The start state " ^ current_state ^ " is not in list of state [");
      print_stringlist (get_symbols declarations 1) 3;
      print_string "]\n";
      exit error_code

(*Check all symbol inside all transitions?*)      
let rec check_transitions_data (declarations: automate_declarations) (transitions: automate_transition list): unit =
  match transitions with
  | [] -> ()
  | (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) :: subtransitions ->
    let input_symbols = (get_symbols declarations 0) in 
    let states = (get_symbols declarations 1) in
    let input_stacks = (get_symbols declarations 2) in
    if List.mem current_state states then
      if List.mem wanted_state states then
        if List.length listletter_toread < 2 then
          if List.length listletter_toread == 0 || List.mem (List.hd listletter_toread) input_symbols then
            if List.mem stack_topop input_stacks then
              if List.for_all(fun x -> List.mem x input_stacks) list_stack_topush then
                check_transitions_data declarations subtransitions
                else
                  display_error_transition_data declarations (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) 5  
              else
                display_error_transition_data declarations (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) 4     
          else   
            display_error_transition_data declarations (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) 3
        else
          display_error_transition_data declarations (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) 2
      else
        display_error_transition_data declarations (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) 1
    else
      display_error_transition_data declarations (current_state, listletter_toread, stack_topop, wanted_state, list_stack_topush) 0  

(*Print accurately the error and exit the program in case of wrong format of declaration.*)
let display_error_declaration_data (declarations: automate_declarations) (flag: int): unit =
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    if flag <> 0 then
      if flag <> 1 then
        if flag <> 2 then
          if flag <> 3 then
            ()
          else
            let error_code = 1 in
            print_string ("Error: the initial stack " ^ initial_stack ^ " must be in symbols stack set ([");
            print_stringlist stack_symbols 3;
            print_string "]).\n";
            exit error_code
        else
          let error_code = 1 in
            print_string ("Error: the initial state " ^ initial_state ^ " must be in symbols state set ([");
            print_stringlist states 3;
            print_string "]).\n";
            exit error_code
      else
        let error_code = 1 in
        let find_error = List.find(fun x -> String.length x <> 1) stack_symbols in
        print_string "Error: in stack symbols (declarations): [";
        print_stringlist stack_symbols 3; 
        print_string ("]\nThe size of " ^ find_error ^ " must be one character (" 
        ^ find_error ^ " -> " ^ String.sub find_error 0 1 ^ ").\n");
        exit error_code    
    else
      let error_code = 1 in
      let find_error = List.find(fun x -> String.length x <> 1) input_symbols in
      print_string "Error: in input symbols (declarations): [";
      print_stringlist input_symbols 3; 
      print_string ("]\nThe size of " ^ find_error ^ " must be one character (" 
      ^ find_error ^ " -> " ^ String.sub find_error 0 1 ^ ").\n");
      exit error_code    

(*Allow to verify if declarations have good format, else print accurately the error
and exit the program.*)
let check_declarations_data (declarations: automate_declarations): unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    if string_has_one_char input_symbols then
      if string_has_one_char stack_symbols then
        if List.mem initial_state states then
          if List.mem initial_stack stack_symbols then
            ()
          else
            display_error_declaration_data (input_symbols, stack_symbols, states, initial_state, initial_stack) 3    
        else
          display_error_declaration_data (input_symbols, stack_symbols, states, initial_state, initial_stack) 2    
      else  
        display_error_declaration_data (input_symbols, stack_symbols, states, initial_state, initial_stack) 1
    else
      display_error_declaration_data (input_symbols, stack_symbols, states, initial_state, initial_stack) 0   

(*Allow to verify if automate has good format, else print accurately the error
and exit the program.*)
let check_automate (automate: automate): unit = 
  match automate with
  | Automate(declarations, transitions) ->
    check_declarations_data declarations;
    check_transitions_data declarations transitions;
    let map = StringNameTable.empty in
    check_transitions transitions map; 
    check_transitions_in_case_of_epsilon transitions transitions
  | Program(_,_) -> ()
