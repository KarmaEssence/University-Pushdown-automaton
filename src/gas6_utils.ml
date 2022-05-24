(***********************************************************************)

open Type

(***********************************************************************)
(*                             gas6_utils                              *)  
(***********************************************************************)

(*To make 'num' space.*)
let rec make_space (num: int) (res: string): string = 
  if num < 1 then res
  else make_space (num - 1) (res ^ " ")
;;  


(*Print the content of the list.*)
let rec print_stringlist (list : string list) (flag : int): unit =
  match list with 
  | [] -> 
    if flag == 0 then
      print_string "\n"
    else
      print_string ""  
  | element :: sublist -> 
      if flag >= 3 then
        if List.length sublist = 0 then
          let to_print = element in
          print_string (to_print);
          print_stringlist sublist flag
        else  
          if flag = 3 then
            let to_print = element in
            print_string (to_print ^ ",");
            print_stringlist sublist flag
          else
            let to_print = element in
            print_string (to_print ^ ";");
            print_stringlist sublist flag 
      else  
        if List.length sublist = 0 then
          let to_print = element in
          print_string (to_print);
          print_stringlist sublist flag
        else 
          let to_print = element in
          print_string (to_print ^ " ");
          print_stringlist sublist flag
;; 

let rec print_special_string_list (list: string list) (iteration: int): unit =
  match list with 
  | [] -> () 
  | element :: sub_list ->
    if List.length sub_list > 0 then
      if iteration > 0 then
        let to_print = element in
        print_string (to_print ^ ",");
        print_special_string_list sub_list (iteration-1)
      else 
        let to_print = element in
        print_string (to_print ^ ";");
        print_special_string_list sub_list 0  
    else
      let to_print = element in
      print_string (to_print);
      print_special_string_list [] 0   

(*Return the list without the last word.*)      
let list_without_last_word (list : string list): string list = 
  List.rev (List.tl (List.rev list)) 
;;  
  
(*Clear the list from all digit (state).*)  
let rec list_without_state (states: string list) (actions: string list) (newactions: string list): string list =
  match actions with
  | [] -> List.rev newactions
  | element :: subactions ->
    if List.mem element states then
      list_without_state states subactions newactions
    else
      list_without_state states subactions (element :: newactions) 
;;

(*If the list is not empty, include the initial stack symbol at the begin of the list.*)      
let rec add_stack_symbol (actions: string list) (stack_symbol: string) : string list = 
  if List.length actions > 0 then stack_symbol :: actions
  else []
;;       
  
(*Sort the list in function of the initial stack symbol.*)  
let rec initial_stack_priority (list: string list) (stack_symbol: string) (reslist: string list): string list = 
  match list with
  | [] -> List.rev reslist
  | element :: sublist ->
    if element = stack_symbol then
      initial_stack_priority sublist stack_symbol reslist
    else if List.length reslist = 0 then 
      initial_stack_priority sublist stack_symbol (element :: stack_symbol :: reslist)
    else 
      initial_stack_priority sublist stack_symbol (element :: reslist)
;;

(*Allow to verify if all string of the list are a length superior or egal to one.*)      
let string_has_one_char (symbols: string list): bool = List.for_all(fun x -> String.length x == 1 || x = "REJECT") symbols      
;;

(*Get only the first element from the list if this one exist, else return ""*)
let get_string_from_list (list: string list): string =
  if List.length list == 0 then "" else List.hd list 
;;

(*Removes "REJECT" from the stack set.*)  
let rec remove_reject_from_list (list: string list) (list_res: string list): string list = 
  match list with
  | [] -> List.rev list_res
  | element :: sub_list ->
    if element = "REJECT" then
      remove_reject_from_list sub_list list_res
    else
      remove_reject_from_list sub_list (element :: list_res)
;;

(*Avoid to add reject in automate file (phase-1).*)      
let leave_reject_from_automate (automate: automate): automate =
  match automate with
  | Automate(declarations, transitions) -> 
    let inputs_symbol = (get_symbols declarations 0) in
    let stack_symbol = remove_reject_from_list (get_symbols declarations 2) [] in
    let states = (get_symbols declarations 1) in
    let initial_state = (get_initials declarations 0) in
    let initial_stack = (get_initials declarations 1) in 
    let declarations = inputs_symbol, stack_symbol, states, initial_state, initial_stack in
    Automate(declarations, transitions) 
  | _ -> automate   
;;  