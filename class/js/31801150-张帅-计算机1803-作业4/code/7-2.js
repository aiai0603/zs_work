var _ = require('ramda');
 // every::[String] -> (Number -> Boolean) -> Boolean
function every(array, test) {
  
    // mytest::Number  -> Boolean
   let mytest=(n) => {
      if(test(n))
         return false;
      else
         return true;
   }

   if( array.some(mytest) )
      return false;
   else
      return true;

}

console.log(every([1, 3, 5], n => n < 10));
// → true
console.log(every([2, 4, 16], n => n < 10));
// → false
console.log(every([], n => n < 10));
// → true







