
(* type ops =
 *     | Pop
 *     | Merge *)

type value =
  | Empty

type expr =
  | Let of string * value
  | Push of int * string
  | Pop of string
  | Merge of string * string

type program = expr list

type 'a stack = 'a list

let empty = []

let push x s =
  x :: s

let pop = function
  | [] -> failwith "Empty"
  | _ :: s -> s

let reverse list =
  let rec reverse_helper acc list =
    match list with
    | [] -> acc
    | h::t -> reverse_helper (h::acc) t in
  reverse_helper [] list

let merge x1 x2 =
  let rec merge_helper x1 x2 =
    match x1 with
    |[] -> x2
    | h :: t -> merge_helper t (h::x2) in
  merge_helper (reverse x1) (x2)

let eval_expr mem expr =
  match expr with
  | Let (s, Empty) ->
      Hashtbl.add mem s []
  | Push (x, s) ->
      let current = Hashtbl.find mem s in
      let value = x :: current in
      Hashtbl.replace mem s value
  | Pop s ->
      let current = Hashtbl.find mem s in
      let new_val = match current with
        | [] -> []
        | _ :: r -> r in
      Hashtbl.replace mem s new_val
  | Merge (s1, s2) ->
      let current_s1 = Hashtbl.find mem s1 in
      let current_s2 = Hashtbl.find mem s2 in
      let new_s1 = current_s1 @ current_s2 in
      let new_s2 = [] in
      Hashtbl.replace mem s1 new_s1;
      Hashtbl.replace mem s2 new_s2

let rec eval_program mem program =
  match program with
  | [] -> ()
  | e :: r ->
      eval_expr mem e;
      eval_program mem r
