var BiwaScheme = require("biwascheme"); 
console.log(BiwaScheme.run("( define plusOne ( lambda (a) (+ a 1 ) ) )")); 
console.log(BiwaScheme.run("( plusOne 10  )")); 



