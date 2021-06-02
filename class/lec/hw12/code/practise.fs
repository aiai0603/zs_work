 let rec prodc xs k =
     match xs with
     | []    ->  k 1
     | x::xr ->  prodc(xr)(fun v-> k(x*v))

let id x =  x;;
prodc [1;2;3;4;6] id