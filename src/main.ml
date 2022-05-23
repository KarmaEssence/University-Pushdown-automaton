(*****************************************************************************)

open Type

(*****************************************************************************)

(***********************************************************************)
(*                                main                                 *)  
(***********************************************************************)

(*To get automate from the file.*) 
let get_automation_in_file (lexbuf: Lexing.lexbuf) (flag: int): automate = 
  if flag = 0 then
    Parser.input Lexer.main lexbuf
  else
    let program = Parser.input Lexer.main lexbuf in 
    Convert_prog_to_ast.convert_prog_to_ast program    

(*To get automate from the file and check if he has the good format.*)    
let open_automaton_file (filename: string) (flag: int): automate = 
  try
    let lexbuf = Lexing.from_channel (open_in filename) in
    let automaton = get_automation_in_file lexbuf flag in 
    Check_ast.check_automate automaton; 
    automaton

  with Sys_error _ ->
    print_string (filename ^ ": no such file\n"); 
    exit 1    
  
let _ =
  match Sys.argv with
  | [|_;"-eval--phase-1";filename;argument|] ->
    let automate = open_automaton_file filename 0 in
    Eval_ast.eval_automate automate argument
  | [|_;"-eval--phase-3";filename;argument|] ->
    let automate = open_automaton_file filename 1 in
    Eval_ast.eval_automate automate argument   
  | [|_;"-print--phase-1";filename|] ->  
    let automate = open_automaton_file filename 0 in
    Print_ast.print_automate automate   
  | [|_;"-print--phase-3";filename|] ->  
    let automate = open_automaton_file filename 1 in
    Print_ast.print_automate automate    
  | [|_;"-format--phase-1"|] -> Print_ast.automate_usage ()
  | [|_;"-format--phase-3"|] -> Print_ast.program_usage ()
  | _ -> Print_ast.usage ()