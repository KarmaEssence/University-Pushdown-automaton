type stack =
  | Empty
  | Letters of char list

type charactercouldbeempty = 
  | Empty
  | Letter of char

type transition = string * string * string * string * string list

(*type translist = transition *)

type transitions = transition list (*translist list*)

type initials = string

type declarationsinputs = string list

type declarations = declarationsinputs * declarationsinputs * declarationsinputs * initials * initials

type automate = declarations * transitions

let rec print_declarationsinputs (list : string list) : unit =
  match list with 
  | [] -> print_string "\n"
  | element :: sublist -> 
      print_string (element ^ " ");
      print_declarationsinputs sublist
  ;; 

let rec print_stringlist (list : string list) : unit =
  match list with 
  | [] -> print_string "\n"
  | element :: sublist -> 
      print_string (element ^ " ");
      print_declarationsinputs sublist
  ;;  

let rec print_translist (translist: transition list) : unit = 
  match translist with
  | [] -> print_string "\n"
  | (a, b, c, d, e) :: sublist ->
    print_string (a ^ " " ^ b ^ " " ^ c ^ " " ^ d ^ " ");
    print_stringlist e;
    print_translist sublist
  ;;  
  
let print_transitions (transitions: transitions) : unit = 
  match transitions with
  | (translist) ->
    print_translist translist
  ;;  

let print_declarations (declarations: declarations) : unit = 
  match declarations with
  | (input_symbols, stack_symbols, states, initial_state, initial_stack) ->
    print_string "Input symbols : ";
    print_declarationsinputs input_symbols;
    print_string "Stack symbols : ";
    print_declarationsinputs stack_symbols;
    print_string "States : ";
    print_declarationsinputs states;
    print_string ("Initial symbols : " ^ initial_state ^ "\n");
    print_string ("Initial stack : " ^ initial_stack ^ "\n")

  ;;  

let print_automate (ast: automate) : unit =
  match ast with
  | (declarations, transitions) ->
    print_declarations declarations;
    print_transitions transitions



  
