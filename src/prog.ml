(*****************************************************************************)

open Ast

(*****************************************************************************)

(***********************************************************************)
(*                                prog                                 *)  
(***********************************************************************)

(*Program action instructions.*)
type action = 
| Push of char
| Pop
| Change of char
| Reject

(*Program next instructions.*)
type next = char * action list

(*Program top instructions.*)
type top = 
| Actions of char * action list
| Nexts of char * next list

(*Program transition instructions.*)
type transition = 
| Next of char * next list
| Top of char * top list

(*Program instructions.*)
type program = declarations * transition list