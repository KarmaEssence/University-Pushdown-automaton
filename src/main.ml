(*open Print_ast
open Eval_ast*)

let lexbuf = Lexing.from_channel stdin 

let ast = Parser.input Lexer.main lexbuf 

let _ =
  Eval_ast.eval_automate ast; 
  Print_ast.print_automate ast