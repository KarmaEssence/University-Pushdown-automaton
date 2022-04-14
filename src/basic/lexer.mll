{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let ident_char = [ 'a'-'z' ]

rule main = parse
  | layout		{ main lexbuf }
  | ident_char+		{ ID (Lexing.lexeme lexbuf) }
  | ':'         { COLON }
  | eof			{ EOF }
  | _			{ failwith "unexpected character" }
