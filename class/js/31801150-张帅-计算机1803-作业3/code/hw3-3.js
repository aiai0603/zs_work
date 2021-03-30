let prepend=(list,v)=>{
  
   return re={
       value:v,
       rest:list
   }
   
}
let list={
    value:1,
    rest:{
        value:2,
        rest:{
            value:3,
            rest:null
        }
    }
}
list = prepend(list,4)
console.log(list)
