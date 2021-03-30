let max=0;
let number=[];
let line=[];
function findSolution() {
    function find(a,b) {
      if(a===4){
        return b ;
      }
      if(a%2===0)
      {
         b.push(a/2)
         return find(a/2,b);
      }else{
         b.push(a*3+1)
         return find(a*3+1,b);
      }
    }
    for(let i=1;i<=100;i++){
      let re=[];
      re.push(i);
      let reb=find(i, re);
      if(reb.length>max){
          max=reb.length;
          number=[];
          line=[];
          number.push(i);
          line.push(reb);
      }else if(reb.length===max){
          number.push(i);
          line.push(reb);
      }
    } 
}

findSolution();
for(i=0;i<number.length;i++){
  let res=line[i][0];
  for(let j=1;j<line[i].length;j++){
    res+=" -> "+line[i][j]
  }
   console.log(number[i]+" "+res+" -> 2 -> 1")
}
  
