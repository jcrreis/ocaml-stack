{
  open Parser
  open Lexing

  let newline lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }

}

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+
let id = ['a'-'z']+

rule read =
  parse
  | '\n' { newline lexbuf; read lexbuf }
    | white { read lexbuf }
    | "Empty" { EMPTY }
    | "Push"  { PUSH }
    | "Pop"   { POP }
    | "Merge" { MERGE }
    | ";"     { SEMICOLON }
    | ","     { COMMA }
    | "("     { LPAREN }
    | ")"     { RPAREN }
    | "let"   { LET }
    | "="     { EQUALS }
    | "."     { DOT }
    | (id as s) { ID s }
    | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | eof { EOF }
