%{
open Type
%}

%token INPUT SYMBOLS STACK INITIAL STATES STATE
%token LPAREN RPAREN COMMA COLON SEMICOLON EOF
%token PROGRAM BEGIN CASE TOP NEXT OF END
%token PUSH POP CHANGE REJECT
%token<string> ID 

%start<Type.automate> input
%type<Type.automate> automate
%type<Type.automate_declarations> automate_declarations
%type<string list> input_symbols stack_symbols states
%type<string> initial_state initial_stack
%type<Type.automate_transition list> automate_transitions
%type<Type.automate_transition> automate_transition
%type<Type.program_transition list> program_transitions
%type<Type.program_transition> program_transition

%%

input: c = automate EOF { c }

automate:
a = automate_declarations b = automate_transitions {Automate(a, b)}
| a = automate_declarations b = program_transitions {Program(a, b)}

automate_declarations:
a = input_symbols b = stack_symbols c = states d = initial_state e = initial_stack {a, b, c, d, e}

input_symbols:
INPUT SYMBOLS COLON a = separated_nonempty_list(COMMA, ID) {a}

stack_symbols:
STACK SYMBOLS COLON a = separated_nonempty_list(COMMA, ID) {a}

states:
STATES COLON a = separated_nonempty_list(COMMA, ID) {a}

initial_state:
INITIAL STATE COLON a = ID {a}

initial_stack:
INITIAL STACK COLON a = ID {a}

automate_transitions:
ID COLON a = nonempty_list(automate_transition) {a}

automate_transition:
LPAREN a = ID COMMA b = list(ID) COMMA c = ID COMMA d = ID COMMA e = separated_list(SEMICOLON, ID) RPAREN {a, b, c, d, e}

program_transitions:
PROGRAM COLON CASE STATE OF a = nonempty_list(program_transition){a}

program_transition:
a = ID COLON BEGIN CASE TOP OF b = nonempty_list(program_top) END {Top(a,b)}
| a = ID COLON BEGIN CASE NEXT OF b = nonempty_list(program_next) END {Next(a,b)}

program_top:
a = ID COLON BEGIN CASE NEXT OF b = nonempty_list(program_next) END {Nexts(a,b)}
| a = ID COLON b = nonempty_list(program_action) {Actions(a, b)}

program_next:
a = ID COLON b = nonempty_list(program_action) {a, b}

program_action:
PUSH a = ID {Push(a)}
| POP {Pop}
| CHANGE a = ID {Change(a)}
| REJECT {Reject}