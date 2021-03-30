open System

let rec QuickSort(xs:List<int>) =
    match xs with
    |[]   -> []
    |[a] -> [a]
    |(x::xs) ->
        let smaller= QuickSort(xs |>List.filter(fun e->e<=x))
        let larger = QuickSort(xs |>List.filter(fun e->e>=x))
        smaller @ [x]@ larger

               
let data =[3;2;1;4;5;7;6]
let result= QuickSort data