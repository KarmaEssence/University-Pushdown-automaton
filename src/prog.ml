(*****************************************************************************)

open Ast

(*****************************************************************************)

(***********************************************************************)
(*                                prog                                 *)  
(***********************************************************************)

type action = 
| Push of char
| Pop
| Change of char
| Reject

type next = char * action list

type top = 
| Actions of char * action list
| Nexts of char * next list

type transition = 
| Next of char * next list
| Top of char * top list

type program = declarations * transition list