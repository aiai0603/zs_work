//第一题F#
let rec sumList list =

   match list with  

   | []-> 0    

   | head::tail -> head + sumList(tail) ;;

//第一题CPS风格
let rec sumList_cps list f =

   match list with  

   | []-> f 0    

   | head::tail ->  sumList_cps(tail)(fun v->f( head+v) )  ;;

//测试用例
let id = fun v -> v
sumList_cps [1;3;5] id;; 

//第二/三题的F#源代码
let rec map f list =
   match list with  
   | []-> [] 
   | head::tail -> (f head)::(map f tail) 

//源代码测试样例
let doublea a =a+3
map doublea [1;2;3]

//第二题的CPS
let rec map_cps f list k=
   match list with  
   | []-> k [] 
   | head::tail -> map_cps f tail (fun v->k(f head::v) ) 

//测试用例
let id = fun v -> v
map_cps doublea [1;3;5] id;; 

//第三题的CPS
let rec map_cps3 f list k=
   match list with  
   | []-> k [] 
   | head::tail -> map_cps3 f tail ( fun v ->( f (head::v) k )   )

//测试样例
let id = fun v -> v
let doubleb a k=k a
map_cps3 doubleb [1;3;5] id;; 


//第四题F#源代码
let min a b =
    if a>b then b
    else a

let min4 a b c d=
    min (min a b) (min c d)

//测试用例
min4 1 2 3 4 


//第四题的CPS
let min_cps a b k=
    if a>b then k b
    else k a

let min4_cps a b c d k =
    min_cps a b (fun v-> (min_cps c d (fun v2-> min_cps v v2 k)) )

//测试用例
min4_cps 1 2 3 4 id;;


//第五题
let myif a b c k=
    match a with
    | true -> k b
    | false -> k  c

myif (1>2) 4 5 id



//第六题源代码
type AUX = 
   | Add of int 
   | Sub of int
   

let rec aux first list = 
    match list with
    | [] -> first
    | head::tail -> 
        match head with
        | Add a -> aux ( first + a ) tail
        | Sub a -> aux ( first - a ) tail

//测试数据
aux 0 [Add 1;Add 2;Add 6;Sub 7];;

//第六题CPS
type AUX = 
   | Add of int 
   | Sub of int
   

let rec aux_cps first list k = 
    match list with
    | [] -> first
    | head::tail -> 
        match head with
        | Add a -> aux_cps  (first+a)  tail ( fun v -> (k v) )
        | Sub a -> aux_cps  (first-a)  tail ( fun v -> (k v) )



 //测试数据
aux_cps 0 [Add 2;Add 2;Add 6;Sub 7] id;;

