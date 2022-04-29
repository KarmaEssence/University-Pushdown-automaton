(*****************************************************************************)

open Type
open Gas6_utils 

(*****************************************************************************)

(***********************************************************************)
(*                              print_ast                              *)  
(***********************************************************************)

(*Print the automate transitions.*)
let rec print_transitions (transitions: automate_transition list) : unit = 
  match transitions with
  | [] -> print_string "\n"
  | (a, b, c, d, e) :: sublist ->
    print_string (Char.escaped a ^ " ");
    print_stringlist b 1;
    print_string (Char.escaped c ^ " " ^ Char.escaped d ^ " ");
    print_stringlist e 0;
    print_transitions sublist
  ;;  

(*Print the automate declarations.*)  
let print_declarations (declarations: automate_declarations) : unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    print_string "Input symbols : ";
    print_stringlist input_symbols 0; 
    print_string "Stack symbols : ";
    print_stringlist stack_symbols 0;
    print_string "States : ";
    print_stringlist states 0;
    print_string ("Initial state : " ^ Char.escaped initial_state ^ "\n");
    print_string ("Initial stack : " ^ Char.escaped initial_stack ^ "\n\n")

  ;;  

(*Print the automate.*)   
let print_automate (automate: automate) : unit =
  match automate with
  | Automate(declarations, transitions) ->
    print_declarations declarations;
    print_string "transitions :\n\n";
    print_transitions transitions
  | Program(_,_) -> ()     