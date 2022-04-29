(***********************************************************************)
(*                                 ast                                 *)  
(***********************************************************************)

(*Program action instructions.*)
type action = 
| Push of char
| Pop
| Change of char
| Reject

(*Program next instructions.*)
type next = char * action list

(*Program top instructions.*)
type top = 
| Actions of char * action list
| Nexts of char * next list

(*Program transition instructions.*)
type program_transition = 
| Next of char * next list
| Top of char * top list

(*Automate transition.*)
type transition = char * char list * char * char * char list

(*Automate declarations.*)
type declarations = char list * char list * char list * char * char

(*Automate.*)
type automate = 
| Automate of declarations * transition list 
| Program of declarations * program_transition list

(*Char map.*)
module NameTable = Map.Make(Char)

(*String map*)
module StringNameTable = Map.Make(String)

(*To get declarations field from automate.*)
let get_declaration (automate: automate): declarations = 
  match automate with
  | Automate(declarations, _) -> declarations
  | Program(declarations, _) -> declarations

(*To get input symbols, stack symbols or states field from declarations.*)
let getSymbols (declarations: declarations) (flag: int): char list = 
  match declarations with
  | (inputs, stacks, states, _, _) ->
    if flag > 0 then
      if flag = 1 then states
      else stacks
    else inputs 

(*To get initial state or stack field from declarations.*)
let getInitials (declarations: declarations) (flag: int): char = 
  match declarations with
  | (_, _, _, state, stack) ->  
    if flag = 0 then state
    else stack      

(*To get transitions field from automate.*)
let getTransitionsList (automate: automate): transition list = 
  match automate with
  | Automate(_, transitions) -> transitions    
  | _ -> [] 

(*To get transitions field from automate.*)
let getProgramTransitionsList (automate: automate): program_transition list = 
  match automate with
  | Program(_, transitions) -> transitions    
  | _ -> []   


  
