open Ast

let open_automaton_file (filename: string) : automate = 
  let lexbuf = Lexing.from_channel (open_in filename) in
  let automaton = Parser.input Lexer.main lexbuf in 
  Check_ast.check_automate automaton;
  automaton

let usage () =
  print_string "\n";
  print_string "Options d'exécution du programme : \n";
  print_string "./main -eval <file> <mot> : évalutation de l'automate à l'aide d'un mot\n";
  print_string "./main -print <file> : affichage de l'automate dans le terminal\n";
  print_string "\n"

let _ =
  match Sys.argv with
  | [|_;"-eval";filename;argument|] ->
    let automate = open_automaton_file filename in
    Eval_ast.eval_automate automate argument
  | [|_;"-print";filename|] ->  
    let automate = open_automaton_file filename in
    Print_ast.print_automate automate  
  | _ -> usage ()