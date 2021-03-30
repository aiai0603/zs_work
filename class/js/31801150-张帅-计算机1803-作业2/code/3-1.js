const countBs=(str)=>{
    let sum=0;
    let i=0;
    for(;i<str.length;i++){
        if(str[i]==="B"){
                sum++
        }
    }
    return sum
}

console.log(countBs("BBBBB212bbb"));