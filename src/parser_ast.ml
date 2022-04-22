
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SEMICOLON
    | RPAREN
    | LPAREN
    | ID of (
# 6 "parser_ast.mly"
      (char)
# 18 "parser_ast.ml"
  )
    | EOF
    | COMMA
    | COLON
  
end

include MenhirBasics

# 1 "parser_ast.mly"
  
open Ast

# 32 "parser_ast.ml"

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

  | MenhirState28 : (('s, _menhir_box_input) _menhir_cell1_declarations _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 28.
        Stack shape : declarations ID.
        Start symbol: input. *)

  | MenhirState31 : (('s, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 31.
        Stack shape : LPAREN ID.
        Start symbol: input. *)

  | MenhirState32 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 32.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState39 : ((('s, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_cell1_list_ID_ _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_input) _menhir_state
    (** State 39.
        Stack shape : LPAREN ID list(ID) ID ID.
        Start symbol: input. *)

  | MenhirState41 : (('s, _menhir_box_input) _menhir_cell1_ID, _menhir_box_input) _menhir_state
    (** State 41.
        Stack shape : ID.
        Start symbol: input. *)

  | MenhirState46 : (('s, _menhir_box_input) _menhir_cell1_transition, _menhir_box_input) _menhir_state
    (** State 46.
        Stack shape : transition.
        Start symbol: input. *)


and ('s, 'r) _menhir_cell1_declarations = 
  | MenhirCell1_declarations of 's * ('s, 'r) _menhir_state * (Ast.declarations)

and 's _menhir_cell0_initialstate = 
  | MenhirCell0_initialstate of 's * (char)

and ('s, 'r) _menhir_cell1_list_ID_ = 
  | MenhirCell1_list_ID_ of 's * ('s, 'r) _menhir_state * (char list)

and 's _menhir_cell0_states = 
  | MenhirCell0_states of 's * (char list)

and ('s, 'r) _menhir_cell1_symbols = 
  | MenhirCell1_symbols of 's * ('s, 'r) _menhir_state * (char list)

and ('s, 'r) _menhir_cell1_transition = 
  | MenhirCell1_transition of 's * ('s, 'r) _menhir_state * (Ast.transition)

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 6 "parser_ast.mly"
      (char)
# 113 "parser_ast.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 6 "parser_ast.mly"
      (char)
# 120 "parser_ast.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_input = 
  | MenhirBox_input of (Ast.automate) [@@unboxed]

let _menhir_action_01 =
  fun a b ->
    
# 21 "parser_ast.mly"
                                 (a, b)
# 134 "parser_ast.ml"
    

let _menhir_action_02 =
  fun a b c d e ->
    
# 24 "parser_ast.mly"
                                                                     (a, b, c, d, e)
# 142 "parser_ast.ml"
    

let _menhir_action_03 =
  fun a ->
    
# 36 "parser_ast.mly"
                      (a)
# 150 "parser_ast.ml"
    

let _menhir_action_04 =
  fun a ->
    
# 33 "parser_ast.mly"
                   (a)
# 158 "parser_ast.ml"
    

let _menhir_action_05 =
  fun c ->
    
# 18 "parser_ast.mly"
                        ( c )
# 166 "parser_ast.ml"
    

let _menhir_action_06 =
  fun () ->
    
# 208 "<standard.mly>"
    ( [] )
# 174 "parser_ast.ml"
    

let _menhir_action_07 =
  fun x xs ->
    
# 210 "<standard.mly>"
    ( x :: xs )
# 182 "parser_ast.ml"
    

let _menhir_action_08 =
  fun () ->
    
# 208 "<standard.mly>"
    ( [] )
# 190 "parser_ast.ml"
    

let _menhir_action_09 =
  fun x xs ->
    
# 210 "<standard.mly>"
    ( x :: xs )
# 198 "parser_ast.ml"
    

let _menhir_action_10 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 206 "parser_ast.ml"
    

let _menhir_action_11 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 214 "parser_ast.ml"
    

let _menhir_action_12 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 222 "parser_ast.ml"
    

let _menhir_action_13 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 230 "parser_ast.ml"
    

let _menhir_action_14 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 238 "parser_ast.ml"
    

let _menhir_action_15 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 246 "parser_ast.ml"
    

let _menhir_action_16 =
  fun a ->
    
# 30 "parser_ast.mly"
                                                (a)
# 254 "parser_ast.ml"
    

let _menhir_action_17 =
  fun a ->
    
# 27 "parser_ast.mly"
                                                    (a)
# 262 "parser_ast.ml"
    

let _menhir_action_18 =
  fun a b c d xs ->
    let e = 
# 229 "<standard.mly>"
    ( xs )
# 270 "parser_ast.ml"
     in
    
# 42 "parser_ast.mly"
                                                                                                          (a, b, c, d, e)
# 275 "parser_ast.ml"
    

let _menhir_action_19 =
  fun a ->
    
# 39 "parser_ast.mly"
                              (a)
# 283 "parser_ast.ml"
    

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | EOF ->
        "EOF"
    | ID _ ->
        "ID"
    | LPAREN ->
        "LPAREN"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_48 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_declarations _menhir_cell0_ID -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_19 a in
      let MenhirCell1_declarations (_menhir_stack, _, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_01 a b in
      let c = _v in
      let _v = _menhir_action_05 c in
      MenhirBox_input _v
  
  let rec _menhir_run_47 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transition -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      let MenhirCell1_transition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_09 x xs in
      _menhir_goto_list_transition_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_transition_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState28 ->
          _menhir_run_48 _menhir_stack _v
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
                  _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31
              | COMMA ->
                  let _v = _menhir_action_06 () in
                  _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
      | COMMA ->
          let _v = _menhir_action_06 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_07 x xs in
      _menhir_goto_list_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState31 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
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
                          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState39
                      | RPAREN ->
                          let _v = _menhir_action_10 () in
                          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v
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
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_14 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState39 ->
          _menhir_run_43_spec_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState41 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_43_spec_39 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_cell1_list_ID_ _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_11 x in
      _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_44 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LPAREN _menhir_cell0_ID, _menhir_box_input) _menhir_cell1_list_ID_ _menhir_cell0_ID _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_ID (_menhir_stack, d) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, c) = _menhir_stack in
      let MenhirCell1_list_ID_ (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, a) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_18 a b c d xs in
      let _menhir_stack = MenhirCell1_transition (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | EOF ->
          let _v = _menhir_action_08 () in
          _menhir_run_47 _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_15 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_symbols, _menhir_box_input) _menhir_cell1_symbols _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_16 a in
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
                      let _v = _menhir_action_04 a in
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
                                          let _v = _menhir_action_03 a in
                                          let MenhirCell0_initialstate (_menhir_stack, d) = _menhir_stack in
                                          let MenhirCell0_states (_menhir_stack, c) = _menhir_stack in
                                          let MenhirCell1_symbols (_menhir_stack, _, b) = _menhir_stack in
                                          let MenhirCell1_symbols (_menhir_stack, _menhir_s, a) = _menhir_stack in
                                          let e = _v in
                                          let _v = _menhir_action_02 a b c d e in
                                          let _menhir_stack = MenhirCell1_declarations (_menhir_stack, _menhir_s, _v) in
                                          (match (_tok : MenhirBasics.token) with
                                          | ID _v_0 ->
                                              let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
                                              let _tok = _menhir_lexer _menhir_lexbuf in
                                              (match (_tok : MenhirBasics.token) with
                                              | COLON ->
                                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                                  (match (_tok : MenhirBasics.token) with
                                                  | LPAREN ->
                                                      _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
                                                  | EOF ->
                                                      let _v = _menhir_action_08 () in
                                                      _menhir_run_48 _menhir_stack _v
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
          let _v = _menhir_action_12 x in
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
      let _v = _menhir_action_17 a in
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
      let _v = _menhir_action_13 x xs in
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
