{
open Parser_ast
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
  | ident_char+	{ ID (Lexing.lexeme_char lexbuf 0) }
  | eof			{ EOF }
  | _			{ failwith "unexpected character" }
