open Ast

let rec print_map (key : string) (list : string list) =
  match list with
  | [] -> print_string "\n"
  | element :: sublist ->
    print_string (element ^ " ");
    print_map key sublist

let eval_automate (ast: automate): unit = 
  let map = NameTable.empty in
  let map = NameTable.add "main" ["1";"2";"3"] map in
  NameTable.iter print_map map