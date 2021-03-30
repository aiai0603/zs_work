(* Programming language concepts for software developers, 2012-02-13 *)
(* File Appendix.fs: The meta language F#, a crash course *)


(* Copy declarations from this file into fsi, the F# interactive top-level *)

(* Arithmetic expressions, the int type *)

3+4;;


(* Variables and binding *)

let res = 3+4;;

res * 2;;


(* Arithmetic expressions, the float type *)

let y = sqrt 2.0;;


(* Using methods from the .NET class library *)

open System;;
let z = Math.Sqrt 2.0;;


(* Logical expressions, the bool type *)

let large = 10 < res;;


(* Conditional expressions, logical operators, conditional expressions *)

y > 0.0 && 1.0/y > 7.0;;

not false ;;

if 3 < 4 then 117 else 118;;


(* String-valued expressions *)

let title = "Prof.";;
let name = "Lauesen";;
let junkmail =  "Dear " + title + " " + name + ", You won $$$!";;
junkmail.Length;;


(* Function declarations *)

let circleArea r = System.Math.PI * r * r;;
let a = circleArea 10.0;;

let mul2 x = 2.0 * x;;
mul2 3.5;;


let makejunk title name = 
    "Dear " + title + " " + name + ", You won $$$!";;
makejunk "Vice Chancellor" "Tofte";;


(* Recursive function declarations *)

let rec fac n = if n=0 then 1 else n * fac(n-1);;
fac 7;;


(* Mutually recursive function declarations *)

let rec even n = if n=0 then true else odd (n-1)
and odd n = if n=0 then false else even (n-1);;


(* Type constraints *)

let isLarge (x : float) : bool = 10.0 < x;;
isLarge 89.0;;


(* Local let-binding *)

let x = 42;;                    (* outer x is 42     *)
let r = let x = 9 + 16
        x * x;;                 (* inner x is 25     *)
x;;                             (* outer x unchanged *)


(* Pattern matching *)

let rec facm n = 
    match n with
    | 0 -> 1
    | _ -> n * facm(n-1);;


(* Anonymous function defined by pattern matching *)

let rec faca = 
    function 
      | 0 -> 1
      | n -> n * faca(n-1);;


(* Pairs and tuples, product types *)

let p = (2, 3);;
let w = (2, true, 3.4, "blah");;

let add (x, y) = x + y;;
add (2, 3);;

let noon = (12, 0);;
let talk = (15, 15);;

let earlier ((h1, m1), (h2, m2)) = h1<h2 || (h1=h2 && m1<m2);;


(* The empty tuple () of type unit, similar to void in C# and Java *)

System.Console.WriteLine "Hello!";;


(* Lists of integers *)

let x1 = [7; 9; 13];;
let x2 = 7 :: 9 :: 13 :: [];;
let equal = (x1 = x2);;

let ss = ["Dear"; title; name; "you won $$$!"];;
let junkmail2 = String.concat " " ss;;

let rec sum xs = 
    match xs with 
    | []    -> 0
    | x::xr -> x + sum xr;;

let x2sum = sum x2;;

let rec prod xs = 
    match xs with 
    | []    -> 1
    | x::xr -> x * prod xr;;

let x2prod = prod x2;;

let rec len xs = 
    match xs with
    | []    -> 0
    | x::xr -> 1 + len xr;;

let x2len = len x2;;

let sslen = len ss;;

let x3 = [47; 11];;

let x1x3 = x1 @ x3;;


(* Record types, record values, and labels *)

type phonerec = { name : string; phone : int };;

let ph = { name = "Kasper"; phone = 5170 };;

ph.name;;
ph.phone;;


(* Exceptions *)

exception IllegalHour;;
let mins1 h = 
    if h < 0 || h > 23 then raise IllegalHour
    else h * 60;;
mins1 25;;

try (mins1 25) with IllegalHour -> -1;;

let mins2 h = 
    if h < 0 || h > 23 then failwith "Illegal hour"
    else h * 60;;

mins2 25;;

let mins3 h = 
    if h < 0 || h > 23 then failwithf "Illegal hour, h=%d" h
    else h * 60;;

mins3 25;;


(* Algebraic datatypes *)

type person =
     | Student of string                   (* name              *)
     | Teacher of string * int;;           (* name and phone no *)

let people = [Student "Niels"; Teacher("Peter", 5083)];;

let getphone1 person =
    match person with 
    | Teacher(name, phone) -> phone
    | Student name         -> failwith "no phone";;

getphone1 (Student "Niels");;


(* The option datatype *)

type intopt = 
     | Some of int
     | None;;

let getphone2 person = 
    match person with 
    | Teacher(name, phone) -> Some phone
    | Student name         -> None;;

getphone2 (Student "Niels");;


(* Representing binary trees using a recursive datatype *)

type inttree =
     | Lf 
     | Br of int * inttree * inttree;;

let t1 = Br(34, Br(23, Lf, Lf), Br(54, Lf, Br(78, Lf, Lf)));;

let rec sumtree t = 
    match t with 
    | Lf -> 0
    | Br(v, t1, t2) -> v + sumtree t1 + sumtree t2;;

let t1sum = sumtree t1;;


(* Curried functions: int -> int -> int versus int * int -> int *)

let addp (x, y) = x + y;;

let addc x y = x + y;;

let res1 = addp(17, 25);;

let res2 = addc 17 25;;

let addSeventeen = addc 17;;

let res3 = addSeventeen 25;;

let res4 = addSeventeen 100;;


(* Polymorphic functions *)

let rec len xs = 
    match xs with
    | []    -> 0
    | x::xr -> 1 + len xr;;

len [7; 9; 13];;

len ["Oslo"; "Aarhus"; "Gothenburg"; "Copenhagen"];;


(* Polymorphic datatypes *)

type 'a tree =
     | Lf 
     | Br of 'a * 'a tree * 'a tree;;

let t1 = Br(34, Br(23, Lf, Lf), Br(54, Lf, Br(78, Lf, Lf)));;

let rec sumtree t =
    match t with 
    | Lf -> 0
    | Br(v, t1, t2) -> v + sumtree t1 + sumtree t2;;

let rec count t =
    match t with 
    | Lf -> 0
    | Br(v, t1, t2) -> 1 + count t1 + count t2;;

let rec preorder1 t = 
    match t with 
    | Lf            -> []
    | Br(v, t1, t2) -> v :: preorder1 t1 @ preorder1 t2;;

preorder1 t1;;

(* Accumulating parameters, for efficiency *)

let rec preo t acc =
    match t with 
    | Lf            -> acc
    | Br(v, t1, t2) -> v :: preo t1 (preo t2 acc);;

let preorder2 t = preo t [];;


(* Type abbreviations *)

type intenv = (string * int) list;;

let bind1 (env : intenv) (x : string, v : int) : intenv = (x, v) :: env;;

bind1 [("age", 47)] ("phone", 5083);;


(* Higher-order functions *)

let rec map f xs = 
    match xs with 
    | []    -> []
    | x::xr -> f x :: map f xr;;

let mul2 x = 2.0 * x;;

map mul2 [4.0; 5.0; 89.0];;

map isLarge [4.0; 5.0; 89.0];;


(* Anonymous functions *)

fun x -> 2.0 * x;;

map (fun x -> 2.0 * x) [4.0; 5.0; 89.0];;

map (fun x -> 10.0 < x) [4.0; 5.0; 89.0];;

let tw g x = g (g x);;

let quad = tw mul2;;

quad 7.0;;

fun x y -> x+y;;

fun x -> fun y -> x+y;;

let increaseBoth = fun i (x, y) -> (x+i, y+i);;

let isZeroFirst = function | [0] -> true | _ -> false;;


(* Higher-order functions on lists *)

let rec filter p xs =
    match xs with 
    | []    -> []
    | x::xr -> if p x then x :: filter p xr else filter p xr;;

let onlyEven = filter (fun i -> i%2 = 0) [4; 6; 5; 2; 54; 89];;

let rec foldr f xs e = 
    match xs with
    | []    -> e
    | x::xr -> f x (foldr f xr e);;

let len xs   = foldr (fun _ res -> 1+res) xs 0;;

let sum xs   = foldr (fun x res -> x+res) xs 0;;

let prod xs  = foldr (fun x res -> x*res) xs 1;;

let map g xs = foldr (fun x res -> g x :: res) xs [];;

let listconcat xss = foldr (fun xs res -> xs @ res) xss [];;

let stringconcat xss = foldr (fun xs res -> xs + res) xss "";;

let filter p xs = foldr (fun x r -> if p x then r else x :: r) xs [];;


(* References and updatable state *)

let r = ref 177;;

let v = !r;;

r := 288;;

!r;;

let nextlab = ref -1;;

let newLabel () = (nextlab := 1 + !nextlab; "L" + string (!nextlab));;

newLabel();;

newLabel();;

newLabel();;


(* Arrays *)

let arr = [| 2; 5; 7 |];;

arr.[1];;

arr.[1] <- 11;;

arr;;

arr.Length;;
