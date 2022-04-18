open Ast
open Gas6_utils

let print_actual_position (word: string) (map: char list StringNameTable.t): unit = 
  print_string "\n";
  print_string ("Mot à lire : " ^ word ^ "\n");
  print_string "Etat courant : ";
  let list_of_states = StringNameTable.find "states" map in
  print_string (Char.escaped (List.nth list_of_states ((List.length list_of_states)-1)) ^ "\n");
  print_string "Elément dans la pile : ";
  print_stringlist (StringNameTable.find "stacks" map) 0;
  print_string "\n"
  
let update_map (list_of_states: char list) (list_of_stacks: char list) (map: char list StringNameTable.t): char list StringNameTable.t = 
  let map = StringNameTable.add "states" list_of_states map in
  StringNameTable.add "stacks" list_of_stacks map   


let rec test_automate_with_char (transitions: transition list) (map: char list StringNameTable.t) (element: char): char list StringNameTable.t =
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
      (*print_string "\nstate : ";
      print_int (List.length list_of_states);
      print_string "\n--\nstack : ";
      print_int (List.length listletter_toread);*)
      (*print_string "\n";
      print_char current_state;
      print_char (state_wanted);
      print_char (stack_topop);*)
      (*print_int (List.length list_of_stacks);*)
      print_string "\n";
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
          
let rec test_automate_with_word (automate: automate) (map: char list StringNameTable.t) (word: string): unit = 
  print_actual_position word map;
  if String.length word > 0 then
    if List.length (StringNameTable.find "stacks" map) < 1 then
      print_string "Erreur: La pile est vide sans que l’entrée soit épuisée.\n" 
    else
      let subword = String.sub word 1 ((String.length word)-1) in
      let map = test_automate_with_char (getTransitionsList automate) map (String.get word 0) in
      test_automate_with_word automate map subword
  else
    if List.length (StringNameTable.find "stacks" map) > 0 then
      print_string "Erreur: L'entrée est épuisée sans que la pile soit vide.\n" 
    else   
      print_string "Analyse du mot réussie !\n"

let eval_automate (automate: automate) (word: string): unit = 
  let map = StringNameTable.empty in
  let map = StringNameTable.add "states" [getInitials automate 0] map in
  let map = StringNameTable.add "stacks" [getInitials automate 1] map in
  test_automate_with_word automate map word