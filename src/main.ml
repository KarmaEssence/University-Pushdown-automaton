let lexbuf = Lexing.from_channel stdin 

let ast = Parser.input Lexer.main lexbuf 

let _ = Print_ast.print_automate ast