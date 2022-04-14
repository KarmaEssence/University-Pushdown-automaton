%{
open Ast
%}

%token COLON EOF
%token<string> ID 

%start<Ast.expression> input

%%

  
input: c = expression EOF { c }

expression:
x = ID COLON ID ID ID{ Var x }