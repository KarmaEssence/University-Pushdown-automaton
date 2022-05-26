(*****************************************************************************)

open Type

(*****************************************************************************)

(***********************************************************************)
(*                                main                                 *)  
(***********************************************************************)

(*To get automate from the file.*) 
let get_automation_in_file (lexbuf: Lexing.lexbuf): automate =
  try
    let automate = Parser.input Lexer.main lexbuf in
    let automate = Gas6_utils.leave_reject_from_automate automate in
    Convert_prog_to_auto.convert_prog_to_auto automate

  with exn_Parser_MenhirBasics_Error ->
    print_string "Error: wrong format of file.\n";
    exit 1   
;;

(*To get automate from the file and check if he has the good format.*)    
let open_automaton_file (filename: string): automate = 
  try
    let lexbuf = Lexing.from_channel (open_in filename) in
    let automaton = get_automation_in_file lexbuf in  
    Check_auto.check_automate automaton;
    automaton

  with Sys_error _ ->
    print_string ("Error: no such file: " ^ filename ^ "\n");
    exit 1    
;;

let _ =
  match Sys.argv with
  | [|_;"-print";filename|] ->  
    let automate = open_automaton_file filename in
    Print_auto.print_automate automate   
  | [|_;"-eval";filename;argument|] ->
    let automate = open_automaton_file filename in
    Eval_auto.eval_automate automate argument
  | [|_;"-eval";filename|] ->
    let automate = open_automaton_file filename in
    print_string "Enter a word:\n";
    Eval_auto.eval_automate automate (read_line ())       
  | [|_;"-format--phase-1"|] -> Print_auto.automate_usage ()
  | [|_;"-format--phase-3"|] -> Print_auto.program_usage ()
  | _ -> Print_auto.usage ()
;;  