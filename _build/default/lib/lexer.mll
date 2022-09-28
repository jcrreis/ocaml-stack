{
    open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+

rule read =
    parse 
    | white { read lexbuf }
    | "Empty" { EMPTY }
    | "Push"  { PUSH }
    | "Pop"   { POP }
    | "Merge" { MERGE }
    | ";"     { SEMICOLON }
    | ":"     { COLON }
    | ","     { COMMA } 
    | "("     { LPAREN }
    | ")"     { RPAREN } 
    | "let"   { LET }
    | "="     { EQUALS }  
    | "."     { DOT } 
    | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | eof { EOF } 
