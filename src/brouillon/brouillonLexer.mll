{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let ident_char = [ '0'-'9''a'-'z''A'-'Z' ]

rule main = parse
  | layout		{ main lexbuf }
  | ')'			{ RPAREN }
  | '('			{ LPAREN }
  | ','         { COMA   }
  | ':'         { COLON  }
  | ';'         { SEMICOLON}
  | ident_char+	{ ID (Lexing.lexeme lexbuf) }
  | eof			{ EOF }
  | _			{ failwith "unexpected character" }