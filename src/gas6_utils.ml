(***********************************************************************)
(*                             gas6_utils                              *)  
(***********************************************************************)

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
  
let rec list_without_state (states: char list) (actions: char list) (newactions: char list): char list =
  match actions with
  | [] -> List.rev newactions
  | element :: subactions ->
    if List.mem element states then
      list_without_state states subactions newactions
    else
      list_without_state states subactions (element :: newactions) 
      
let rec add_stack_symbol (actions: char list) (stack_symbol: char) : char list = 
  if List.length actions > 0 then stack_symbol :: actions
  else []     
  
let rec initial_stack_priority (list: char list) (stack_symbol: char) (reslist: char list): char list = 
  match list with
  | [] -> List.rev reslist
  | element :: sublist ->
    if element = stack_symbol then
      initial_stack_priority sublist stack_symbol reslist
    else if List.length reslist = 0 then 
      initial_stack_priority sublist stack_symbol (element :: stack_symbol :: reslist)
    else 
      initial_stack_priority sublist stack_symbol (element :: reslist) 