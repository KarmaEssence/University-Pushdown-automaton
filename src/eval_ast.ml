open Ast
open Gas6_utils

let print_actual_position (word: string) (map: string list NameTable.t): unit = 
  print_string "\n";
  print_string ("Mot à lire : " ^ word ^ "\n");
  print_string "Etat courant : ";
  let list_of_states = NameTable.find "states" map in
  print_string ((List.nth list_of_states ((List.length list_of_states)-1)) ^ "\n");
  print_string "Elément dans la pile : ";
  print_stringlist (NameTable.find "stacks" map) 0;
  print_string "\n"
  
let update_map (list_of_states: string list) (list_of_stacks: string list) (map: string list NameTable.t): string list NameTable.t = 
  let map = NameTable.add "states" list_of_states map in
  NameTable.add "stacks" list_of_stacks map   


let rec test_automate_with_char (transitions: transition list) (map: string list NameTable.t) (element: string): string list NameTable.t =
  match (transitions) with
  | [] -> 
    if String.length element > 0 then
      let error_code = 1 in
      print_string ("Erreur: Aucune transition n'est applicable pour la lettre " ^ element ^ "\n");
      exit error_code
    else
      map  
  | transition :: subtransitions ->
    match transition with
    | (current_state, listletter_toread, stack_topop, state_wanted, list_stack_topush) ->
      let list_of_states = NameTable.find "states" map in
      let list_of_stacks = NameTable.find "stacks" map in
      if (List.nth list_of_states ((List.length list_of_states)-1)) = current_state &&
          (List.nth list_of_stacks ((List.length list_of_stacks)-1)) = stack_topop &&
          ((List.length listletter_toread = 0  && element = " ") 
          || (element = List.nth listletter_toread 0)) then
            

          let list_of_states = List.rev(state_wanted :: List.rev list_of_states) in
          if List.length list_stack_topush > 0 then
            if List.length list_stack_topush > 1 then
              let list_of_stacks = list_of_stacks @ list_stack_topush in
              update_map list_of_states list_of_stacks map
            else 
              update_map list_of_states list_of_stacks map  
          else  
            let list_of_stacks = list_without_last_word_clean list_of_stacks in
            update_map list_of_states list_of_stacks map
            

      else
        test_automate_with_char subtransitions map element
          
let rec test_automate_with_word (automate: automate) (map: string list NameTable.t) (word: string): unit = 
  print_actual_position word map;
  if String.length word > 0 then
    if List.length (NameTable.find "stacks" map) < 1 then
      print_string "Erreur: La pile est vide sans que l’entrée soit épuisée.\n" 
    else
      let subword = String.sub word 1 ((String.length word)-1) in
      let map = test_automate_with_char (getTransitionsList automate) map (String.sub word 0 1) in
      test_automate_with_word automate map subword
  else
    if List.length (NameTable.find "stacks" map) > 0 then
      print_string "Erreur: L'entrée est épuisée sans que la pile soit vide\n" 
    else   
      print_string "Analyse du mot réussie !\n"

let eval_automate (automate: automate) (word: string): unit = 
  let map = NameTable.empty in
  let map = NameTable.add "states" [getInitials automate 0] map in
  let map = NameTable.add "stacks" [getInitials automate 1] map in
  test_automate_with_word automate map word