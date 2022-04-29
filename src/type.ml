(***********************************************************************)
(*                                 ast                                 *)  
(***********************************************************************)

(*Program action instructions.*)
type program_action = 
| Push of char
| Pop
| Change of char
| Reject

(*Program next instructions.*)
type program_next = char * program_action list

(*Program top instructions.*)
type program_top = 
| Actions of char * program_action list
| Nexts of char * program_next list

(*Program transition instructions.*)
type program_transition = 
| Next of char * program_next list
| Top of char * program_top list

(*Automate transition.*)
type automate_transition = char * char list * char * char * char list

(*Automate declarations.*)
type automate_declarations = char list * char list * char list * char * char

(*Automate.*)
type automate = 
| Automate of automate_declarations * automate_transition list 
| Program of automate_declarations * program_transition list

(*Char map.*)
module NameTable = Map.Make(Char)

(*String map*)
module StringNameTable = Map.Make(String)

(*To get declarations field from automate.*)
let get_declaration (automate: automate): automate_declarations = 
  match automate with
  | Automate(declarations, _) -> declarations
  | Program(declarations, _) -> declarations

(*To get input symbols, stack symbols or states field from declarations.*)
let get_symbols (declarations: automate_declarations) (flag: int): char list = 
  match declarations with
  | (inputs, stacks, states, _, _) ->
    if flag > 0 then
      if flag = 1 then states
      else stacks
    else inputs 

(*To get initial state or stack field from declarations.*)
let get_initials (declarations: automate_declarations) (flag: int): char = 
  match declarations with
  | (_, _, _, state, stack) ->  
    if flag = 0 then state
    else stack      

(*To get transitions field from automate.*)
let get_transitions_list (automate: automate): automate_transition list = 
  match automate with
  | Automate(_, transitions) -> transitions    
  | _ -> [] 

(*To get transitions field from automate.*)
let get_program_transitions_list (automate: automate): program_transition list = 
  match automate with
  | Program(_, transitions) -> transitions    
  | _ -> []   


  
