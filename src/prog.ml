(*type next = (char * char list) list

type top = 
| All of char list
| Next of (char * next list) list


type transition = 
| All of next
| Top of top*)

(*type action = 
| Add of string * char
| Sub of string

type next = char * action list

type top = 
| Without of next
| Nexts of char * next list*)

(*type transition = char * char list*)

type action = 
| Push of char
| Pop
| Change of char
| Reject

type next = char * action list

type top = 
| Actions of next
| Nexts of char * next list

(*type subtransition = 
| Next of char
| Top of char list

type transition = char * subtransition*)

type transition = 
| Next of char * next list
| Top of char * top list

(*type transition = char * char list*)

type declarations = char list * char list * char list * char * char

type program = declarations * transition list