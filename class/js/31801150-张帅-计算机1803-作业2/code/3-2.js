const countChar=(str,c)=>{
    let sum=0;
    let i=0;
    for(;i<str.length;i++){
        if(str[i]===c){
                sum++
        }
    }
    return sum
}

console.log(countChar("BBBBB212bbb",'b'));