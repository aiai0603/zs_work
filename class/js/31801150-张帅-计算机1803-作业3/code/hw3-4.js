let index=0
let nth=(list,v)=>{
  if(list==null)
    return undefined;
  if(v!=list.value)
  {
      index++;
      return nth(list.rest,v)
  }else{
      return index
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
index=0
console.log(nth(list,200))

