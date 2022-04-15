open Ast

let rec print_word (list : string list): unit =
  match list with
  | [] -> print_string "\n"
  | element :: sublist ->
    print_string (element ^ " ");
    print_word sublist

let rec tranform_string_tolist_rec (word: string) (list: string list): string list = 
  if String.length word > 0 then
    let subword = String.sub word 1 ((String.length word)-1) in
    tranform_string_tolist_rec subword (String.sub word 0 1:: list)
  else
    list  

let tranform_string_tolist (word: string): string list =
    List.rev (tranform_string_tolist_rec word []) 

let eval_automate (ast: automate) (word: string): unit = 
  let map = NameTable.empty in
  let list_of_word = tranform_string_tolist word in
  (*print_string (word ^ "\n");
  print_word list_of_word*)
  let map = NameTable.add "word" list_of_word map in
  (*let map = NameTable.add "initial state"*)
  print_word (NameTable.find "word" map) 