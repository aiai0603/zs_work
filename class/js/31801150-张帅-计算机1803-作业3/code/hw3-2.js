let listToArr=(list)=>{
    let a=[]
    let l=list
    while(l!=null){
        a.push(l.value)
        l=l.rest
    }
    return a;
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
console.log(listToArr(list))
