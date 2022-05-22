(***********************************************************************)
(*                             gas6_utils                              *)  
(***********************************************************************)

(*To make 'num' space.*)
let rec make_space (num: int) (res: string): string = 
  if num < 1 then res
  else make_space (num - 1) (res ^ " ")


(*Print the content of the list.*)
let rec print_stringlist (list : string list) (flag : int): unit =
  match list with 
  | [] -> 
    if flag == 0 then
      print_string "\n"
    else
      print_string ""  
  | element :: sublist -> 
      if flag = 3 then
        if List.length sublist = 0 then
          let to_print = element in
          print_string (to_print);
          print_stringlist sublist flag
        else  
          let to_print = element in
          print_string (to_print ^ ",");
          print_stringlist sublist flag
      else  
        let to_print = element in
        print_string (to_print ^ " ");
        print_stringlist sublist flag
      

(*Return the list without the last word.*)      
let list_without_last_word (list : char list): char list = 
  List.rev (List.tl (List.rev list)) 
  
(*Clear the list from all digit (state).*)  
let rec list_without_state (states: char list) (actions: char list) (newactions: char list): char list =
  match actions with
  | [] -> List.rev newactions
  | element :: subactions ->
    if List.mem element states then
      list_without_state states subactions newactions
    else
      list_without_state states subactions (element :: newactions) 

(*If the list is not empty, include the initial stack symbol at the begin of the list.*)      
let rec add_stack_symbol (actions: char list) (stack_symbol: char) : char list = 
  if List.length actions > 0 then stack_symbol :: actions
  else []     
  
(*Sort the list in function of the initial stack symbol.*)  
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

(*Allow to verify if all string of the list are a length superior or egal to one.*)      
let string_has_one_char (symbols: string list): bool = List.for_all(fun x -> String.length x == 1) symbols      