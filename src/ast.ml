(***********************************************************************)
(*                                 ast                                 *)  
(***********************************************************************)

type transition = char * char list * char * char * char list

type declarations = char list * char list * char list * char * char

type automate = declarations * transition list 

module NameTable = Map.Make(Char)
module StringNameTable = Map.Make(String)

let get_declaration (automate: automate): declarations = 
  match automate with
  | (declarations, _) -> declarations

let getSymbols (declarations: declarations) (flag: int): char list = 
  match declarations with
  | (inputs, stacks, states, _, _) ->
    if flag > 0 then
      if flag = 1 then states
      else stacks
    else inputs 
    
let getInitials (declarations: declarations) (flag: int): char = 
  match declarations with
  | (_, _, _, state, stack) ->  
    if flag = 0 then state
    else stack      

let getTransitionsList (automate: automate): transition list = 
  match automate with
  | (_, transitions) -> transitions      


  
