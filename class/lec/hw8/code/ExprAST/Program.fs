// Learn more about F# at http://fsharp.org

open System
open Parse
open Expr

let show e = printfn "%A\n" e

[<EntryPoint>]
let main argv =
    "program:" |> show
    let p1 = " let x = let x = 3 in x * z end in  2 * x end"
    p1 |> show

    "ast:" |> show
    let ast1 = fromString p1
    ast1 |> show

    "eval ast:" |> show

    eval ast1 [ ("z", 3) ] |> show

    "freevars:" |> show

    freevars ast1 |> show

    "closed:" |> show
    // 参数 ast , bound variable
    closedin ast1 [] |> show
    closedin ast1 [ "z" ] |> show
    closedin ast1 [ "x" ] |> show

    "indexed ast:" |> show
    tcomp ast1 [ "z" ] |> show

    "reforamt:" |> show
    fmt ast1 |> show

    "svm instructions:" |> show
    let ins1 = scomp ast1 [ (Bound "z") ]
    ins1 |> show
    "eval result:"
    seval ins1 [ 3 ] |> show

    "from file:" |> show
    let fname = "expr.in.txt"
    System.IO.File.ReadAllText(fname) |> show

    "ast:" |> show
    fromFile fname |> show


    [ (e1src, e1, s1, v1)
      (e2src, e2, s2, v2)  // 两个 Svar 1 从栈上取值是不同的
      (e3src, e3, s3, v3) ]
    |> List.map show

    0 // return an integer exit code
