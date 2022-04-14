%{
open Ast
%}

%token EOF
%token<string> ID 

%start<Ast.expression> input

%%

  
input: c = expression EOF { c }

expression:
x = ID  { Var x }

