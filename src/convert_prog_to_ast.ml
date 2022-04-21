open Prog
open Ast
open Gas6_utils


let 

let convert_prog_to_ast (program: program) : automate = 
  match program with
  | (declarations, transitions) ->
    let newtransition = convert_transitions transitions in
    (declarations, newtransition)