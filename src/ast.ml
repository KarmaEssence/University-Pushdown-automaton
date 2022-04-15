type transition = string * string list * string * string * string list

type declarations = string list * string list * string list * string * string

type automate = declarations * transition list 

module NameTable = Map.Make(String)

let getInitials (automate: automate) (flag: int): string = 
  match automate with
  | (declarations, _) ->
    if flag == 0 then
      match declarations with
      | (_, _, _, initial_state, _) -> initial_state
    else
      match declarations with
      | (_, _, _, _, initial_stack) -> initial_stack


  
