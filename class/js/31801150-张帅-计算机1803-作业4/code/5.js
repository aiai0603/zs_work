var _ = require('ramda');
let arrays = [[1, 2, 3], [4, 5], [6]];

//func::[Number] -> [Number]
let func = function(x){
   
   //reduce::[Number] -> [Number] -> [Number]
   return  _. reduce(  (prev,c) => 
   Array.isArray(c)? prev.concat( func(c) ):prev.concat(c)
    
  
  ,[], x );
}

console.log(func(arrays))







