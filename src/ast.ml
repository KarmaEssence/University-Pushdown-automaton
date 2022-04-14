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

(*let as_string (automate: automate) = *)
  
