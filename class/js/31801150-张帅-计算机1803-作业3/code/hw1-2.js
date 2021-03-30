let arr=(start,end)=>{
    let re=[];
    for(let i=start;i<=end;i++){
        re.push(i);
    }
    return re;
}

let sum=(arr)=>{
    let re=0;
    for(i=0;i<arr.length;i++){      
        re+=arr[i];
    }
    return re;
}

console.log(sum(arr(1,10)))