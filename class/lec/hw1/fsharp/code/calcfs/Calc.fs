open System
open FSharp.Text.Lexing
open Ast

let rec eval = function
    Lit(x) -> x
    | Binop(e1, op, e2) ->
        let v1 = eval e1 
        let v2 = eval e2 in
            match op with
                | Add -> v1 + v2
                | Sub -> v1 - v2
                | Mul -> v1 * v2
                | Div -> v1 / v2
[<EntryPoint>]
let main argv =
    let rec loop () = 
        printf "user>"
        let input =  Console.ReadLine()
        let lexbuf = LexBuffer<char>.FromString input 
        try 
            let expr = Parser.expr Scanner.token lexbuf in
                
                let result = eval expr in
                    //printfn "%A" expr;
                    printfn "%s"  (string result)
        with e ->
            printfn "Errors"       
        loop ()
    loop ()            