(*  OCaml Lecture I  *)

(* To start with we will use the top loop as a simple calculator. *)

3;; (* use ;; to end input. *)
3 + 4;; (* notice how  types are *inferred* in output *)
let x = 3 + 4;; (* x forever more is 7 - no mutation by default in OCaml! *)
x + 5;;
let y = 5 in x + y;; (* this makes y a local variable: think C's { int y; return(x+y); }  *)
(* y + 6 ;; *) (* errors because y was only defined *locally* in previous line *)

(* Boolean operations *)
true && false;;
true || false;;
1 = 2;; (* = not == for equality comparison *)
1 <> 2;;  (* <> not != for not equal *)

(* int and float cannot be mixed without being explicit *)
1;;
1.;; 
4 * 5;;
(* 4.0 * 1.5;; *) (* error -- '*' operator is only for integers *)
4.0 *. 1.5;;      (* works -- '*.' is for floats *)
(float 4) *. 1.5;; (* use an explicit caast when you want to mix *)
  
(* Lists are easy to create and manipulate *)
[1; 2; 3];;
[1; 1+1; 1+1+1];;
["a"; "b"; "c"];;
(* [1; "a"];; *) (* error - All elements must have same type - HOMOGENEOUS *)
[];; (* empty list *)

(* Operations on lists.  Lists are represented as BINARY TREES with left child a leaf. *)
0 :: [1; 2; 3];; (* :: is 'consing' an element to the front - fast *)
0 :: (1 :: (2 :: (3 :: [])));; (* long-hand version of the above *)
let z = [2; 4; 6];;
[1; 2; 3] @ [4; 5];; (* appending lists - slower *)
let y = 0 :: z;;
z;; (* Observe z itself did not change, its still [2; 4; 6] -- lists are always immutable *)

(* everything in OCaml returns values (i.e. is an 'expression') - no commands *)
if (x = 3) then (5 + 35) else 6;;
(if (x = 3) then 5 else 6) * 2;;
(* (if (x = 3) then 5.4 else 6) * 2;; *) (* type error:  two branches of if must have same type *)

(* ====================================================================== *)

(*  OCaml Lecture II  *)


(* Tuples - fixed length lists, but types of each element CAN differ, unlike lists *)

(2, "hi");;        (* type is int * string -- '*' is like "x" of set theory, a product *)
let tuple = (2, "hi");;

(* Defining and using functions *)

let squared x = x * x;; (* declare a function: "squared" is its name, "x" is its one parameter.  return implicit.  *)
squared 4;; (* call a function -- separate arguments with S P A C E S *)

(*
 * - no return statement; value of the whole body-expression is what gets 
 *   returned
 * - type is printed as domain -> range
 * - "officially", OCaml functions take only one argument - ! 
 *      multiple arguments can be encoded by some tricks (later)
*)

(* fibonacci series - 1 1 2 3 5 8 13 ... *)
let rec fib n =     (* the "rec" keyword needs to be added to allow recursion (ugh) *)
  if n <= 2 then
    1 
  else
    fib(n - 1) + fib (n - 2);;

fib 10;;

(* Anonymous functions: define a function as an expression *)

(* Similar to lambdas in Python, Java, etc - all are based on the lambda calculus *)

let funny_add1 = (function x -> x + 1);; (* "x" is (sole) argument here --  one-argument functions only *)
funny_add1 3;;
((function x -> x + 1) 4) + 7;; (*  a "->" function is an expression and can be used anywhere *)
((fun x -> x + 1) 4) + 7;; (*  shorthand notation -- cut off ction *)

(* multiple arguments - just leave spaces between multiple arguments in definition and use *)
let add x y = x + y;;
add 3 4;;
(add 3) 4;; (* same meaning as previous *)
let add3 = add 3;; (* don't need to give all arguments at once!  Type of add is in fact int -> (int -> int) *)
add3 4;;
add3 20;;

(* Conclusion: add is a function taking an integer, and returning a FUNCTION which takes ints to ints. 
   So, add is a HIGHER-ORDER FUNCTION: 
       it either takes a function as an argument, or returns a function as result. *)  

(* Observe 'int -> int -> int' is parenthesized as 'int -> (int -> int)' -- unusual RIGHT associativity *)

(* ******************************************************************** *)

(* Pattern matching: switch or case on steroids *)

(* A very cool and useful but not so common language feature; Haskell and Scala also have it *)

(* Basic pattern match with numbers, looks like switch more or less: *)

let mixemup n =
    match n with
    | 0 -> 4
    | 5 -> 0
    | y -> y + 1;; (* default case giving a name to the matched number, x *)

mixemup 3;; (* matches last case and x is bound to the value 3 *)

"Hawaii " ^ (match 5 with
      0 -> "Zero"
    | 5 -> "Five"  (* notice the "|" separator between multiple patterns *)
    | _ -> "Nothing") ^ "-O";; (* default case -- _ is a pattern matching anything and without a name for it *)

(* List pattern matching - now things get interesting! *)

match ['h';'o'] with      (* recall ['h';'o'] is really 'h' :: ('o' :: []) *)
    a :: (b :: c) -> "first"
      | x :: y -> "second"
      | _ -> "third";;

match ['h';'o'] with      (* recall ['h';'o'] is really 'h' :: ('o' :: []) *)
      | x :: y -> x
      | a :: (b :: c) -> b
      | _ -> '0';;

match ['h';'o';'p';' ';'h';'o';'p'] with      (* recall ['h';'o'] is really 'h' :: ('o' :: []) *)
      | x :: y -> y
      | _ -> ['0'];;


  match ["hi"] with (* ["hi"] is "hi" :: [] *)
      | x :: (y :: z) -> "first"
      | x :: y -> "second"
      | _ -> "third";;

(* tuple pattern matching *)
let tuple = (2, "hi", 1.2);;

match tuple with
  (f, s, th) -> s
;;

(* let pattern shorthand: a single pattern match to assign multiple values *)
let mypair = (2.2, 3.3);;
let (f, s) = mypair in f +. s;;  (* same behavior as "match mypair with (f,s) -> f +. s" *)

match mypair with (f,s) -> f +. s;;

  
let getSecond t = 
  match t with
    (f, s) -> s
;;
let s = getSecond (2, "hi");;
let s = getSecond mypair;;

let getSec t = 
  match t with
    (f, s) -> (s :: [],4)
;;  
(* warning - non-exhaustive pattern matching; avoid this *)
(* let getHead l = 
  match l with
    head :: tail -> head
;;
 *)

(* getHead [];; *)  (* OCaml warned before that this case is not covered: gives uncaught runtime exception *)

(* an error-free version *)

let getHead l = 
  match l with
    | [] -> failwith "you dodo"
  |  head :: tail -> head
;;

(* Patterns in function definitions *)

let cadd p = match p with (x, y) -> x + y;;

(* Shorthand for the above (only works because there is only one pattern clause - special *)
  
let cadd (x, y) = x + y;; (* same result *)

(* This 'cadd' takes only a SINGLE argument - a tuple - more like how C etc functions are called *)
cadd (1, 2);;

(* compare above add to this earlier one above, recalling: *)
let add x y = x + y;;
add 1 2;; (* notice different calling convention compared to cadd *)

(* The difference between cadd and add can be observed in their types.
     cadd : int * int -> int  -- C/Java etc style functions
      add : int -> int -> int -- the default OCaml style  *)
  
let add = (+);; (* this syntax is how you can give any built-in infix operator a name as a function *)

(* using patterns in recursive functions: a function to reverse a list
       note this does not mutate the list, it makes a new list that reverses original
   
   We also want to study this function to show how its correctness is
   justified by an induction argument

*)

let rec rev l = 
  match l with
    [] -> []
  | x :: xs -> rev xs @ [x]
;;
rev [1;2;3];; (* = 1 :: ( 2 :: ( 3 :: [])) *)

(* Trace this: the recursive calls to compute the above are as follows *)

(rev [2;3]) @ [1];;
(rev[3] @ [2]) @ [1];;
((rev[]@[3]) @ [2]) @ [1];;
(([]@[3]) @ [2]) @ [1];;

(* Theorem: rev reverses any list.
 * Proof: by induction on the length of the list, say l.
 * Case  l = []: obviously [] is correct
 * Case l is x :: xs for some x and xs:  we assume by INDUCTION that "rev xs" reverses the tail;
 * then, the result "rev xs @ [x]" will clearly be the reverse of the whole list.  QED. 
 *)


(* ====================================================================== *)

(*  OCaml Lecture III  *)


(* Brief tour of simple variant types for assignment 1 *)

(* Variant types are like unions in C, and generalize enums of Java.
   Unlike types up to now you need to declare them. *)

type comparison = LessThan | EqualTo | GreaterThan;;

let intcmp x y =
	if x < y then LessThan else
		if x > y then GreaterThan else EqualTo;;  

(* Of course we will pattern match to take the data apart *)
  
match intcmp 4 5 with
  | LessThan -> "less!"
  | EqualTo -> "equal!"
  | GreaterThan -> "greater!";;

(* Variants can also wrap arguments: they are more like C unions than Java enums *)
  
type 'a nullable = Null | NotNull of 'a;;

match NotNull(4) with
  | Null -> "null!"
  | NotNull(n) -> (string_of_int n)^" is not null!"
;;
    
  
(* Immutable declarations *)
(*
 * All variable declarations in OCaml are IMMUTABLE -- value will never change
 * helps in reasoning about programs, we know the variable's value is fixed
 *)
(let y = 3 in 
  ( let x = 5 in
    ( let f y = x + y in
      ( let x = y in  (* this is a SHADOWING (re-)definition of x, NOT an assignment *)
        (f (y - 1)) + x 
            )
        )
    )(* x is STILL 5 in the function body - thats what x was when f defined *)
)
;;

(* top loop is conceptually an open-ended series of lets which never close: compare following with previous *)
let y = 3;;
let x = 5;;
let f y = x + y;;
let x = y;; (* as in previous example, this is a nested definition, not assignment! *)
f (y-1) + x;;


(*
 * Function definitions are similar, you can't mutate an existing definition.
 *)

let f x = x + 1;;

let g x = f (f x);;

let shad = f;; (* make a new name for f *)

(* lets "change" f, say we made an error in its definition above *)

let f x = if x <= 0 then 0 else x + 1;; 

g (-5);; (* we didn't re-submit g, so the version above refers to now-shadowed f - !! *)

let g x = f (f x);; (* need to resubmit (identical) g code since it depends on f *)
g (-6);; (* now it works as expected *)
  
(* MORAL: When interactively editing a group of functions that call each other, 
 *        re-submit ALL the functions to the top loop when you change any ONE 
 *        of them.  Otherwise you can have some functions using a now-shadowed version.
 *)

(* Mutually recursive functions *)

(* warm up to the next function - write a (useless) copy function on lists *)

let rec copy l = match l with 
              [] -> []
            | hd :: tl ->  hd::(copy tl)

let result = copy [1;2;3;4;5;6;7;8;9;10]

(* copy is useless because immutable data can't be mutated so never a need to copy, ever! *)
                                                
(* Refine copy to flip back and forth between copying and not *)
                                            
let rec 
     copyodd l = match l with 
              [] -> []
            | hd :: tl ->  hd::(copyeven tl)
and  (* mutually recursive functions must be defined together via the "and" keywd *)
     copyeven l = match l with 
              [] -> []
            | x :: xs -> copyodd xs;;

copyodd [1;2;3;4;5;6;7;8;9;10];;
copyeven [1;2;3;4;5;6;7;8;9;10];;

(* Understand the above by giving clear specifications 
   Spec: take returns only the ODD elements of a list, skip returns only the EVEN ones *)

(* Using let .. in to hide functions *)
(* Here is a version that hides the skip function -- make both internal and export one *)
                        
let copyoddonly ll =
    ( let rec 
     copyoddlocal l = match l with 
              [] -> []
            | hd :: tl ->  hd::(copyevenlocal tl)
  and
     copyevenlocal l = match l with 
              [] -> []
            | x :: xs -> copyoddlocal xs
        
  in 
   copyoddlocal ll
    );;
    
copyoddonly [1;2;3;4;5;6;7;8;9;10];;

(* ******************************************************************** *)


  
(* 
 * Higher Order Functions - 
 *          functions that either:
 *                        take other functions as arguments
 *                     or return functions as results
 *                     or both
 *
 *    Why?
 *       - "pluggable" programming by passing in and out chunks of code
 *       - greatly increases reusability of code since any varying part in
 *         a pattern can be pulled out as a function parameter
 *)

(* Lets show the power by extracting out some pluggable code *)

(* Example: multiply each element of a list by ten *)

let rec timestenlist l =
  match l with 
    []    -> []
  | hd::tl -> (hd * 10) :: timestenlist tl;;

timestenlist [3;2;50];;

(* Example: append gobble to a list of words *)

let rec appendgobblelist l =
  match l with 
    []    -> []
  | hd::tl -> (hd ^"gobble") :: appendgobblelist tl;;

appendgobblelist ["have";"a";"good";"day"];;
("have" ^"gobble") :: ("a"^"gobble") :: appendgobblelist ["good";"day"];;

(* Notice there is a *pattern* here of "do an operation on each list element"
 * So lets pull out the "times ten" / "add gobble" as a function parameter!
 * this is in fact a classic example, the map function *)

let rec map f l =  (* Notice we are taking a function f as ARGUMENT here *)
  match l with 
    []    -> []
  | hd::tl -> (f hd) :: map f tl;;

map (fun x -> x * 10) [3;2;50];;
let middle = List.map (function s -> s^"gobble");;  (* here we use the built-in List.map which is the same as the one we defined *)
middle ["have";"a";"good";"day"];;

map (fun (x,y) -> x + y) [(1,2);(3,4)];;  (* two-argument via a pair.  Note "fun" can be used as shorthand for "function" *)

let flist = map (fun x -> fun y -> x + y) [1;2;4] ;; (* lists of functions! *)

(* This also shows why these "anonymous" functions are useful. *)

(* named and anonymous functions are (still) identical in usage *)
let timesten x = x * 10;;
map timesten [1;2;3;34;56;90];;

(* Composition function g o f - takes in any 2 functions and returns their composition
 *)
let compose g f = (fun x -> g (f x));;

let plus3 x = x+3;;
let times2 x = x*2;;
let times2plus3 = compose plus3 times2;;
times2plus3 10;;
let t2p3 = compose (function x -> x+3) (function x -> x*2) 10;; (* equivalent but with anonymous functions *)

(* Other equivalent ways to define compose *)

let compose2 g f x =  g (f x);;
let compose3 = (fun g -> (fun f -> (fun x -> g(f x))));;


(*
  Parametric polymorphism
*)

let id = fun x -> x;;
let id x = x;;

(* id applied to int returns an int *)
id 3;;
(* SAME id applied to bool returns a bool *)
id true;;
(* conclusion: the type of id ('a -> 'a) is PARAMETRIC, i.e. the return type is 
   parameterized by the type of the argument.  Same as Java's generics.
    
We saw several parametric functions above: *)

copyodd;;    (* observe type is 'a list -> 'a list *)
map;;     (* type is ('a -> 'b) -> 'a list -> 'b list *)
compose;; (* type is ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b *)

(* ******************************************************************** *)



(*
 * Self-study topic: in fact, only 'let'-defined functions are polymorphic
 *)

(* Background: turning a let-defined function into an argument to a function *)

let add1 = fun x -> x + 1;;
add1 4;;

(* Equivalent way to do the above: define add1 as an anonymous function and pass in *)

(function addup -> addup 4)(fun x -> x + 1);;

(* Lets try to do the same refactoring for a polymorphic function *)

let id = function x -> x;;

match id (true) with 
    true -> id (3) 
  | false -> id(4);;


(* The below will error - variable mono_id is not defined by let so it can't be polymorphic

(function mono_id -> 
    match mono_id(true) with 
                true -> mono_id(3) 
              | false -> mono_id(4)) (fun x -> x);;
*)

(* If only used at one type its OK: *)

(function mono_id -> mono_id 4) id;; (* mono_id is solely of type int -> int, thats OK *)

(* ******************************************************************** *)


  
(* One topic left in higher-order functions ...
   Currying - idea due to logician Haskell Curry
*)

(* First lets recall how functions allow incremental arguments to be passed *)
let addC x y = x + y;;
addC 1 2;; (* recall this is the same as '(addC 1) 2' *)
let tmp = addC 1 in tmp 2;; (* the partial application of arguments - result is a function *)

(* an equivalent way to define addC, clarifying what the above means: *)
let addC = function x -> (function y -> x + y);;
(* yet another identical way .. *)
let addC x = function y -> x + y;;

(addC 1) 2;; (* same result as above *)

(* Also recall the related  non-Curry'ing version: use a pair of arguments instead *)
let addNC p =
    match p with (x,y) -> x+y;;

(* recall this equivalent abbreviation *)
let addNC (x, y) = x + y;;


(* Notice how the type of the above differs from addC's type *)
addNC (3, 4);;
(* addNC 3;; *) (* error, need all or no arguments supplied *)

(*
 * Fact: these two approaches to a 2-argument function are isomorphic:
 *
 * 'a * 'b -> 'c === 'a -> 'b -> 'c
 *
 * We now define two cool higher-order functions: 
 *
 * curry   - takes in non-curry'ing 2-arg function and returns a curry'ing version 
 *
 * uncurry - takes in curry'ing 2-arg function and returns an non-curry'ing version 
 * Since we can then go back and forth between the two reps, they are
 *      ***ISOMORPHIC***
 *)
let curry fNC = function x -> function y -> fNC (x, y);;
let uncurry fC = function (x, y) -> fC x y;;

let newaddNC = uncurry addC;;
newaddNC (2,3);;
let newaddC  = curry   addNC;;
newaddC 2 3;;

(* Observe the types themselves pretty much specify the behavior: *)
(* curry : ('a * 'b -> 'c) -> 'a -> 'b -> 'c *)
(* uncurry : ('a -> 'b -> 'c) -> 'a * 'b -> 'c *)

let noop1 = curry (uncurry addC);; (* a no-op *)
let noop2 = uncurry (curry addNC);; (* another no-op; noop1 & noop2 together show isomorphism *)

(* End Currying topic *)

(* Misc OCaml *)

(* See http://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html 
   for various functions available in the OCaml top-level.

   See http://caml.inria.fr/pub/docs/manual-ocaml/stdlib.html for modules of extra
     functions for lists, strings, integers, as well as sets, trees, etc structures *)
  
(* print_x for atomic types 'x', again no overloading in meaning here *)
  print_string ("hi\n");;

(* raise a failure exception (more on exceptions later) *)

(failwith "BOOM!") +3 ;;    

(* you CAN also declare types, anywhere in fact *)
(* Put parens around any such declaration or it won't parse *)

let add (x: float) (y: float) = x +. y;;
let add (x: int) (y: int) = (((x:int) + y) : int);;

(* type abbreviations via "type" *)
type intpair = int * int;;
let f (p : intpair) = match p with 
                      (l, r) -> l + r
;;
(2,3);; (* ocaml doesn't call this an intpair by default *)
f (2, 3);; (* can pass it to the function expecting an intpair due to type defn *)
((2,3):intpair);; (* can also explicitly tag data with its type *)


(* ******************************************************************* *)

(* An old PL Homework 1  - lets work through some of it to get experience  
   with writing simple functional OCaml programs *)

(* 
   1. Write a function 'compose_funs' which takes a list of functions 
   [f1; ...; fn] and returns a function representing the composition 
   fn o .. o f1 of all of these.
 *)

let rec compose_funs lf = 
  match lf with
    [] -> (function x -> x)
  | f :: fs -> (function x -> (compose_funs fs) (f x))
;;

(* equivalent alternate version - refactor to hoist out the "function x" *)

let rec compose_funs lf = 
  function x -> 
    (match lf with
      [] -> x
    | f :: fs -> (compose_funs fs) (f x)
    )
;;

(* Yet another equivalent alternative - hoist x up one more level *)

let rec compose_funs lf x = 
    match lf with
      [] -> x
    | f :: fs -> (compose_funs fs) (f x)
;;

(* tests *)

let composeexample = compose_funs [(function x -> x+1); (function x -> x-1);
                 (function x -> x*3); (function x -> x-1)];;
 
composeexample 5;; (* should return 14 *)


(*
   2. Write a function 'toUpperCase' which takes a list (l) of characters and 
   returns a list which has the same characters as l, but capitalized (if not
   already).
   
   Note: 1. Assume that the capital of characters other than alphabets 
            (A - Z or a - z), are the characters themselves e.g.

                character               corresponding capital character
 
                    a                             A
                    z                             Z
                    A                             A
                    1                             1
                    %                             %

         2. You can only use Char.code and Char.chr library functions.
            You CANNOT use Char.uppercase.
 *)

let toUpperChar c =
  let c_code = Char.code c in
  if c_code >= 97 && c_code <= 122 then
    Char.chr (c_code - 32) 
  else c;;
    

let rec toUpperCase l =
  match l with
    [] -> []
  | c :: cs -> toUpperChar c :: toUpperCase cs 
;;


(* test *)
toUpperCase ['a'; 'q'; 'B'; 'Z'; ';'; '!'];;
                             (* should return ['A'; 'Q'; 'B'; 'Z'; ';'; '!'] *)

(* could have used map instead (note map is built in as List.map): *)

let toUpperCase l = List.map toUpperChar l ;;

(* could have also defined it even more simply - partly apply the Curried map : *)

let toUpperCase = List.map toUpperChar ;;

(*
   3. Write a function 'nth' which takes a list (l) and index (n) and returns
   the nth element of the list. If n is an invalid index i.e. n is negative or
   l has less then (n + 1) elements raise 'exception Failure' declared below.
   
   Note: indices start with 0 for the head of the list, 1 for the next element
         and so on (similar to arrays).
 *)
                 
exception Failure;; (* declares an exception; just write "raise Failure" *)
                    (* to raise it *)

let rec nth l n = 
  match l with
    [] -> raise Failure
  | x :: xs -> 
      if n = 0 then    
        x
      else
        nth xs (n - 1) (* eureka *)
;;


(* tests *)
nth [1;2;3] 0;; (* should return 1 *)
nth [1;2;3] 1;; (* should return 2 *)
nth [1;2;3] (-1);; (* should raise exception *)
nth [1;2;3] 3;; (* should raise exception *)

(*
   4. Write a function 'partition' which takes a predicate (p) and a list
   (l) as arguments  and returns a tuple (l1, l2) such that l1 is the
   list of all the elements of l that satisfy the predicate p and l2
   is the list of all the elements of l that do NOT satisfy p. The
   order of the elements in the input list (l) should be preserved.
   
   Note: A predicate is any function which returns a boolean.
         e.g. let isPositive n = (n > 0);; 
 *)

let rec partition p l =
    match l with [] -> ([],[])
        | hd :: tl -> let (posl,negl) = partition p tl in
                                        if (p hd) then (hd :: posl,negl)
                                                            else (posl,hd::negl)


(* test *)
let isPositive n = n > 0;;
partition isPositive [1; -1; 2; -2; 3; -3];; (* should return             *)
                         (*    ([1; 2;    3], [-1; -2; -3]) *)


(* 
   5. Write a function 'diff' which takes in two lists l1 and l2 and returns 
      a list containing all elements in l1 not in l2.

   Note: You will need to write another function 'contains x l' which checks 
         whether an element 'x' is contained in a list 'l' or not.
 *)

let rec contains x l = 
  match l with
    [] -> false
  | y :: ys -> x = y || contains x ys
;;

let rec diff l1 l2 = 
  match l1 with
    [] -> []
  | x :: xs -> 
      if contains x l2 then
    diff xs l2
      else
    x :: diff xs l2
;;


(* tests *)
contains 1 [1; 2; 3];; (* should return true *)
contains 5 [1; 2; 3];; (* should return false *)
diff [1;2;3] [3;4;5];; (* should return [1; 2] *)
diff [1;2]   [1;2;3];; (* should return [] *)



(* ====================================================================== *)

(*  OCaml Lecture IV  *)

(* ******************************************************************* *)

(* Next topic: user-defined data-structures -- variants & records *)
(* Big change from above: we need to declare some types now.  *)
(* Still more convenient than Java etc: declare a type once globally, infer thereafter *)

(* 
 * Variant Type Declaration 
 *    - related to union types in C or enums in Java: "this OR that OR theother"
 *    - BUT like OCamls lists/tuples they are immutable data structures
 *    - each case of the union is identified by a name called 'Constructor'
 *      which serves for both
 *           - Constructing values of the variant type
 *           - inspecting them by pattern matching
 *      - Constructors must start with Capital Letter to distinguish from variables
 *      - type declarations needed but once they are in place type inference on them works
 *)

(* 
 * variant type for doing mixed arithmetic (integers and floats) 
 *)

type mynumber = Fixed of int | Floating of float;;  (* read "|" as "or", same as match *)

Fixed 5;;
Floating 4.0;;

(* note constructors look like functions but they are not -- you always need to give arg *)


let pullout x = 
    match x with 
    | Fixed n -> n              (* variants fit very well into pattern matching syntax *)
    | Floating z -> int_of_float z;;

pullout (Fixed 5);;

(* arithmetic operations on 'mynumber' variant type *)
let add_num n1 n2 =
   match (n1, n2) with    (* note use of pair here to parallel-match on two variables  *)
     (Fixed i1, Fixed i2) ->       Fixed   (i1       +  i2)
   | (Fixed i1,   Floating f2) ->  Floating(float i1 +. f2)       (* need to coerce *)
   | (Floating f1, Fixed i2)   ->  Floating(f1       +. float i2) (* ditto *)
   | (Floating f1, Floating f2) -> Floating(f1       +. f2)
;;

add_num (Fixed 123) (Floating 3.14159);;

(*
 * Enum types 
 *     - special case of variant types, 
 *       where all alternatives are constants
 *)

type sign = Positive | Negative | Zero;;

let sign_int n = if n > 0 then Positive else if n = 0 then Zero else Negative;;
sign_int (-6);;

(* Multiple data items in a construct?  Use the pre-existing product type! *)

type complex = CZero | Nonzero of float * float;;

let com = Nonzero(3.2,11.2);;

(* 
 * Recursive data structures - a key use of variant types 
 *
 *  - Functional programming is fantastic for computing over tree-structured data
 *     -- (and conversely NOT as good at dealing with graphs: hard to recurse on)
 *  - recursive types can refer to themselves in their own definition
 *  - similar in spirit to how C structs can be recursive (but, no pointer needed here)
 * 
 * e.g. binary trees with integers in nodes and empty leaves:
*)
type itree = ILeaf | INode of int * itree * itree;;  (* type refers to itself! *)

INode(4,ILeaf,INode(2,INode(18,ILeaf,ILeaf),ILeaf));;

(* Better polymorphic version of above which allows any type at leaves: *)

type 'a btree = Leaf | Node of 'a * 'a btree * 'a btree;;

(* Observe how above type takes a (prefix) argument, 'a -- "btree" is a type function *)

(* example trees *)

let whack = Node("whack!",Leaf, Leaf);;
let bt = Node("fiddly ",
            Node("backer ",
               Leaf,
               Node("crack ",
                  Leaf,
                  Leaf)),
            whack);;

let bt2 = Node("fiddly ",
            Node("backer ",
               Leaf,
               Node("crack ",
                  Leaf,
                  Leaf)),
            whack);;

(* type error, must have uniform data: Node("fiddly",Node(0,Leaf,Leaf),Leaf);;  *)  

(* OCaml's lists could have been defined with a recursive type declaration *)

type 'a mylist = MtList | ColonColon of 'a * 'a mylist;;

let mylisteg = ColonColon(3,ColonColon(5,ColonColon(7,MtList)));; (* [3;5;7] *)

let rec double_list_elts ml = 
  match ml with
    | MtList -> MtList (* vs [] -> [] *)
    | ColonColon(mh,mt) -> ColonColon(mh * 2,double_list_elts mt);; (* vs mh :: mt -> .. *)

double_list_elts mylisteg;;

(*
 * Functions on binary trees are similar to functions on lists: use recursion
 *
 *)

let rec add_gobble bintree =
   match bintree with
     Leaf -> Leaf
   | Node(y, left, right) ->
       Node(y^"gobble",add_gobble left,add_gobble right)
;;

let gobtree = add_gobble bt;;

let rec lookup x bintree =
   match bintree with
     Leaf -> false
   | Node(y, left, right) ->
       if x = y then 
          true 
       else if x < y then 
          lookup x left 
       else 
          lookup x right
;;

lookup "whack!" bt;;
lookup "flack" bt;;

(* Recall we are still all functional: tree insert is functional insert, return the new tree *)

let rec insert x bintree =
   match bintree with
     Leaf -> Node(x, Leaf, Leaf)
   | Node(y, left, right) ->
       if x <= y then 
         Node(y, insert x left, right)
       else 
         Node(y, left, insert x right)
;;

let goobt = insert "goober " bt;;
bt;; (* Yes, OCaml data structures are by default immutable! *)
let gooobt =
  insert "slacker " goobt;;

(* END variants *)

(* 
 * Record Declarations 
 *   - like tuples but with labels on fields.
 *   - similar to the structs of C/C++.
 *   - types are declared just like variants.
 *   - can be used in pattern matches as well.
 *   - again the fields are immutable by default
 *   - not used as often as structs of C, most data is a variant with tupled multiple arguments
 *)

(* record to represent rational numbers *)
type ratio = {num: int; denom: int};;

let q = {num = 53; denom = 6};;

q.num;;
q.denom;;

(* pattern matching works of course *)
let rattoint r =
 match r with 
   {num = n; denom = d} -> n / d;;

(* only one pattern matched so can again inline pattern as parameter *)
let rattoint {num = n; denom = d}  =
   n / d;;

(* equivalently can use dot projections *)
let rattoint r  =
   r.num / r.denom;;

rattoint q;;

let add_ratio r1 r2 = {num   = r1.num * r2.denom + r2.num * r1.denom; denom = r1.denom * r2.denom};;

add_ratio {num = 1; denom = 3} {num = 2; denom = 5};;

(* Somewhat annoying shadowing issue: there is one global namespace of record labels *)

type newratio = {num: int; coeff: float};; (* shadowing ratio's label num *)

function x -> x.num;; (* requires x to be a newratio -- inference HAS to give one type. *)

(* one solution: declare type *)
  
function (x : ratio) -> x.num;;

(* another solution: pattern match on record *)

function {num = n; denom = d} -> d;;    

(* OCaml programmers often use tuples instead of records since the record name
 * issue is not handled satisfactorily *)

(* ********************************************************************** *)

(* 
 * State 
 *   - variables in ML are NEVER directly mutable themselves; only (indirectly)
 *     mutable if they hold a
 *      - reference
 *      - mutable record
 *      - array
 *
 *   - Indirect mutability - variable itself can't change, 
 *                           but what it points to can.
 *   - items are immutable unless their mutability is explicitly declared
 *   
 *   - DON'T use state unless its really needed (you can't use it in HW1 or most of HW2)
 *)

(* References *)

let x = ref 4;;    (* always have to declare initial value when creating a reference *)

(* Meaning of the above: x forevermore (i.e. forever unless shadowed) refers to a fixed cell. 
   The CONTENTS of that fixed call can change, but not x. *)
  
(* x + 1;; *) (* a type error ! *)

!x + 1;; (* need !x to get out the value; something like *x in C *)
x := 6;; (* assignment - x must be a ref cell.  Returns () - goal is side effect *)
!x + 1;; (* Mutation ! *)

(* 'a ref is really implemented by a mutable record with one field, contents: 
     'a ref abbreviates the type { mutable contents: 'a }
             -- the keyword mutable on a record field means it can mutate *)

let x = { contents = 4};; (* identical to x's definition above *)
x := 6;;
x.contents <- 7;;  (* same effect as previous line: update contents field *)

!x + 1;;
x.contents + 1;; (* same effect as previous line *)

(* declaring your own mutable record: put "mutable" qualifier on field *)

type mutable_point = { mutable x: float; mutable y: float };;
let translate p dx dy = 
                p.x <- (p.x +. dx); (* observe use of ";" here to sequence effects *)
                p.y <- (p.y +. dy)  (* ";" is useless without side effects (think about it) *)
                                ;;
let mypoint = { x = 0.0; y = 0.0 };;
translate mypoint 1.0 2.0;;
mypoint;;

(* observe: mypoint itself is immutable but it has two spots in it where we can mutate *)

(* tree with mutable nodes *)

type mtree = MLeaf | MNode of int * mtree ref * mtree ref
;;

(*
 * - ONLY ref typed variables or mutable records may be assigned to
 * - The notion of immutable variables is one of the great strengths of ML.
 * - Note: 'let' doesn't turn into a mutation operator with 'ref's
 *)

let x = ref 4;;
let f () = !x;; (* This is syntax for a 0-argument function in OCaml - it only takes () as argument *)

x := 234;;
f();;

let x = ref 6;; (* shadowing previous x definition, NOT an assignment to x !! *)
f ();;

(* Yes, we can even write a while loop ! *)
let x = ref 1 in 
    while !x < 10 do 
      print_int !x; 
      print_string "\n"; 
      x := !x + 1
    done;;

(* Fact: while loops are useless without mutation: either never loop or infinitely loop *)
  
(*
 * Why is immutability good?
 *    - programmer can depend on the fact that something will never be mutated 
 *        when writing code: permanent like mathematical definitions
 * 
 * ML still lets you express mutation, but its extra so you only use it when 
 *   its really needed
 *
 * Haskell has an even stronger separation of mutation, its all strictly "on top".
 *)

(* 
 * Arrays 
 *   - fairly self-explanatory
 *   - have to be initialized before using
 *   - in general there is no such thing as "uninitialized" in OCaml.
 *)

let arrhi = Array.make 100 "";; (* size and initial value are the params here *)
let arr = [| 4; 3; 2 |];; (* another way to make an array *)
arr.(0);; (* access (unfortunately we already used [] for lists in the syntax) *)
arr.(0) <- 55;; (* update *)
arr;;


(* Exceptions: pretty standard and mostly Java-like *)

exception Foo;;  (* This is a new form of top-level declaration, along with let, type *)

let f () = raise Foo;; (* note no need to "raises Foo" in functions type as in Java *)
f ();;

exception Bar;;

let g _ =  (* note that unlike Java there is no "raises" in the type of g *)
  (try 
    f () 
  with 
    Foo ->  5 | Bar -> 3) + 4;; (* Use power of pattern matching in handlers *)
g ();;

(* exceptions that pass up an argument - syntax is sort of like a variant *)
exception Goo of string;;

let f _ = raise (Goo "keyboard on fire");;
f ();;

let g () = 
  try 
    f () 
  with 
      Foo -> ()
        | Goo s ->
      (print_string("exception raised: ");
       print_string(s);print_string("\n"))
;;
g ();;

(* There are a few built-in exceptions we are already using *)

failwith "Oops";; (* Generic code failure - exception is named Failure *)
invalid_arg "This function works on non-empty lists only";; (* Invalid_argument exception *)
    
(* END Exceptions *)

(* ====================================================================== *)

(* OCaml Lecture V  *)

(* OCaml Modules - structures and functors *)

(* Modules in programming languages
   - a module is a larger level of program abstraction: functional units or library. 
   - e.g. Java package, C/C++ directory w/ header files
  
Some principles of modules:

  -  Modules have names they can be referenced by.
  -  A module contains code declarations: functions, classes,  types, etc.
  -  The module has an interface in which it 
      * imports some things (e.g. other modules) from the outside and  
      * exports some things it has declared for outsiders to use; **hides** other things (key feature)

 The C/C++ "module" system
   - Informal use of files and filesystem directories as modules 
   - .h file declaring what is externally visible for a module

 Problems with C/C++ modules
   - There is a global space of function names, so there can be name clashes
   - There is no strict relation enforced between the .c and .h  files
       * bad programmers can write really ugly code
 
 The Java module system: packages

  - A cleaner version of the C/C++ spirit of module
  - Directory is explicitly a package; allows for nested packages
  - Implicit .h file in the public decls on classes/methods
  - public/private/etc for information hiding
  - Separate namespace for each package avoids name clashes
  - Have to have at least the .class files of the imports around to compile

*)

(* OCaml Modules *)  
  
(* 
   OCaml module definitions are called **structures** (via the struct keyword) 
    - collections of related definitions (functions, types, other structures, 
                                          exceptions, values, ...) given a name
 *)

module FSet =
struct
    exception NotFound (* any top-level definition can be included in a module *)
    
    type 'a set = 'a list (* sets are just lists but make a new type to keep them distinct *)
    
    let emptyset : 'a set = []
    
    let rec add x (s: 'a set) = ((x :: s) : ('a set)) (* observe this is a FUNCTIONAL set - RETURN new *)
    
    let rec remove x (s: 'a set) =
        match s with
            [] -> raise NotFound
    | hd :: tl ->
                if hd = x then
                    (tl: 'a set)
                else
                    hd :: remove x tl
    
    let rec contains x (s: 'a set) =
        match s with
            [] -> false
        | hd :: tl ->
                if x = hd then
                    true
                else
                    contains x tl
end
;;

(* observe what is printed in the top loop when the above is entered: a module *signature* is inferred 

    - The types of structs are called signatures
          - they are the interfaces for structures, something like Java interfaces
          - signatures can be used to hide some things from outside users

*)

(* Using modules: its something like Java packages, qualify the name *)

let mySet = FSet.add 5 [];;  (* notice the return type here: int FSet.set -- includes module name *)
let myNextSet = FSet.add 22 mySet;;
FSet.contains 5 mySet;;
FSet.remove 5 myNextSet;;

open FSet;; (* puts an implicit "FSet." in front of all things in FSet; may shadow existing names *)

add "a" ["b"];;
contains "a" ["a"; "b"];;

(* ********************************************************************** *)
(* OCaml's module signatures and using them for information hiding *)

module type GROWINGSET = (* define a module type (signature) with no remove; not very useful *)
  sig
    exception NotFound
    type 'a set = 'a list
    val emptyset : 'a set
    val add : 'a -> 'a set -> 'a set
    val contains : 'a -> 'a set -> bool
  end
;;

module GrowingSet = (FSet: GROWINGSET);; (* constrain a structure to have that signature *)
GrowingSet.add "a" ["b"];;

(* GrowingSet.remove;; *) (* Error: remove in struct but not in signature! *)

FSet.remove;;  (* This is still fine, remember we are not mutating FSet when making GrowingSet *)

(* Now lets do some useful hiding.  Hiding types is possible and allows "black box" data structures 
   - can be good software engineering practice to enforce hiding of internals *)

module type HIDDENSET = 
  sig
    type 'a set (* hide the type 'a list here by not giving 'a set definition in signature *)
    val emptyset : 'a set
    val add: 'a -> 'a set -> 'a set
    val remove : 'a -> 'a set -> 'a set
    val contains: 'a -> 'a set -> bool    
  end
;;

module HiddenSet = (FSet: HIDDENSET);;

(* HiddenSet.add 3 [];; *) (* Error: [] not a set since we HID the fact that sets are really lists *)

let hs = HiddenSet.add 5 (HiddenSet.add 3 HiddenSet.emptyset);; (* now it works - <abstr> result means type is abstract *)
HiddenSet.contains 5 hs;;

(* Also can declare signature along with module *)

module HFSet : 
  sig
    type 'a set
    val emptyset : 'a set
    val add: 'a -> 'a set -> 'a set
    val remove : 'a -> 'a set -> 'a set
    val contains: 'a -> 'a set -> bool    
  end =
struct
    exception NotFound
    type 'a set = 'a list
    let emptyset : 'a set = []
    let rec add x (s: 'a set) = ((x :: s) : ('a set))
    let rec remove x (s: 'a set) =
        match s with
            [] -> raise NotFound
        | hd :: tl ->
                if hd = x then
                    (tl: 'a set)
                else
                    hd :: remove x tl
    let rec contains x (s: 'a set) =
        match s with
            [] -> false
        | hd :: tl ->
                if x = hd then
                    true
                else
                    contains x tl
end
;;

let hs = HFSet.add 5 (HFSet.add 3 HFSet.emptyset);; (* now it works - <abstr> result means type is abstract *)

(* ********************************************************************** *)
  
(* Separate Compilation with OCaml

    - We can program OCaml in a cc / javac like way - use ocamlc instead of ocaml.
    - Key invariant: each OCaml module is a separate .ml file
    - Syntax of module **body** is identical
    - No header "module XX = struct .. end" is included in .ml module file
    - Name of module is capped name of file: fSet.ml defines module FSet 
    - File fSet.mli holds the signature of module FSet
       if there is no file set.mli thats OK; you have nothing hidden
    - Use ocamlc to compile and link to an executable: very similar to C/C++
    - main program that starts running is any non-values defined in the module(s)
    - Also need to compile the .mli files! (unlike .h files)

Here is how the ocamlc compiler makes object files

      .ml --ocamlc -c --> .cmo
      .mli --ocamlc -c --> .cmi

Then to make the binary

      .cmo's --ocamlc -o mybinary --> mybinary

You need any dependent .cmi's for modules you refer to before you can ocamlc -c them.

*)

module FSett: sig (* contents of file fSett.mli *) end
          = struct (* contents of file fSett.ml *) end;;

module Main: sig (* contents of main.mli *) end
           = struct (* contents of main.ml *) end;;

(* See http://pl.cs.jhu.edu/pl/ocaml/code/sep.zip for the example we cover in lecture.
   We will follow http://pl.cs.jhu.edu/pl/ocaml/code/sep_compile/readme.txt in particular.
   See the ocaml manual Chapter 8 for the full documentation *)

(* ********************************************************************** *)

(* Loading object file modules into the top loop *)

(* It is possible to mix ocamlc and ocaml for debugging: load .cmo files into top loop. *)

(* for the following to work need to first #cd to sep_compile/.  My computer's version:
#cd "/Users/scott/pl/ocaml/code/sep_compile";;
 *)
  
#load "fSet.cmo"
;;
FSet.emptyset;;
  
  

(* ********************************************************************** *)  

(* 
   Functors
       A "function" from structures to structures
       Allows a module to be parameterized and so instantiated in multiple ways
               - think of it as the ability to "plug in" a code module
             In object-oriented languages, object polymorphism gives you much of this ability
               - the "Animal" variable can have a Dog, Cat, Fish, etc plugged in to it
           But, OCaml has no object polymorphism and something is needed to support this
       General functors are found only in a few languages
*)


(* have this type above: type comparison = LessThan | EqualTo | GreaterThan *)
  
    (* here is a kind of struct that we can take as a parameter; in Java we would just use an interface Comparable *)
    
module type ORDERED_TYPE =
  sig
    type t
    val compare: t -> t -> comparison
  end;;

(* Here is a functor version of a set, you feed in a struct with the set element ordering defined on it *)

module FSetFunctor =
  functor (Elt: ORDERED_TYPE) ->
  struct
    type element = Elt.t (* import the type of elements from the structure *)
    type set = element list
    
    let empty = []

    let rec add x s =
      match s with
        [] -> [x]
      | hd::tl ->
          match Elt.compare x hd with
            EqualTo   -> s        
          | LessThan    -> x :: s   
          | GreaterThan -> hd :: add x tl

    let rec contains x s =
      match s with
        [] -> false
      | hd::tl ->
          match Elt.compare x hd with
            EqualTo   -> true     
          | LessThan    -> false    
          | GreaterThan -> contains x tl
  end;;

(* Here is a concrete ordering we can feed in, one over ints *)

module OrderedInt = 
  struct
    type t = int
    let compare x y = 
      if x = y then 
    EqualTo 
      else 
    if x < y then 
      LessThan 
    else 
      GreaterThan
  end;;

(* Here is how we feed it in, instantiating the functor to give a structure *)

module OrderedIntSet = FSetFunctor(OrderedInt);; (* note how this looks like a function application *)

let myOrderedIntSet = OrderedIntSet.add 5 OrderedIntSet.empty;;
OrderedIntSet.contains 3 myOrderedIntSet;;

(* We can do the same thing for a string comparison *)

module OrderedString =
  struct
    type t = string
      
    let compare x y = 
      if x = y then 
    EqualTo 
      else 
    if x < y then 
      LessThan 
    else 
      GreaterThan
  end;;

module OrderedStringSet = FSetFunctor(OrderedString);; (* a DIFFERENT instantiation of same *)

let myOrderedStringSet = OrderedStringSet.add "abc" OrderedStringSet.empty;;


(* Functors also have signatures; there can also be type abstraction in a functor signature *)

module type SETFUNCTOR = (* below is the syntax for a signature of a functor *)
    functor (Elt: ORDERED_TYPE) ->
  sig
    type element = Elt.t      (* concrete *)
    type set                  (* abstract *)
    val empty : set
    val add : element -> set -> set
    val contains : element -> set -> bool
  end;;

module AbstractSet = (FSetFunctor : SETFUNCTOR);; (* slap that sig on a functor *)
module AbstractIntSet = AbstractSet(OrderedInt);;

AbstractIntSet.add 5 AbstractIntSet.empty;;

(* end functors topic *)

