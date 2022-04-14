let lexbuf = Lexing.from_channel stdin 

let ast = Parser.input Lexer.main lexbuf 

let _ = Ast.print_automate ast