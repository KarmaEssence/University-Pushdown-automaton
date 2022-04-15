let rec print_stringlist (list : string list) (flag : int): unit =
  match list with 
  | [] -> 
    if flag == 0 then
      print_string "\n"
    else
      print_string ""  
  | element :: sublist -> 
      print_string (element ^ " ");
      print_stringlist sublist flag

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