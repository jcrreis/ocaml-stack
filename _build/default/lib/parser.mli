
(* The type of tokens. *)

type token = 
  | SEMICOLON
  | RPAREN
  | PUSH
  | POP
  | MERGE
  | LPAREN
  | LET
  | INT of (int)
  | EQUALS
  | EOF
  | EMPTY
  | DOT
  | COMMA
  | COLON

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Stacks.expr)
