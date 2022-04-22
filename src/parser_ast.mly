%{
open Ast
%}

%token INPUT SYMBOLS STACK INITIAL STATES STATE
%token LPAREN RPAREN COMMA COLON SEMICOLON EOF
%token<char> ID 

%start<Ast.automate> input
%type<Ast.declarations> declarations
%type<char list> inputsymbols stacksymbols states
%type<char> initialstate initialstack
%type<Ast.transition list> transitions
%type<Ast.transition> transition


%%

input: c = automate EOF { c }

automate:
a = declarations b = transitions {a, b}

declarations:
a = inputsymbols b = stacksymbols c = states d = initialstate e = initialstack {a, b, c, d, e}

inputsymbols:
INPUT SYMBOLS COLON a = separated_nonempty_list(COMMA, ID) {a}

stacksymbols:
STACK SYMBOLS COLON a = separated_nonempty_list(COMMA, ID) {a}

states:
STATES COLON a = separated_nonempty_list(COMMA, ID) {a}

initialstate:
INITIAL STATE COLON a = ID {a}

initialstack:
INITIAL STACK COLON a = ID {a}

transitions:
ID COLON a = list(transition) {a}

transition:
LPAREN a = ID COMMA b = list(ID) COMMA c = ID COMMA d = ID COMMA e = separated_list(SEMICOLON, ID) RPAREN {a, b, c, d, e}