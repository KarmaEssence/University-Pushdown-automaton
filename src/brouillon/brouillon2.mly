%{
open Prog
%}

%token COMMA COLON EOF
%token<char> ID 
%token<string> IDS
(*%token<string> IDS*)
%nonassoc ID 

%start<Prog.program> input
%type<Prog.program> program
%type<Prog.declarations> declarations
%type<char list> symbols states
%type<char> initialstate initialstack
%type<Prog.transition list> transitions
%type<Prog.transition> transition
(*%type<Prog.subtransition> subtransition*)
(*%type<Prog.top> top
%type<Prog.next> next
%type<Prog.action> action*)


%%

input: c = program EOF { c }

program:
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
IDS COLON IDS IDS IDS a = nonempty_list(transition) IDS {a}

transition:
a = ID COLON b = nonempty_list(ID) {a,b}
(*a = ID COLON ID ID ID ID b = nonempty_list(ID) {Top(a, b)}
| a = ID COLON b = ID {Next(a, b)}*)

(*subtransition:
b = nonempty_list(ID) {Top(b)}
| b = ID {Next(b)}*)


(*top:
a = ID COLON b = nexts {Nexts(a, b)}
| a = next {Without (a)}

nexts:
ID ID ID ID a = nonempty_list(next) {a}

next:
a = ID COLON b = nonempty_list(action) {a, b}

action:
a = IDS b = ID {Add (a,b)}
| a = IDS {Sub (a)}*)