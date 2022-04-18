%{
open Ast
%}

%token LPAREN RPAREN COMMA COLON SEMICOLON EOF
%token<char> ID 

%start<Ast.automate> input
%type<Ast.declarations> declarations
%type<char list> symbols states
%type<char> initialstate initialstack
%type<Ast.transition list> transitions
%type<Ast.transition> transition


%%

input: c = automate EOF { c }

automate:
a = declarations b = transitions {a, b}

declarations:
a = symbols b = symbols c = states d = initialstate e = initialstack {a, b, c, d, e}

symbols:
ID ID COLON a =  separated_nonempty_list(COMMA, ID) {a}

states:
ID COLON a = separated_nonempty_list(COMMA, ID) {a}

initialstate:
ID ID COLON a = ID {a}

initialstack:
ID ID ID COLON a = ID {a}

transitions:
ID COLON a = list(transition) {a}

transition:
LPAREN a = ID COMMA b = list(ID) COMMA c = ID COMMA d = ID COMMA e = separated_list(SEMICOLON, ID) RPAREN {a, b, c, d, e}








