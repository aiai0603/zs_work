(* File Expr/Expr.fs *) 

(* Simple expression language with various evaluators and compilers *)

module Expr

open System.IO
open Absyn


(* From file expr/expr.sml * Simple arithmetic expressions *)

let e1src = "let z = 17 in z + z"
let e1 = Let("z", CstI 17, Prim("+", Var "z", Var "z"));

let e2src = "let z = 17 in (let z = 22 in 100 * z) + z"
let e2 = Let("z", CstI 17, 
             Prim("+", Let("z", CstI 22, Prim("*", CstI 100, Var "z")),
                       Var "z"));

let e3src = "let z = 5 - 4 in 100 * z"
let e3 = Let("z", Prim("-", CstI 5, CstI 4), 
             Prim("*", CstI 100, Var "z"));
             
(* ---------------------------------------------------------------------- *)

(* Formatting expressions as strings *)

let e4 = Prim("-", Prim("-", Var "a", Var "b"), Var "c");
let e5 = Prim("-", Var "a", Prim("-", Var "b", Var "c"));
let e6 = Prim("*", Prim("-", Var "a", Var "b"), Var "c");
let e7 = Prim("-", Prim("*", Var "a", Var "b"), Var "c");
let e8 = Prim("*", Var "a", Prim("-", Var "b", Var "c"));
let e9 = Prim("-", Var "a", Prim("*", Var "b", Var "c"));

let es = [e1; e2; e3; e4; e5; e6; e7; e8; e9];

let rec fmt1 (e : expr) : string = 
    match e with
      | CstI i -> i.ToString()
      | Var x  -> x 
      | Let(x, erhs, ebody) -> 
            String.concat " " ["let"; x; "="; fmt1 erhs;
                               "in"; fmt1 ebody; "end"]
      | Prim(ope, e1, e2) -> String.concat "" ["("; fmt1 e1; ope; fmt1 e2; ")"]

(* Format expressions as strings, avoiding excess parentheses *)

let rec fmt2 (ctxpre : int) (e : expr) = 
    match e with
        CstI i -> i.ToString()
      | Var x  -> x 
      | Let(x, erhs, ebody) -> 
            String.concat " " ["let"; x; "="; fmt2 -1 erhs;
                               "in"; fmt2 -1 ebody; "end"]
      | Prim(ope, e1, e2) -> 
            (match ope with
                 "+" -> wrappar ctxpre 6 [fmt2 5 e1; ope; fmt2 6 e2]
               | "-" -> wrappar ctxpre 6 [fmt2 5 e1; ope; fmt2 6 e2]
               | "*" -> wrappar ctxpre 7 [fmt2 6 e1; ope; fmt2 7 e2]
               | _   -> raise (Failure "unknown primitive"))

and wrappar ctxpre pre ss = 
    if pre <= ctxpre then String.concat "" ("(" :: ss @ [")"])
    else String.concat "" ss

let fmt e = fmt2 -1 e;

(* ---------------------------------------------------------------------- *)

(* Evaluation *)

let rec lookup env x =
    match env with 
      | []          -> failwith (x + " not found")
      | (y, v)::r -> if x=y then v else lookup r x;;

let rec eval (e : expr) (env : (string * int) list) : int =
    match e with
      | CstI i -> i
      | Var x  -> lookup env x 
      | Let(x, erhs, ebody) -> 
            let xval = eval erhs env 
            let env1 = (x, xval) :: env in
            eval ebody env1
      | Prim("+", e1, e2) -> eval e1 env + eval e2 env
      | Prim("*", e1, e2) -> eval e1 env * eval e2 env
      | Prim("-", e1, e2) -> eval e1 env - eval e2 env
      | Prim _            -> raise (Failure "unknown primitive")

(* Evaluate in empty environment: expression must have no free variables: *)

let run e = eval e []

(* ---------------------------------------------------------------------- *)

(* Closedness *)

(* Checking whether an expression is closed.  The environment env is a
   list of the bound variables.  *)

let mem x vs = List.exists (fun y -> x=y) vs;;

let rec closedin (e : expr) (env : string list) : bool =
    match e with 
      | CstI i -> true
      | Var x  -> List.exists (fun y -> x=y) env
      | Let(x, erhs, ebody) -> 
            let env1 = x :: env 
            closedin erhs env && closedin ebody env1
      | Prim(ope, e1, e2) -> closedin e1 env && closedin e2 env;

(* An expression is closed if it is closed in the empty environment *)

let closed1 e = closedin e [];

(* ---------------------------------------------------------------------- *)

(* Free variables *)

(* Operations on sets, represented as lists.  Simple but inefficient;
   use binary trees, hashtables or splaytrees for efficiency.  *)

(* union(xs, ys) is the set of all elements in xs or ys, without duplicates *)

let rec union xs ys =
    match xs with 
    | []    -> ys
    | x::xr -> if mem x ys then union xr ys
               else x :: union xr ys

(* minus xs ys  is the set of all elements in xs but not in ys *)

let rec minus xs ys = 
    match xs with 
    | []    -> []
    | x::xr -> if mem x ys then minus xr ys
               else x :: minus xr ys

(* Find all variables that occur free in expression e *)

let rec freevars e : string list =
    match e with 
      | CstI i -> []
      | Var x  -> [x]
      | Let(x, erhs, ebody) -> 
            union (freevars erhs) (minus (freevars ebody) [x])
      | Prim(ope, e1, e2) -> union (freevars e1) (freevars e2)

(* Alternative definition of closed *)

let closed2 e = (freevars e = [])


(* ---------------------------------------------------------------------- *)

(* Compilation to target expressions with numerical indexes instead of
   symbolic variable names.  *)

type texpr =                            (* target expressions *)
  | TCstI of int
  | TVar of int                         (* index into runtime environment *)
  | TLet of texpr * texpr               (* erhs and ebody                 *)
  | TPrim of string * texpr * texpr


(* Map variable name to variable index at compile-time *)

let rec getindex env x = 
    match env with 
    | [] -> raise (Failure "Variable not found")
    | y::yr -> if x=y then 0 else 1 + getindex yr x;

(* Compiling from expr to texpr.  The compile-time environment cenv is
   a list of variable names; the position of a variable in the list
   indicates its binding depth and hence the position in the runtime
   environment.  The integer giving the position is the same as a
   deBruijn index in the lambda calculus: the number of binders
   between this occurrence of a variable, and its binding.  *)

// 抽象语法树（名称） 编译到抽象语法树（地址）

let rec tcomp e (cenv : string list) : texpr =
    match e with
      | CstI i -> TCstI i
      | Var x  -> TVar (getindex cenv x)
      | Let(x, erhs, ebody) -> 
            let cenv1 = x :: cenv 
            TLet(tcomp erhs cenv, tcomp ebody cenv1)
      | Prim(ope, e1, e2) -> TPrim(ope, tcomp e1 cenv, tcomp e2 cenv)

(* Evaluation of target expressions with variable indexes.  The
   run-time environment renv is a list of variable values (ints).  *)

let rec teval (e : texpr) (renv : int list) : int =
    match e with
      | TCstI i -> i
      | TVar x  -> renv.[x]
      | TLet(erhs, ebody) -> 
            let xval = teval erhs renv
            let renv1 = xval :: renv 
            teval ebody renv1
      | TPrim("+", e1, e2) -> teval e1 renv + teval e2 renv
      | TPrim("*", e1, e2) -> teval e1 renv * teval e2 renv
      | TPrim("-", e1, e2) -> teval e1 renv - teval e2 renv
      | TPrim _            -> raise (Failure "unknown primitive")

(* Correctness: eval e [] equals teval (tcomp e []) [] *)

(* ---------------------------------------------------------------------- *)

(* Stack machines *)

(* Stack machine instructions.  An expressions in postfix or reverse
   Polish form is a list of stack machine instructions. *)

type rinstr =
  | RCstI of int
  | RAdd 
  | RSub
  | RMul 
  | RDup
  | RSwap

(* A simple stack machine for evaluation of variable-free expressions
in postfix form *)

let rec reval (inss : rinstr list) stack = 
    match inss, stack with 
    | [], (v :: _)      -> v
    | [], []            -> raise (Failure "reval: no result")
    | (ins0 :: rest), _ ->
      match ins0, stack with
      | RCstI i, _                -> reval rest (i::stack)
      | RAdd,    i2 :: i1 :: stkr -> reval rest ((i1+i2)::stkr)
      | RSub,    i2 :: i1 :: stkr -> reval rest ((i1-i2)::stkr)
      | RMul,    i2 :: i1 :: stkr -> reval rest ((i1*i2)::stkr)
      | RDup,          i1 :: stkr -> reval rest (i1 :: i1 :: stkr)
      | RSwap,   i2 :: i1 :: stkr -> reval rest (i1 :: i2 :: stkr)
      | _,       _                -> raise (Failure "reval: unknown op")

let rpn1 = reval [RCstI 10; RCstI 17; RDup; RMul; RAdd] [];


(* Compilation of a variable-free expression to a rinstr list *)

let rec rcomp e : rinstr list =
    match e with
      | CstI i -> [RCstI i]
      | Prim("+", e1, e2) -> rcomp e1 @ rcomp e2 @ [RAdd]
      | Prim("*", e1, e2) -> rcomp e1 @ rcomp e2 @ [RMul]
      | Prim("-", e1, e2) -> rcomp e1 @ rcomp e2 @ [RSub]
      | Prim _            -> raise (Failure "unknown primitive")
      | _                 -> raise (Failure "rcomp: unimplemented op")
            
(* Correctness: eval e [] [] equals reval (rcomp e) [] *)

(* Storing intermediate results and variable bindings in the same
   stack.

   We can store intermediate results as well as variable bindings on
   the same stack.  This is possible because the scopes of variables
   are statically nested: the scope of a variable (and hence the need
   for its binding) does not extend beyond the expression in which it
   is bound.  
 *)

type sinstr =
  | SCstI of int                        (* push integer           *)
  | SVar of int                         (* push variable from env *)
  | SAdd                                (* pop args, push sum     *)
  | SSub                                (* pop args, push diff.   *)
  | SMul                                (* pop args, push product *)
  | SPop                                (* pop value/unbind var   *)
  | SSwap                               (* exchange top and next  *)
 
let rec seval (inss : sinstr list) stack = 
    match inss, stack with 
    | [], (v :: _)      -> v
    | [], []            -> raise (Failure "seval: no result")
    | (ins0 :: rest), _ ->
      match ins0, stack with
       | SCstI i,             _ -> seval rest (i :: stack) 
       | SVar i,              _ -> seval rest (stack.[i] :: stack) 
       | SAdd,     i2::i1::stkr -> seval rest (i1+i2 :: stkr)
       | SSub,     i2::i1::stkr -> seval rest (i1-i2 :: stkr)
       | SMul,     i2::i1::stkr -> seval rest (i1*i2 :: stkr)
       | SPop,        _ :: stkr -> seval rest stkr
       | SSwap,    i2::i1::stkr -> seval rest (i1::i2::stkr)
       | _,        _            -> raise (Failure "seval: error")


(* To compile for the single-stack machine, we must keep count (at
   compile-time) of the intermediate results, interspersed between the
   variable bindings on the stack.  For this we need a compile-time
   variable environment with dummies Intrm for intermediate values.  
*)

// rtvalue 运行时值 
// 绑定变量 或者中间值
type rtvalue =
  | Bound of string                     (* A bound variable       *)
  | Intrm                               (* An intermediate result *)


(* Compilation to a list of instructions for a unified-stack machine *)

let rec scomp e (cenv : rtvalue list) : sinstr list =
    match e with
      | CstI i -> [SCstI i]
      | Var x  -> [SVar (getindex cenv (Bound x))]
      | Let(x, erhs, ebody) ->           //局部变量入栈，       局部变量出栈
            scomp erhs cenv @ scomp ebody (Bound x :: cenv) @ [SSwap; SPop]
      | Prim("+", e1, e2) ->            //中间结果入栈，引发变量的相对索引的变化
            scomp e1 cenv @ scomp e2 (Intrm :: cenv) @ [SAdd] 
      | Prim("-", e1, e2) -> 
            scomp e1 cenv @ scomp e2 (Intrm :: cenv) @ [SSub] 
      | Prim("*", e1, e2) -> 
            scomp e1 cenv @ scomp e2 (Intrm :: cenv) @ [SMul] 
      | Prim _ -> raise (Failure "scomp: unknown operator")

let s1 = scomp e1 []
let s2 = scomp e2 []
let s3 = scomp e3 []


let v1 = seval s1 []
let v2 = seval s2 []
let v3 = seval s3 []
(* Correctness: eval e [] [] equals seval (scomp e []) [] 
   for an expression with no free variables.
*)

(* Net effect principle: when c = scomp e {} is the code generated for
   expression e, then the net result of evaluating c is to push the
   value of e onto the evaluation stack.

   Hence if v = eval e [] [] 
      then for any stack stk, seval (scomp e []) s  equals  v :: s  
*)


(* Output the integers in list inss to the text file called fname: *)

let intsToFile (inss : int list) (fname : string) = 
    let text = String.concat " " (List.map string inss)
    System.IO.File.WriteAllText(fname, text);;
