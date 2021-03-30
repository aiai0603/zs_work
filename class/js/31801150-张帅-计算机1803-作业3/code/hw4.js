let deepEqual=(a,b)=>{
   
      if(a===null||b===null){
        return a===b;
      }
      
   
      if(typeof(a) !== typeof(b)){
        return false;
      }

    
     
      if(typeof(a) == "object"){
    
        let  propsA = Object.getOwnPropertyNames(a),
          propsB = Object.getOwnPropertyNames(b);
        if(propsA.length != propsB.length){
          return false;
        }
        for(var i=0;i<propsA.length;i++){
          var propName=propsA[i];
       
          if(a[propName] !== b[propName]){
            return false;
          }
        }
        return true;
      }else if(typeof(a) == "array"){
        return a.toString()==b.toString()
      }else{
          return a===b;
      }
   

}
let a={
    t1:12,
    t2:"1212"

}
let b={
    t1:12,
    t2:"1212"

}
let c={}
console.log(deepEqual(1,1))
console.log(deepEqual("12121212",12121212))
console.log(deepEqual(a,b))
console.log(deepEqual("null",null))
console.log(deepEqual([1,2,3],[1,2,3]))
console.log(deepEqual(null,c))


