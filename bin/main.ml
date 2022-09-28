open Calc

(* let () =
  let x = Main.parse "42" in
  print_string (Main.string_of_val x);
  Format.printf "@." *)
  
(* let () = 
  Format.printf "Hello\n" *)


(* let () = 
   let y = Main.parse Sys.argv.(1) in
    let x = Main.eval y in
    print_string (Main.string_of_val x);
    Format.printf "@." *)
  (* let () =
  ignore (Main.step (Obj.magic None)) *)

let () = 
  let lst = Stacks.push 10 [1;3;4]  in
  (* let a = Stacks.merge lst [3;2;4] in
  List.iter (Printf.printf "%d ") a *)
  let a = Stacks.merge lst [3;2;4] in
  List.iter (Printf.printf "%d ") a
  
  (* Printf.printf "%d" (Stacks.pop lst) *)
  (* let s = Stacks.empty
  s.push 1 s  *)

