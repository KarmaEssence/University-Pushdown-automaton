type transition = char * char list * char * char * char list

type declarations = char list * char list * char list * char * char

type automate = declarations * transition list 

module NameTable = Map.Make(Char)
module StringNameTable = Map.Make(String)

let getInitials (automate: automate) (flag: int): char = 
  match automate with
  | (declarations, _) ->
    if flag == 0 then
      match declarations with
      | (_, _, _, initial_state, _) -> initial_state
    else
      match declarations with
      | (_, _, _, _, initial_stack) -> initial_stack

let getTransitionsList (automate: automate): transition list = 
  match automate with
  | (_, transitions) -> transitions      


  
