(*****************************************************************************)

open Type

(*****************************************************************************)

(***********************************************************************)
(*                                main                                 *)  
(***********************************************************************)

(*To get automate from the file.*) 
let get_automation_in_file (lexbuf: Lexing.lexbuf): automate =
  let automate = Parser.input Lexer.main lexbuf in
  let automate = Gas6_utils.leave_reject_from_automate automate in
  Convert_prog_to_ast.convert_prog_to_ast automate  
;;

(*To get automate from the file and check if he has the good format.*)    
let open_automaton_file (filename: string) (*(flag: int)*): automate = 
  try
    let lexbuf = Lexing.from_channel (open_in filename) in
    let automaton = get_automation_in_file lexbuf in  
    Check_ast.check_automate automaton;
    automaton

  with Sys_error _ ->
    print_string (filename ^ ": no such file\n"); 
    exit 1    
;;

let _ =
  match Sys.argv with
  | [|_;"-print";filename|] ->  
    let automate = open_automaton_file filename in
    Print_ast.print_automate automate   
  | [|_;"-eval";filename;argument|] ->
    let automate = open_automaton_file filename in
    Eval_ast.eval_automate automate argument    
  | [|_;"-format--phase-1"|] -> Print_ast.automate_usage ()
  | [|_;"-format--phase-3"|] -> Print_ast.program_usage ()
  | _ -> Print_ast.usage ()
;;  