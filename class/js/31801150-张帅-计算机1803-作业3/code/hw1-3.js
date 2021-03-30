let arr=(start,end,step)=>{
    let re=[];
    if(step==undefined)
    step=1;

    if(step<0)
    {
        for(let i=start;i>=end;i+=step){
            re.push(i);
        }
    }else{
        for(let i=start;i<=end;i+=step){
            re.push(i);
        }
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


console.log(arr(5,2,-1))