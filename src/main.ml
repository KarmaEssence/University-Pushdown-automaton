open Ast
open Prog

let open_automaton_file (filename: string): automate = 
  try
    let lexbuf = Lexing.from_channel (open_in filename) in
    let automaton = Parser_ast.input Lexer_ast.main lexbuf in 
    Check_ast.check_automate automaton;
    automaton

  with Sys_error _ ->
    print_string (filename ^ ": no such file\n"); 
    exit 1

let open_program_file (filename: string): automate = 
  try
    let lexbuf = Lexing.from_channel (open_in filename) in
    let program = Parser_prog.input Lexer_prog.main lexbuf in 
    let automate = Convert_prog_to_ast.convert_prog_to_ast program in
    Check_ast.check_automate automate;
    automate

  with Sys_error _ ->
    print_string (filename ^ ": no such file\n"); 
    exit 1    

let usage () =
  print_string "\n";
  print_string "Options d'exécution du programme : \n";
  print_string "./main -eval--phase-1 <file> <mot> : évalutation de l'automate à l'aide d'un mot\n";
  print_string "./main -eval--phase-3 <file> <mot> : évalutation du programme à l'aide d'un mot\n";
  print_string "./main -print--phase-1 <file> : affichage de l'automate dans le terminal\n";
  print_string "./main -print--phase-3 <file> : affichage du programme dans le terminal\n";
  print_string "\n"

let _ =
  match Sys.argv with
  | [|_;"-eval--phase-1";filename;argument|] ->
    let automate = open_automaton_file filename in
    Eval_ast.eval_automate automate argument
  | [|_;"-eval--phase-3";filename;argument|] ->
    let automate = open_program_file filename in
    Eval_ast.eval_automate automate argument    
  | [|_;"-print--phase-1";filename|] ->  
    let automate = open_automaton_file filename in
    Print_ast.print_automate automate   
  | [|_;"-print--phase-3";filename|] ->  
    let automate = open_program_file filename in
    Print_ast.print_automate automate  
  | _ -> usage ()