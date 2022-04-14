%{
open Ast
%}

%token LPAREN RPAREN COMMA COLON SEMICOLON EOF
%token<string> ID 

%start<string> input
%type<string> automate 
%type<string> declarations 
%type<string> inputsymbols 
%type<string> stacksymbols 
%type<string> states
%type<string> initialstate 
%type<string> initialstack 
%type<string> suitelettresnonvide 
%type<string> transitions 
%type<string> translist 
%type<string> transition 
%type<string> lettreouvide 
%type<string> stack 
%type<string> nonemptystack

%%

  
input: a = automate EOF { a }

automate:
a = declarations b = transitions {}

declarations:
a = inputsymbols b = stacksymbols c = states d = initialstate e = initialstack {}

inputsymbols:
ID ID COLON a = suitelettresnonvide {}

stacksymbols:
ID ID COLON a = suitelettresnonvide {}

states:
ID COLON a = suitelettresnonvide {}

initialstate:
ID ID COLON ID {}

initialstack:
ID ID ID COLON ID {}

suitelettresnonvide:
ID {}
| ID COMMA a = suitelettresnonvide {}

transitions:
ID COLON a = translist {}

translist:
a = option(b = transition c = translist {bc}) {a}

transition:
LPAREN ID COLON lettreouvide COLON ID COLON ID COLON stack RPAREN {}

lettreouvide:
a = option(ID) {a}

stack:
a = option(nonemptystack) {a}

nonemptystack:
ID {}
| ID SEMICOLON a = nonemptystack {}





