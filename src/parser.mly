%{
open Type
%}

%token INPUT SYMBOLS STACK INITIAL STATES STATE
%token LPAREN RPAREN COMMA COLON SEMICOLON EOF
%token PROGRAM BEGIN CASE TOP NEXT OF END
%token PUSH POP CHANGE REJECT
%token<char> ID 

%start<Type.automate> input
%type<Type.automate> automate
%type<Type.declarations> declarations
%type<char list> inputsymbols stacksymbols states
%type<char> initialstate initialstack
%type<Type.transition list> transitions
%type<Type.transition> transition
%type<Type.program_transition list> program_transitions
%type<Type.program_transition> program_transition

%%

input: c = automate EOF { c }

automate:
a = declarations b = transitions {Automate(a, b)}
| a = declarations b = program_transitions {Program(a, b)}

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

program_transitions:
PROGRAM COLON CASE STATE OF a = nonempty_list(program_transition){a}

program_transition:
a = ID COLON BEGIN CASE TOP OF b = nonempty_list(top) END {Top(a,b)}
| a = ID COLON BEGIN CASE NEXT OF b = nonempty_list(next) END {Next(a,b)}

top:
a = ID COLON BEGIN CASE NEXT OF b = nonempty_list(next) END {Nexts(a,b)}
| a = ID COLON b = nonempty_list(action) {Actions(a, b)}

next:
a = ID COLON b = nonempty_list(action) {a, b}

action:
PUSH a = ID {Push(a)}
| POP {Pop}
| CHANGE a = ID {Change(a)}
| REJECT {Reject}