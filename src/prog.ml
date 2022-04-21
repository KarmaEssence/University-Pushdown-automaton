open Ast

type action = 
| Push of char
| Pop
| Change of char
| Reject

type next = char * action list

type top = 
| Actions of next
| Nexts of char * next list

type transition = 
| Next of char * next list
| Top of char * top list

type program = declarations * transition list