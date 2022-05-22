open Type 

(*Takes an unit and returns nothing.*)
val usage: unit -> unit

(*Takes an unit and returns nothing.*)
val automate_usage: unit -> unit

(*Takes an unit and returns nothing.*)
val program_usage: unit -> unit

(*Takes a list of transitions and returns nothing.*)
val print_transitions: automate_transition list -> unit

(*Takes an automate and returns nothing.*)
val print_automate: automate -> unit