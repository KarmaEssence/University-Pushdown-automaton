
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TOP
    | SYMBOLS
    | STATES
    | STATE
    | STACK
    | SEMICOLON
    | RPAREN
    | REJECT
    | PUSH
    | PROGRAM
    | POP
    | OF
    | NEXT
    | LPAREN
    | INPUT
    | INITIAL
    | ID of (
# 9 "parser.mly"
      (char)
# 31 "parser.ml"
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

# 1 "parser.mly"
  
open Type

# 49 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState003 : ('s, _menhir_box_input) _menhir_state
    (** State 003.
        Stack shape : .
        Start symbol: input. *)

  | MenhirState005 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 005.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState011 : ('s _menhir_cell0_inputsymbols, _menhir_box_input) _menhir_state
    (** State 011.
        Stack shape : inputsymbols.
        Start symbol: input. *)

  | MenhirState015 : ('s _menhir_cell0_inputsymbols _menhir_cell0_stacksymbols, _menhir_box_input) _menhir_state
    (** State 015.
        Stack shape : inputsymbols stacksymbols.
        Start symbol: input. *)

  | MenhirState034 : ('s _menhir_cell0_declarations, _menhir_box_input) _menhir_state
    (** State 034.
        Stack shape : declarations.
        Start symbol: input. *)

  | MenhirState040 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 040.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState042 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 042.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState052 : ((('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_cell1_BEGIN, _menhir_box_input) _menhir_state
    (** State 052.
        Stack shape : ID BEGIN.
        Start symbol: input. *)

  | MenhirState054 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 054.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState056 : (('s, _menhir_box_input) _menhir_cell1_action, _menhir_box_input) _menhir_state
    (** State 056.
        Stack shape : action.
        Start symbol: input. *)

  | MenhirState060 : (('s, _menhir_box_input) _menhir_cell1_next, _menhir_box_input) _menhir_state
    (** State 060.
        Stack shape : next.
        Start symbol: input. *)

  | MenhirState063 : (('s, _menhir_box_input) _menhir_cell1_top, _menhir_box_input) _menhir_state
    (** State 063.
        Stack shape : top.
        Start symbol: input. *)

  | MenhirState068 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 068.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState071 : (('s, _menhir_box_input) _menhir_cell1_program_transition, _menhir_box_input) _menhir_state
    (** State 071.
        Stack shape : program_transition.
        Start symbol: input. *)

  | MenhirState075 : ('s _menhir_cell0_declarations _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 075.
        Stack shape : declarations ID.
        Start symbol: input. *)

  | MenhirState078 : (('s, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 078.
        Stack shape : LPAREN ID.
        Start symbol: input. *)

  | MenhirState079 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 079.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState086 : ((('s, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_cell1_list_ID_ _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 086.
        Stack shape : LPAREN ID list(ID) ID ID.
        Start symbol: input. *)

  | MenhirState088 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 088.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState093 : (('s, _menhir_box_input) _menhir_cell1_transition, _menhir_box_input) _menhir_state
    (** State 093.
        Stack shape : transition.
        Start symbol: input. *)


and ('s, 'r) _menhir_cell1_action = 
  | MenhirCell1_action of 's * ('s, 'r) _menhir_state * (Type.action)

and 's _menhir_cell0_declarations = 
  | MenhirCell0_declarations of 's * (Type.declarations)

and 's _menhir_cell0_initialstate = 
  | MenhirCell0_initialstate of 's * (char)

and 's _menhir_cell0_inputsymbols = 
  | MenhirCell0_inputsymbols of 's * (char list)

and ('s, 'r) _menhir_cell1_list_ID_ = 
  | MenhirCell1_list_ID_ of 's * ('s, 'r) _menhir_state * (char list)

and ('s, 'r) _menhir_cell1_next = 
  | MenhirCell1_next of 's * ('s, 'r) _menhir_state * (Type.next)

and ('s, 'r) _menhir_cell1_program_transition = 
  | MenhirCell1_program_transition of 's * ('s, 'r) _menhir_state * (Type.program_transition)

and 's _menhir_cell0_stacksymbols = 
  | MenhirCell0_stacksymbols of 's * (char list)

and 's _menhir_cell0_states = 
  | MenhirCell0_states of 's * (char list)

and ('s, 'r) _menhir_cell1_top = 
  | MenhirCell1_top of 's * ('s, 'r) _menhir_state * (Type.top)

and ('s, 'r) _menhir_cell1_transition = 
  | MenhirCell1_transition of 's * ('s, 'r) _menhir_state * (Type.transition)

and ('s, 'r) _menhir_cell1_BEGIN = 
  | MenhirCell1_BEGIN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 9 "parser.mly"
      (char)
# 193 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 9 "parser.mly"
      (char)
# 200 "parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_input = 
  | MenhirBox_input of (Type.automate) [@@unboxed]

let _menhir_action_01 =
  fun a ->
    
# 68 "parser.mly"
            (Push(a))
# 214 "parser.ml"
    

let _menhir_action_02 =
  fun () ->
    
# 69 "parser.mly"
      (Pop)
# 222 "parser.ml"
    

let _menhir_action_03 =
  fun a ->
    
# 70 "parser.mly"
                (Change(a))
# 230 "parser.ml"
    

let _menhir_action_04 =
  fun () ->
    
# 71 "parser.mly"
         (Reject)
# 238 "parser.ml"
    

let _menhir_action_05 =
  fun a b ->
    
# 26 "parser.mly"
                                 (Automate(a, b))
# 246 "parser.ml"
    

let _menhir_action_06 =
  fun a b ->
    
# 27 "parser.mly"
                                           (Program(a, b))
# 254 "parser.ml"
    

let _menhir_action_07 =
  fun a b c d e ->
    
# 30 "parser.mly"
                                                                               (a, b, c, d, e)
# 262 "parser.ml"
    

let _menhir_action_08 =
  fun a ->
    
# 45 "parser.mly"
                           (a)
# 270 "parser.ml"
    

let _menhir_action_09 =
  fun a ->
    
# 42 "parser.mly"
                           (a)
# 278 "parser.ml"
    

let _menhir_action_10 =
  fun c ->
    
# 23 "parser.mly"
                        ( c )
# 286 "parser.ml"
    

let _menhir_action_11 =
  fun a ->
    
# 33 "parser.mly"
                                                           (a)
# 294 "parser.ml"
    

let _menhir_action_12 =
  fun () ->
    
# 208 "<standard.mly>"
    ( [] )
# 302 "parser.ml"
    

let _menhir_action_13 =
  fun x xs ->
    
# 210 "<standard.mly>"
    ( x :: xs )
# 310 "parser.ml"
    

let _menhir_action_14 =
  fun () ->
    
# 208 "<standard.mly>"
    ( [] )
# 318 "parser.ml"
    

let _menhir_action_15 =
  fun x xs ->
    
# 210 "<standard.mly>"
    ( x :: xs )
# 326 "parser.ml"
    

let _menhir_action_16 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 334 "parser.ml"
    

let _menhir_action_17 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 342 "parser.ml"
    

let _menhir_action_18 =
  fun a b ->
    
# 65 "parser.mly"
                                       (a, b)
# 350 "parser.ml"
    

let _menhir_action_19 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 358 "parser.ml"
    

let _menhir_action_20 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 366 "parser.ml"
    

let _menhir_action_21 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 374 "parser.ml"
    

let _menhir_action_22 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 382 "parser.ml"
    

let _menhir_action_23 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 390 "parser.ml"
    

let _menhir_action_24 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 398 "parser.ml"
    

let _menhir_action_25 =
  fun x ->
    
# 218 "<standard.mly>"
    ( [ x ] )
# 406 "parser.ml"
    

let _menhir_action_26 =
  fun x xs ->
    
# 220 "<standard.mly>"
    ( x :: xs )
# 414 "parser.ml"
    

let _menhir_action_27 =
  fun a b ->
    
# 57 "parser.mly"
                                                          (Top(a,b))
# 422 "parser.ml"
    

let _menhir_action_28 =
  fun a b ->
    
# 58 "parser.mly"
                                                              (Next(a,b))
# 430 "parser.ml"
    

let _menhir_action_29 =
  fun a ->
    
# 54 "parser.mly"
                                                                 (a)
# 438 "parser.ml"
    

let _menhir_action_30 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 446 "parser.ml"
    

let _menhir_action_31 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 454 "parser.ml"
    

let _menhir_action_32 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 462 "parser.ml"
    

let _menhir_action_33 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 470 "parser.ml"
    

let _menhir_action_34 =
  fun a ->
    
# 36 "parser.mly"
                                                           (a)
# 478 "parser.ml"
    

let _menhir_action_35 =
  fun a ->
    
# 39 "parser.mly"
                                                    (a)
# 486 "parser.ml"
    

let _menhir_action_36 =
  fun a b ->
    
# 61 "parser.mly"
                                                            (Nexts(a,b))
# 494 "parser.ml"
    

let _menhir_action_37 =
  fun a b ->
    
# 62 "parser.mly"
                                         (Actions(a, b))
# 502 "parser.ml"
    

let _menhir_action_38 =
  fun a b c d xs ->
    let e = 
# 229 "<standard.mly>"
    ( xs )
# 510 "parser.ml"
     in
    
# 51 "parser.mly"
                                                                                                          (a, b, c, d, e)
# 515 "parser.ml"
    

let _menhir_action_39 =
  fun a ->
    
# 48 "parser.mly"
                              (a)
# 523 "parser.ml"
    

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
    | INITIAL ->
        "INITIAL"
    | INPUT ->
        "INPUT"
    | LPAREN ->
        "LPAREN"
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
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | STACK ->
        "STACK"
    | STATE ->
        "STATE"
    | STATES ->
        "STATES"
    | SYMBOLS ->
        "SYMBOLS"
    | TOP ->
        "TOP"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_automate : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let c = _v in
      let _v = _menhir_action_10 c in
      MenhirBox_input _v
  
  let rec _menhir_run_073 : type  ttv_stack. ttv_stack _menhir_cell0_declarations -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let a = _v in
      let _v = _menhir_action_29 a in
      let MenhirCell0_declarations (_menhir_stack, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_06 a b in
      _menhir_goto_automate _menhir_stack _v
  
  let rec _menhir_goto_nonempty_list_program_transition_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState034 ->
          _menhir_run_073 _menhir_stack _v
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_072 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_program_transition -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell1_program_transition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_24 x xs in
      _menhir_goto_nonempty_list_program_transition_ _menhir_stack _v _menhir_s
  
  let rec _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
                              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040
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
                              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState068
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
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | PUSH ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | POP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | CHANGE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | BEGIN ->
              let _menhir_stack = MenhirCell1_BEGIN (_menhir_stack, MenhirState042) in
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
                              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
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
  
  and _menhir_run_056 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | REJECT ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | PUSH ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | POP ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState056 _tok
      | CHANGE ->
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | END | ID _ ->
          let x = _v in
          let _v = _menhir_action_19 x in
          _menhir_goto_nonempty_list_action_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
      _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
      | MenhirState042 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState056 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_062 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_37 a b in
      _menhir_goto_top _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_top : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_top (_menhir_stack, _menhir_s, _v) in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState063
      | END ->
          let x = _v in
          let _v = _menhir_action_25 x in
          _menhir_goto_nonempty_list_top_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_top_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState040 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState063 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_065 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_27 a b in
      _menhir_goto_program_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_program_transition : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_program_transition (_menhir_stack, _menhir_s, _v) in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState071
      | EOF ->
          let x = _v in
          let _v = _menhir_action_23 x in
          _menhir_goto_nonempty_list_program_transition_ _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_top -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_top (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_26 x xs in
      _menhir_goto_nonempty_list_top_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_057 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_action -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_action (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_20 x xs in
      _menhir_goto_nonempty_list_action_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_055 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_18 a b in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_next (_menhir_stack, _menhir_s, _v) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState060
      | END ->
          let x = _v in
          let _v = _menhir_action_21 x in
          _menhir_goto_nonempty_list_next_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054 _tok
          | PUSH ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | POP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054 _tok
          | CHANGE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_next_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState068 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState060 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState052 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_28 a b in
      _menhir_goto_program_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_next -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_next (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_22 x xs in
      _menhir_goto_nonempty_list_next_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_058 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_BEGIN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_36 a b in
      _menhir_goto_top _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_095 : type  ttv_stack. ttv_stack _menhir_cell0_declarations _menhir_cell0_ID -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_39 a in
      let MenhirCell0_declarations (_menhir_stack, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_05 a b in
      _menhir_goto_automate _menhir_stack _v
  
  let rec _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transition -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell1_transition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_15 x xs in
      _menhir_goto_list_transition_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_transition_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState075 ->
          _menhir_run_095 _menhir_stack _v
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_076 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078
              | COMMA ->
                  let _v = _menhir_action_12 () in
                  _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079
      | COMMA ->
          let _v = _menhir_action_12 () in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_13 x xs in
      _menhir_goto_list_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState078 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_081 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_ID_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | COMMA ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | ID _v ->
                          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState086
                      | RPAREN ->
                          let _v = _menhir_action_16 () in
                          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v
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
  
  and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_32 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState086 ->
          _menhir_run_090_spec_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState088 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_090_spec_086 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_cell1_list_ID_ _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_17 x in
      _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_cell1_list_ID_ _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_ID (_menhir_stack, d) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, c) = _menhir_stack in
      let MenhirCell1_list_ID_ (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, a) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 a b c d xs in
      let _menhir_stack = MenhirCell1_transition (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | EOF ->
          let _v = _menhir_action_14 () in
          _menhir_run_094 _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_33 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_016 : type  ttv_stack. ttv_stack _menhir_cell0_inputsymbols _menhir_cell0_stacksymbols -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_35 a in
      let _menhir_stack = MenhirCell0_states (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | INITIAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STATE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COLON ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ID _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let a = _v_0 in
                      let _v = _menhir_action_09 a in
                      let _menhir_stack = MenhirCell0_initialstate (_menhir_stack, _v) in
                      (match (_tok : MenhirBasics.token) with
                      | INITIAL ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | STACK ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | COLON ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | ID _v_0 ->
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      let a = _v_0 in
                                      let _v = _menhir_action_08 a in
                                      let MenhirCell0_initialstate (_menhir_stack, d) = _menhir_stack in
                                      let MenhirCell0_states (_menhir_stack, c) = _menhir_stack in
                                      let MenhirCell0_stacksymbols (_menhir_stack, b) = _menhir_stack in
                                      let MenhirCell0_inputsymbols (_menhir_stack, a) = _menhir_stack in
                                      let e = _v in
                                      let _v = _menhir_action_07 a b c d e in
                                      let _menhir_stack = MenhirCell0_declarations (_menhir_stack, _v) in
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
                                                              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034
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
                                      | ID _v_1 ->
                                          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_1) in
                                          let _tok = _menhir_lexer _menhir_lexbuf in
                                          (match (_tok : MenhirBasics.token) with
                                          | COLON ->
                                              let _tok = _menhir_lexer _menhir_lexbuf in
                                              (match (_tok : MenhirBasics.token) with
                                              | LPAREN ->
                                                  _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
                                              | EOF ->
                                                  let _v = _menhir_action_14 () in
                                                  _menhir_run_095 _menhir_stack _v
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
          _eRR ()
  
  let rec _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState005
          | _ ->
              _eRR ())
      | INITIAL | STACK | STATES ->
          let x = _v in
          let _v = _menhir_action_30 x in
          _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState015 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState011 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState003 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState005 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack _menhir_cell0_inputsymbols -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_34 a in
      let _menhir_stack = MenhirCell0_stacksymbols (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | STATES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState015
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_11 a in
      let _menhir_stack = MenhirCell0_inputsymbols (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | STACK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOLS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COLON ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ID _v ->
                      _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState011
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_31 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INPUT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOLS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COLON ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ID _v ->
                      _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let input =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_input v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
