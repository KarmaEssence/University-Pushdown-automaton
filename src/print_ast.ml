open Ast 

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
  ;;  

let rec print_transitions (transitions: transition list) : unit = 
  match transitions with
  | [] -> print_string "\n"
  | (a, b, c, d, e) :: sublist ->
    print_string (a ^ " ");
    print_stringlist b 1;
    print_string (c ^ " " ^ d ^ " ");
    print_stringlist e 0;
    print_transitions sublist
  ;;  

let print_declarations (declarations: declarations) : unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    print_string "Input symbols : ";
    print_stringlist input_symbols 0; 
    print_string "Stack symbols : ";
    print_stringlist stack_symbols 0;
    print_string "States : ";
    print_stringlist states 0;
    print_string ("Initial symbols : " ^ initial_state ^ "\n");
    print_string ("Initial stack : " ^ initial_stack ^ "\n")

  ;;  

let print_automate (ast: automate) : unit =
  match ast with
  | (declarations, transitions) ->
    print_declarations declarations;
    print_transitions transitions