type transition = string * string list * string * string * string list

type declarations = string list * string list * string list * string * string

type automate = declarations * transition list 

module NameTable = Map.Make(String)



  
