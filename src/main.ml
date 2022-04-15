let lexbuf = Lexing.from_channel stdin 

let ast = Parser.input Lexer.main lexbuf

let usage () =
  print_string "\n";
  print_string "Options d'exécution du programme : \n";
  print_string "./parser < file -evaluation <mot> : évalutation de l'automate à l'aide d'un mot\n";
  print_string "./parser < file -print : affichage de l'automate dans le terminal\n";
  print_string "\n"

let _ =
  match Sys.argv with
  | [|_;"-eval";argument|] -> Check_ast.check_automate ast; Eval_ast.eval_automate ast argument
  | [|_;"-print"|] -> Check_ast.check_automate ast; Print_ast.print_automate ast   
  | _ -> usage ()