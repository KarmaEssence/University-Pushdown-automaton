{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let ident_char = [ 'a'- 'z''A'-'Z''0'-'9' ]

rule main = parse
  | layout		  { main lexbuf }
  | ')'			    { RPAREN }
  | '('			    { LPAREN }
  | ','         { COMMA }
  | ':'         { COLON }
  | ';'         { SEMICOLON }
  | ident_char+	{ ID (Lexing.lexeme lexbuf) }
  | eof			{ EOF }
  | _			{ failwith "unexpected character" }
