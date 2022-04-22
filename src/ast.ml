(***********************************************************************)
(*                                 ast                                 *)  
(***********************************************************************)

(*Automate transition.*)
type transition = char * char list * char * char * char list

(*Automate declarations.*)
type declarations = char list * char list * char list * char * char

(*Automate.*)
type automate = declarations * transition list 

(*Char map.*)
module NameTable = Map.Make(Char)

(*String map*)
module StringNameTable = Map.Make(String)

(*To get declarations field from automate.*)
let get_declaration (automate: automate): declarations = 
  match automate with
  | (declarations, _) -> declarations

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
  | (_, transitions) -> transitions      


  
