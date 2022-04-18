let rec print_stringlist (list : char list) (flag : int): unit =
  match list with 
  | [] -> 
    if flag == 0 then
      print_string "\n"
    else
      print_string ""  
  | element :: sublist -> 
      print_string (Char.escaped element ^ " ");
      print_stringlist sublist flag
        
let list_without_last_word (list : char list): char list = 
  List.rev (List.tl (List.rev list))   