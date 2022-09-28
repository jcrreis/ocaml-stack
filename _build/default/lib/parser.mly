// %{
//     open Printf
//     open Easy_logging
//     open Util
//     open Lexing

//     let (|@|) node loc = { node = node; loc = loc }
//     let logger = Logging.make_logger "Parser" Info [Cli Debug]
// %}


//values
%token  <int> INT

//OPS
%token EMPTY
%token PUSH
%token POP
%token MERGE

//Syntax
%token COMMA
%token SEMICOLON
%token COLON
%token LET
%token LPAREN
%token RPAREN
%token DOT
%token EQUALS
%token EOF


%start <Stacks.expr> prog

%%

prog :
    | e = expr; EOF { e }
    //| e = list ( expr ) ; EOF {e} //{logger#debug "List of expressions"; Prog e}
    ;

// let s = Empty; Cria empty stack e guarda em s
// s.push(1); adiciona 1 à stack
// s.pop(); da pop à stack
// merge(s1, s2); junta s1 e s2

expr:
    | i = INT { Int i }
    ;
    // | LET v EQUALS EMPTY LPAREN RPAREN SEMICOLON // { Empty(v) }   1st case
    // | s DOT PUSH LPAREN v RPAREN SEMICOLON // { Push(v, s) } 2nd case
    // | s DOT POP LPAREN RPAREN // { Pop(s) } 3rd case
    // | MERGE LPAREN s1 COMMA s2 RPAREN SEMICOLON //{ Merge(s1, s2) }4th case


/*-------------------------------------------------------------------------------------------------------------*/
    // | e1 = expr; DIV; e2 = expr { Binop (Div, e1, e2) }
    // | e1 = expr; TIMES; e2 = expr { Binop (Mult, e1, e2) }
    // | e1 = expr; PLUS; e2 = expr { Binop (Add, e1, e2) }
    // | LPAREN; e = expr; RPAREN { e }
    // | PUSH  { Push (Push, x, s)  }
/*-------------------------------------------------------------------------------------------------------------*/

    

