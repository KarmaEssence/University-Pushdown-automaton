open Prog
open Ast
open Gas6_utils

let print_declarations (declarations: declarations) : unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    print_string "Input symbols : ";
    print_stringlist input_symbols 0; 
    print_string "Stack symbols : ";
    print_stringlist stack_symbols 0;
    print_string "States : ";
    print_stringlist states 0;
    print_string ("Initial symbols : " ^ Char.escaped initial_state ^ "\n");
    print_string ("Initial stack : " ^ Char.escaped initial_stack ^ "\n\n")

  ;;

let print_program (program: program) : unit = 
  match program with
  | (declarations, transitions) ->
      print_declarations declarations;
      print_string "transitions :\n\n"; 
