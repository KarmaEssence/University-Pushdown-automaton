open Ast

let rec print_word (list : string list): unit =
  match list with
  | [] -> print_string "\n"
  | element :: sublist ->
    print_string (element ^ "");
    print_word sublist

let print_actual_position (word: string) (map: string list NameTable.t): unit = 
  print_string "\n";
  print_string ("Mot à lire : " ^ word ^ "\n");
  (*print_word (NameTable.find "word" map);*)
  print_string "Etat courant : ";
  let list_of_states = NameTable.find "states" map in
  print_string ((List.nth list_of_states ((List.length list_of_states)-1)) ^ "\n");
  print_string "Elément dans la pile : ";
  print_word (NameTable.find "stacks" map);
  print_string "\n"
 
let rec list_without_last_word (list_of_word : string list) (iteration : int) (res_list : string list) : string list = 
  match list_of_word with
  | [] -> res_list
  | word::sub_list_of_word ->
    if iteration = List.length list_of_word - 1 then
      list_without_last_word [] iteration res_list
    else 
      list_without_last_word sub_list_of_word (iteration + 1) (word :: res_list)
      
let list_without_last_word_clean (list_of_word : string list): string list = 
  let list = list_without_last_word list_of_word 0 [] in
  List.rev list
  
let update_map (list_of_states: string list) (list_of_stacks: string list) (map: string list NameTable.t): string list NameTable.t = 
  let map = NameTable.add "states" list_of_states map in
  NameTable.add "stacks" list_of_stacks map   


let rec test_automate_with_char (transitions: transition list) (map: string list NameTable.t) (element: string): string list NameTable.t =
  match (transitions) with
  | [] -> 
    if String.length element > 0 then
      let error_code = 1 in
      print_string ("Erreur: l'élément " ^ element ^ " ne peut pas etre lu\n");
      exit error_code
    else
      map  
  | transition :: subtransitions ->
    match transition with
    | (current_state, listletter_toread, stack_topop, state_wanted, list_stack_topush) ->
      let list_of_states = NameTable.find "states" map in
      let list_of_stacks = NameTable.find "stacks" map in
      let letter_toread = List.nth listletter_toread 0 in
      if (List.nth list_of_states ((List.length list_of_states)-1)) = current_state &&
          (List.nth list_of_stacks ((List.length list_of_stacks)-1)) = stack_topop &&
          element = letter_toread then
          
          let list_of_states = List.rev(state_wanted :: List.rev list_of_states) in
          if List.length list_stack_topush > 0 then
            let list_of_stacks = list_of_stacks @ list_stack_topush in
            update_map list_of_states list_of_stacks map
          else  
            let list_of_stacks = list_without_last_word_clean list_of_stacks in
            update_map list_of_states list_of_stacks map
            

      else
        test_automate_with_char subtransitions map element
          
let rec test_automate_with_word (automate: automate) (map: string list NameTable.t) (word: string): unit = 
  print_actual_position word map;
  if String.length word > 0 then
    let subword = String.sub word 1 ((String.length word)-1) in
    let map = test_automate_with_char (getTransitionsList automate) map (String.sub word 0 1) in
    test_automate_with_word automate map subword
  else
    print_string "Analyse du mot réussie !\n" 

(*let rec tranform_string_tolist_rec (word: string) (list: string list): string list = 
  if String.length word > 0 then
    let subword = String.sub word 1 ((String.length word)-1) in
    tranform_string_tolist_rec subword (String.sub word 0 1:: list)
  else
    list  

let tranform_string_tolist (word: string): string list =
    List.rev (tranform_string_tolist_rec word []) *)

let eval_automate (automate: automate) (word: string): unit = 
  let map = NameTable.empty in
  (*let list_of_word = tranform_string_tolist word in
  print_string (word ^ "\n");
  print_word list_of_word*)
  (*let map = NameTable.add "word" list_of_word map in*)
  let map = NameTable.add "states" [getInitials automate 0] map in
  let map = NameTable.add "stacks" [getInitials automate 1] map in
  (*print_word (NameTable.find "word" map);
  print_word (NameTable.find "states" map);
  (*print_string ((NameTable.find "current_state" map) ^ "\n");*)
  print_word (NameTable.find "stacks" map)*)
  test_automate_with_word automate map word