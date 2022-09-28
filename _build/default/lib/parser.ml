
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SEMICOLON
    | RPAREN
    | PUSH
    | POP
    | MERGE
    | LPAREN
    | LET
    | INT of (
# 13 "lib/parser.mly"
        (int)
# 22 "lib/parser.ml"
  )
    | EQUALS
    | EOF
    | EMPTY
    | DOT
    | COMMA
    | COLON
  
end

include MenhirBasics

type ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Stacks.expr) [@@unboxed]

let _menhir_action_1 =
  fun i ->
    (
# 48 "lib/parser.mly"
              ( Int i )
# 45 "lib/parser.ml"
     : (Stacks.expr))

let _menhir_action_2 =
  fun e ->
    (
# 38 "lib/parser.mly"
                    ( e )
# 53 "lib/parser.ml"
     : (Stacks.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | DOT ->
        "DOT"
    | EMPTY ->
        "EMPTY"
    | EOF ->
        "EOF"
    | EQUALS ->
        "EQUALS"
    | INT _ ->
        "INT"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | MERGE ->
        "MERGE"
    | POP ->
        "POP"
    | PUSH ->
        "PUSH"
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
  
  let rec _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_1 i in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let e = _v in
              let _v = _menhir_action_2 e in
              MenhirBox_prog _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
