let arrToList=(a)=>{
    let list=null;
    let nowlist=null;
    for(let i=0;i<a.length;i++){
        if(i===0){
            list={
                value:a[i],
                rest:null
            }
            nowlist=list
        }else{
            nowlist.rest={
                value:a[i],
                rest:null
            }
            nowlist=nowlist.rest
        }

    }
    return list;
}


let re=arrToList([1,2,3,4])

