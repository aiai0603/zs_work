let map = {one: true, two: true, hasOwnProperty: true,
    hasOwnProperty(word){
       
            for (let key in this) {
                 if(key === word)
                 return true
            }
            return false
        
    }
};
// Fix this call
console.log(map.hasOwnProperty("one"));
// → true