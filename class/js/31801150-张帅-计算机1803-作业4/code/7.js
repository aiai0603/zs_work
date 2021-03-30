var _ = require('ramda');
 // every::[String] -> (Number -> Boolean) -> Boolean
function every(array, test) {
  
   // reject::[String] -> (Number -> Boolean) -> [String]
   if(_.reject( test,array).length===0)
      return true;
   else
      return false;

}

console.log(every([1, 3, 5], n => n < 10));
// → true
console.log(every([2, 4, 16], n => n < 10));
// → false
console.log(every([], n => n < 10));
// → true







