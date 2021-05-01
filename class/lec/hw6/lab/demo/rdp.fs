let exp = "ab#";;

let advance  x = 
    x+1;;

let rec A (exp:string) (x:int) = 
    match exp.[x] with
    | 'a' -> A( exp ,advance(x) )
    |  _  -> ()

let rec B exp x = 
    if exp.[x]=='b' then B exp (advance x) 
    else x;;
    
let rec C exp x = 
    if exp.[x]=='c' then C( exp advance(x) );;
    else x;;
    
let rec D exp x = 
    if exp.[x]=='d' then D( exp advance(x) );;
    else x;;

let S exp x=
    D( exp B(exp   A(exp x )));;

  
advance(-1);;
S(exp x);;
          
          


        
    




