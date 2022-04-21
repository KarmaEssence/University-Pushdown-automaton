%{
open Prog
open Ast
%}

%token COMMA COLON PROGRAM BEGIN CASE STATE TOP NEXT OF END EOF
%token PUSH POP CHANGE REJECT
%token<char> ID 

%start<Prog.program> input
%type<Prog.program> program
%type<Ast.declarations> declarations
%type<char list> symbols states
%type<char> initialstate initialstack
%type<Prog.transition list> transitions
%type<Prog.transition> transition
%type<Prog.top> top
%type<Prog.next> next
%type<Prog.action> action


%%

input: c = program EOF { c }

program:
a = declarations b = transitions {a, b}

declarations:
a = symbols b = symbols c = states d = initialstate e = initialstack {a, b, c, d, e}

symbols:
ID ID COLON a = separated_nonempty_list(COMMA, ID) {a}

states:
ID COLON a = separated_nonempty_list(COMMA, ID) {a}

initialstate:
ID ID COLON a = ID {a}

initialstack:
ID ID ID COLON a = ID {a}

transitions:
PROGRAM COLON CASE STATE OF a = nonempty_list(transition){a}

transition:
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