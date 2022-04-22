
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TOP
    | STATE
    | REJECT
    | PUSH
    | PROGRAM
    | POP
    | OF
    | NEXT
    | ID of (
# 8 "parser_prog.mly"
      (char)
# 23 "parser_prog.ml"
  )
    | EOF
    | END
    | COMMA
    | COLON
    | CHANGE
    | CASE
    | BEGIN
  
end

include MenhirBasics

# 1 "parser_prog.mly"
  
open Prog
open Ast

# 42 "parser_prog.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_input) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: input. *)

  | MenhirState03 : (('s, _menhir_box_input) _menhir_cell1_ID _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 03.
        Stack shape : ID ID.
        Start symbol: input. *)

  | MenhirState05 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 05.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState08 : (('s, _menhir_box_input) _menhir_cell1_symbols, _menhir_box_input) _menhir_state
    (** State 08.
        Stack shape : symbols.
        Start symbol: input. *)

  | MenhirState11 : ((('s, _menhir_box_input) _menhir_cell1_symbols, _menhir_box_input) _menhir_cell1_symbols _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 11.
        Stack shape : symbols symbols ID.
        Start symbol: input. *)

  | MenhirState33 : (('s, _menhir_box_input) _menhir_cell1_declarations, _menhir_box_input) _menhir_state
    (** State 33.
        Stack shape : declarations.
        Start symbol: input. *)

  | MenhirState39 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 39.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState41 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 41.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState51 : ((('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_cell1_BEGIN, _menhir_box_input) _menhir_state
    (** State 51.
        Stack shape : ID BEGIN.
        Start symbol: input. *)

  | MenhirState53 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 53.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState55 : (('s, _menhir_box_input) _menhir_cell1_action, _menhir_box_input) _menhir_state
    (** State 55.
        Stack shape : action.
        Start symbol: input. *)

  | MenhirState59 : (('s, _menhir_box_input) _menhir_cell1_next, _menhir_box_input) _menhir_state
    (** State 59.
        Stack shape : next.
        Start symbol: input. *)

  | MenhirState62 : (('s, _menhir_box_input) _menhir_cell1_top, _menhir_box_input) _menhir_state
    (** State 62.
        Stack shape : top.
        Start symbol: input. *)

  | MenhirState67 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 67.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState70 : (('s, _menhir_box_input) _menhir_cell1_transition, _menhir_box_input) _menhir_state
    (** State 70.
        Stack shape : transition.
        Start symbol: input. *)


and ('s, 'r) _menhir_cell1_action = 
  | MenhirCell1_action of 's * ('s, 'r) _menhir_state * (Prog.action)

and ('s, 'r) _menhir_cell1_declarations = 
  | MenhirCell1_declarations of 's * ('s, 'r) _menhir_state * (Ast.declarations)

and 's _menhir_cell0_initialstate = 
  | MenhirCell0_initialstate of 's * (char)

and ('s, 'r) _menhir_cell1_next = 
  | MenhirCell1_next of 's * ('s, 'r) _menhir_state * (Prog.next)

and 's _menhir_cell0_states = 
  | MenhirCell0_states of 's * (char list)

and ('s, 'r) _menhir_cell1_symbols = 
  | MenhirCell1_symbols of 's * ('s, 'r) _menhir_state * (char list)

and ('s, 'r) _menhir_cell1_top = 
  | MenhirCell1_top of 's * ('s, 'r) _menhir_state * (Prog.top)

and ('s, 'r) _menhir_cell1_transition = 
  | MenhirCell1_transition of 's * ('s, 'r) _menhir_state * (Prog.transition)

and ('s, 'r) _menhir_cell1_BEGIN = 
  | MenhirCell1_BEGIN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 8 "parser_prog.mly"
      (char)
# 152 "parser_prog.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 8 "parser_prog.mly"
      (char)
# 159 "parser_prog.ml"
)

and _menhir_box_input = 
  | MenhirBox_input of (Prog.program) [@@unboxed]

let _menhir_action_01 =
  fun a ->
    
# 59 "parser_prog.mly"
            (Push(a))
# 170 "parser_prog.ml"
    

let _menhir_action_02 =
  fun () ->
    
# 60 "parser_prog.mly"
      (Pop)
# 178 "parser_prog.ml"
    

let _menhir_action_03 =
  fun a ->
    
# 61 "parser_prog.mly"
                (Change(a))
# 186 "parser_prog.ml"
    

let _menhir_action_04 =
  fun () ->
    
# 62 "parser_prog.mly"
         (Reject)
# 194 "parser_prog.ml"
    

let _menhir_action_05 =
  fun a b c d e ->
    
# 30 "parser_prog.mly"
                                                                     (a, b, c, d, e)
# 202 "parser_prog.ml"
    

let _menhir_action_06 =
  fun a ->
    
# 42 "parser_prog.mly"
                      (a)
# 210 "parser_prog.ml"
    

let _menhir_action_07 =
  fun a ->
    
# 39 "parser_prog.mly"
                   (a)
# 218 "parser_prog.ml"
    

let _menhir_action_08 =
  fun c ->
    
# 24 "parser_prog.mly"
                       ( c )
# 226 "parser_prog.ml"
    

let _menhir_action_09 =
  fun a b ->
    
# 56 "parser_prog.mly"
                                       (a, b)
# 234 "parser_prog.ml"
    

let _menhir_action_10 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 242 "parser_prog.ml"
    

let _menhir_action_11 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 250 "parser_prog.ml"
    

let _menhir_action_12 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 258 "parser_prog.ml"
    

let _menhir_action_13 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 266 "parser_prog.ml"
    

let _menhir_action_14 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 274 "parser_prog.ml"
    

let _menhir_action_15 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 282 "parser_prog.ml"
    

let _menhir_action_16 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 290 "parser_prog.ml"
    

let _menhir_action_17 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 298 "parser_prog.ml"
    

let _menhir_action_18 =
  fun a b ->
    
# 27 "parser_prog.mly"
                                 (a, b)
# 306 "parser_prog.ml"
    

let _menhir_action_19 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 314 "parser_prog.ml"
    

let _menhir_action_20 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 322 "parser_prog.ml"
    

let _menhir_action_21 =
  fun a ->
    
# 36 "parser_prog.mly"
                                                (a)
# 330 "parser_prog.ml"
    

let _menhir_action_22 =
  fun a ->
    
# 33 "parser_prog.mly"
                                                   (a)
# 338 "parser_prog.ml"
    

let _menhir_action_23 =
  fun a b ->
    
# 52 "parser_prog.mly"
                                                            (Nexts(a,b))
# 346 "parser_prog.ml"
    

let _menhir_action_24 =
  fun a b ->
    
# 53 "parser_prog.mly"
                                         (Actions(a, b))
# 354 "parser_prog.ml"
    

let _menhir_action_25 =
  fun a b ->
    
# 48 "parser_prog.mly"
                                                          (Top(a,b))
# 362 "parser_prog.ml"
    

let _menhir_action_26 =
  fun a b ->
    
# 49 "parser_prog.mly"
                                                              (Next(a,b))
# 370 "parser_prog.ml"
    

let _menhir_action_27 =
  fun a ->
    
# 45 "parser_prog.mly"
                                                         (a)
# 378 "parser_prog.ml"
    

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | BEGIN ->
        "BEGIN"
    | CASE ->
        "CASE"
    | CHANGE ->
        "CHANGE"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | ID _ ->
        "ID"
    | NEXT ->
        "NEXT"
    | OF ->
        "OF"
    | POP ->
        "POP"
    | PROGRAM ->
        "PROGRAM"
    | PUSH ->
        "PUSH"
    | REJECT ->
        "REJECT"
    | STATE ->
        "STATE"
    | TOP ->
        "TOP"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_72 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_declarations -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let a = _v in
      let _v = _menhir_action_27 a in
      let MenhirCell1_declarations (_menhir_stack, _, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_18 a b in
      let c = _v in
      let _v = _menhir_action_08 c in
      MenhirBox_input _v
  
  let rec _menhir_goto_nonempty_list_transition_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState33 ->
          _menhir_run_72 _menhir_stack _v
      | MenhirState70 ->
          _menhir_run_71 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_71 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transition -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell1_transition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_17 x xs in
      _menhir_goto_nonempty_list_transition_ _menhir_stack _v _menhir_s
  
  let rec _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGIN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | CASE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TOP ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | OF ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ID _v ->
                              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState39
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | NEXT ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | OF ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ID _v ->
                              _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState67
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REJECT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | PUSH ->
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
          | POP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | CHANGE ->
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
          | BEGIN ->
              let _menhir_stack = MenhirCell1_BEGIN (_menhir_stack, MenhirState41) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | CASE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | NEXT ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | OF ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ID _v ->
                              _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState51
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_55 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | REJECT ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState55 _tok
      | PUSH ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | POP ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState55 _tok
      | CHANGE ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | END | ID _ ->
          let x = _v in
          let _v = _menhir_action_10 x in
          _menhir_goto_nonempty_list_action_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let a = _v in
          let _v = _menhir_action_01 a in
          _menhir_goto_action _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_action : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let a = _v in
          let _v = _menhir_action_03 a in
          _menhir_goto_action _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_action_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState41 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState53 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_61 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_24 a b in
      _menhir_goto_top _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_top : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_top (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState62
      | END ->
          let x = _v in
          let _v = _menhir_action_14 x in
          _menhir_goto_nonempty_list_top_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_top_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState39 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState62 ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_64 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_25 a b in
      _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_transition : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_transition (_menhir_stack, _menhir_s, _v) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState70
      | EOF ->
          let x = _v in
          let _v = _menhir_action_16 x in
          _menhir_goto_nonempty_list_transition_ _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_63 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_top -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_top (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_15 x xs in
      _menhir_goto_nonempty_list_top_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_56 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_action -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_action (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_11 x xs in
      _menhir_goto_nonempty_list_action_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_54 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_09 a b in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_next (_menhir_stack, _menhir_s, _v) in
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState59
      | END ->
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_goto_nonempty_list_next_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_52 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REJECT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
          | PUSH ->
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | POP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
          | CHANGE ->
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_next_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState67 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState59 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState51 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_68 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_26 a b in
      _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_60 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_next -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_next (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_13 x xs in
      _menhir_goto_nonempty_list_next_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_57 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_BEGIN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_23 a b in
      _menhir_goto_top _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_symbols, _menhir_box_input) _menhir_cell1_symbols _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_21 a in
      let _menhir_stack = MenhirCell0_states (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COLON ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ID _v_2 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let a = _v_2 in
                      let _v = _menhir_action_07 a in
                      let _menhir_stack = MenhirCell0_initialstate (_menhir_stack, _v) in
                      (match (_tok : MenhirBasics.token) with
                      | ID _ ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ID _ ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | ID _ ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | COLON ->
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | ID _v_3 ->
                                          let _tok = _menhir_lexer _menhir_lexbuf in
                                          let a = _v_3 in
                                          let _v = _menhir_action_06 a in
                                          let MenhirCell0_initialstate (_menhir_stack, d) = _menhir_stack in
                                          let MenhirCell0_states (_menhir_stack, c) = _menhir_stack in
                                          let MenhirCell1_symbols (_menhir_stack, _, b) = _menhir_stack in
                                          let MenhirCell1_symbols (_menhir_stack, _menhir_s, a) = _menhir_stack in
                                          let e = _v in
                                          let _v = _menhir_action_05 a b c d e in
                                          let _menhir_stack = MenhirCell1_declarations (_menhir_stack, _menhir_s, _v) in
                                          (match (_tok : MenhirBasics.token) with
                                          | PROGRAM ->
                                              let _tok = _menhir_lexer _menhir_lexbuf in
                                              (match (_tok : MenhirBasics.token) with
                                              | COLON ->
                                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                                  (match (_tok : MenhirBasics.token) with
                                                  | CASE ->
                                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                                      (match (_tok : MenhirBasics.token) with
                                                      | STATE ->
                                                          let _tok = _menhir_lexer _menhir_lexbuf in
                                                          (match (_tok : MenhirBasics.token) with
                                                          | OF ->
                                                              let _tok = _menhir_lexer _menhir_lexbuf in
                                                              (match (_tok : MenhirBasics.token) with
                                                              | ID _v ->
                                                                  _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState33
                                                              | _ ->
                                                                  _eRR ())
                                                          | _ ->
                                                              _eRR ())
                                                      | _ ->
                                                          _eRR ())
                                                  | _ ->
                                                      _eRR ())
                                              | _ ->
                                                  _eRR ())
                                          | _ ->
                                              _eRR ())
                                      | _ ->
                                          _eRR ())
                                  | _ ->
                                      _eRR ())
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05
          | _ ->
              _eRR ())
      | ID _ ->
          let x = _v in
          let _v = _menhir_action_19 x in
          _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_22 a in
      _menhir_goto_symbols _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_symbols : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState08 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_09 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_symbols as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbols (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbols (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState08
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_20 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let input =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_input v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
