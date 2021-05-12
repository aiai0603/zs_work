type 'a bst = NL | BinTree of  'a bst [] * 'a ;;
let T =  BinTree([| BinTree([| BinTree([| |],1) |],1) |],1);;

let rec depth(t)  = 
    match t with
    | NL -> 0
    | BinTree ( child,  value )  ->  
         let mutable temp = 0
         for i = 0 to child.Length-1 do
            if depth(child.[i])+1 > temp then
               temp <- depth(child.[i])+1
         temp;;
   
depth(T);;
  


