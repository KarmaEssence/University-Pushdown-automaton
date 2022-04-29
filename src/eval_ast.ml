(*****************************************************************************)

open Type
open Gas6_utils

(*****************************************************************************)

(***********************************************************************)
(*                              eval_ast                               *)  
(***********************************************************************)

(*Print all stape of the execution of eval option.*)
let print_actual_position (word: string) (map: char list StringNameTable.t): unit = 
  print_string "\n";
  print_string ("Mot à lire : " ^ word ^ "\n");
  print_string "Etat courant : ";
  let list_of_states = StringNameTable.find "states" map in
  print_string (Char.escaped (List.nth list_of_states ((List.length list_of_states)-1)) ^ "\n");
  print_string "Elément dans la pile : ";
  print_stringlist (StringNameTable.find "stacks" map) 0;
  print_string "\n"
  
(*Updating of the map.*)  
let update_map (list_of_states: char list) (list_of_stacks: char list) 
(map: char list StringNameTable.t): char list StringNameTable.t = 
  let map = StringNameTable.add "states" list_of_states map in
  StringNameTable.add "stacks" list_of_stacks map   

(*Test an automate with an char, return a char map if the run has succeed,
else print a message and terminate the execution.*)
let rec test_automate_with_char (transitions: automate_transition list)
 (map: char list StringNameTable.t) (element: char): char list StringNameTable.t =
  match (transitions) with
  | [] -> 
      let error_code = 1 in
      print_string ("Erreur: Aucune transition n'est applicable pour la lettre " ^ Char.escaped element ^ ".\n");
      exit error_code 
  | transition :: subtransitions ->
    match transition with
    | (current_state, listletter_toread, stack_topop, state_wanted, list_stack_topush) ->
      let list_of_states = StringNameTable.find "states" map in
      let list_of_stacks = StringNameTable.find "stacks" map in
      
      if List.hd (List.rev list_of_states) = current_state &&
         List.hd (List.rev list_of_stacks) = stack_topop && 
         ((List.length listletter_toread = 0  && element = ' ') || 
         (List.length listletter_toread > 0 && element = List.hd listletter_toread)) then
          
          let list_of_states = List.rev(state_wanted :: List.rev list_of_states) in
          if List.length list_stack_topush > 0 then
            if List.length list_stack_topush > 1 then
              let list_of_stacks = list_of_stacks @ (List.tl list_stack_topush) in
              update_map list_of_states list_of_stacks map
            else 
              update_map list_of_states list_of_stacks map  
          else  
            let list_of_stacks = list_without_last_word list_of_stacks in
            update_map list_of_states list_of_stacks map
            

      else
        test_automate_with_char subtransitions map element

(*Test an automate with a word, return nothing if the run has succeed,
else print a message and terminate the execution.*)        
let rec test_automate_with_word (automate: automate) (map: char list StringNameTable.t)
 (word: string): unit = 
  print_actual_position word map;
  if String.length word > 0 then
    if List.length (StringNameTable.find "stacks" map) < 1 then
      print_string "Erreur: La pile est vide sans que l’entrée soit épuisée.\n" 
    else
      let subword = String.sub word 1 ((String.length word)-1) in
      let map = test_automate_with_char (get_transitions_list automate) map (String.get word 0) in
      test_automate_with_word automate map subword
  else
    if List.length (StringNameTable.find "stacks" map) > 0 then
      print_string "Erreur: L'entrée est épuisée sans que la pile soit vide.\n" 
    else   
      print_string "Analyse du mot réussie !\n"

(*To evaluate an automate.*)      
let eval_automate (automate: automate) (word: string): unit = 
  let declarations = get_declaration automate in 
  let map = StringNameTable.empty in
  let map = StringNameTable.add "states" [get_initials declarations 0] map in
  let map = StringNameTable.add "stacks" [get_initials declarations 1] map in
  test_automate_with_word automate map word