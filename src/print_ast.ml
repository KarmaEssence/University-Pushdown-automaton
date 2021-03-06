(*****************************************************************************)

open Type
open Gas6_utils 

(*****************************************************************************)

(***********************************************************************)
(*                            print usage                              *)  
(***********************************************************************)

(*Print the options.*)    
let usage () =
  print_string "\n";
  print_string "Program options : \n";
  print_string "./main -eval--phase-1 <file> <mot> : évalutation de l'automate à l'aide d'un mot\n";
  print_string "./main -eval--phase-3 <file> <mot> : évalutation du programme à l'aide d'un mot\n";
  print_string "./main -print--phase-1 <file> : affichage de l'automate dans le terminal\n";
  print_string "./main -print--phase-3 <file> : affichage du programme dans le terminal\n";
  print_string "\n"

(*Print automate declaration format.*)
let automate_declaration_usage () =
  print_string "\n";
  print_string "input symbols: <input_symbol_1>, etc...\n";
  print_string "stack symbols: <stack_symbol_1>, etc...\n";
  print_string "states: <states>, etc...\n";
  print_string "initial state: <initial_state>\n";
  print_string "initial stack: <initial_stack>\n";
  print_string "\n"

(*Print automate format.*)  
let automate_usage () = 
  print_string "\n";
  print_string "How to write automate in file ? (example of phase 1 format)\n";
  automate_declaration_usage ();
  print_string "transitions:\n";
  print_string "\n";
  print_string "(<current state>, <letter to read>, <current stack symbol>, <wanted state>, <other stacks symbols>)\n";
  print_string ((make_space 50 "") ^ ".\n" ^ (make_space 50 "") ^ ".\n" ^ (make_space 50 "") ^ ".\n");
  print_string "\n"

(*Print program format.*)  
let program_usage () = 
  print_string "\n";
  print_string "How to write automate in file ? (example of phase 3 format)\n";
  automate_declaration_usage ();
  print_string "program:\n";
  print_string ((make_space 2 "") ^ "case state of\n");
  print_string ((make_space 4 "") ^ "1: begin\n ");
  print_string ((make_space 7 "") ^ "case next of\n");
  print_string ((make_space 9 "") ^ "a: <actions> end\n");
  print_string ((make_space 9 "") ^ ".\n" ^ (make_space 9 "") ^ ".\n" ^ (make_space 9 "") ^ ".\n");
  print_string ((make_space 7 "") ^ "end\n");
  print_string ((make_space 4 "") ^ "2: begin\n ");
  print_string ((make_space 7 "") ^ "case top of\n");
  print_string ((make_space 9 "") ^ "A: begin case next of a : <actions> end\n");
  print_string ((make_space 9 "") ^ ".\n" ^ (make_space 9 "") ^ ".\n" ^ (make_space 9 "") ^ ".\n");
  print_string ((make_space 7 "") ^ "end\n");
  print_string "\n"

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