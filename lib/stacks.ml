
type ops =
    | Pop 
    | Merge

type expr =
    | Int of int
    | Empty
    | Push
    | Op of ops 

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
    reverse_helper [] list;;

let merge x1 x2 = let rec merge_helper x1 x2 =
    match x1 with 
        |[] -> x2
        | h :: t -> merge_helper t (h::x2) in 
            merge_helper (reverse x1) (x2);;






