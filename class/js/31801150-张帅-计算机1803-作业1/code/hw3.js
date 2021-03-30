let size=8;
for(i=0;i<size;i++){
    let str=""
    for(let j=0;j<size;j++){
      
        if(i%2==0){
            if(j%2==0)
                str+=" ";
            else
                str+="#";
        }else{
            if(j%2==1)
                str+=" ";
            else
                str+="#";
        }
       
    }
    console.log(str)
}