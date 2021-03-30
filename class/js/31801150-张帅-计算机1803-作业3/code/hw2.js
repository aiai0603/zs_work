let reverseArray=(a)=>{
    let re=[];
    for(let i=a.length-1;i>=0;i--){
   
        re.push(a[i]);
    }
    return re;
}



let reverseArrayInplace=(a)=>{
    
    for(let i=a.length-1;i>=a.length/2;i--){
        let temp=a[i];
        a[i]=a[a.length-i-1];
        a[a.length-1-i]=temp;
    }
    
}

let b=[1,2,3,4,5,6]
console.log(reverseArray(b))
let b2=[1,2,3,4,5,6]
reverseArrayInplace(b2)
//console.log(b2)