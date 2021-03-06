{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let ident_char = [ 'a'- 'z''A'-'Z''0'-'9' ]

rule main = parse
  | layout		  { main lexbuf }
  | "input"     { INPUT }
  | "symbols"   { SYMBOLS }
  | "stack"     { STACK }
  | "initial"   { INITIAL }
  | "states"    { STATES }
  | "state"     { STATE }
  | ')'			    { RPAREN }
  | '('			    { LPAREN }
  | ','         { COMMA }
  | ':'         { COLON }
  | ';'         { SEMICOLON }
  | "push"      { PUSH  }
  | "pop"       { POP   }
  | "reject"    { REJECT}
  | "change"    { CHANGE  }
  | "program"   { PROGRAM }
  | "begin"     { BEGIN }
  | "case"      { CASE }
  | "top"       { TOP}
  | "next"      { NEXT}
  | "of"        { OF}
  | "end"       { END}
  | ident_char+	{ ID (Lexing.lexeme_char lexbuf 0) }
  | eof			{ EOF }
  | _			{ failwith "unexpected character" }
