var BiwaScheme = require("biwascheme"); 
console.log(BiwaScheme.run("( define pow ( lambda (base exp) ( if (= exp 0) 1 (* base (pow base (- exp 1) )  )      ) ) )")); 
console.log(BiwaScheme.run("( pow 2 10  )")); 

/*
 run(`
do(define(pow, fun(base, exp,
     if(==(exp, 0),
        1,
        *(base, pow(base, -(exp, 1)))))),
   print(pow(2, 10)))
`);
*/

