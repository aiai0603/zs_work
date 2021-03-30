let max=0;
let number=[];
let his=[];
function findSolution() {
    function find(current, level, history) {
      if(current+5>100){
          if(level>max)
          {
            max=level;
            number=[];
            number.push(current);
            his=[]
            his.push(history);
          }else if(level===max){
               
            number.push(current);
            his.push(history);
        }
         
      }else{
        if(current*3>100){
            if(level>max)
            {
                max=level;
                number=[];
                number.push(current);
                his=[]
                his.push(history);
            }else if(level===max){
               
                number.push(current);
                his.push(history);
            }
           
        }else{
            find(current*3,level+1 ,"("+history+") * 3");
        }
        find(current+5,level+1, history+" + 5");

      }

    }
    find(1, 1,"1");
  }
  findSolution()
  for(let i=0;i<number.length;i++){
    console.log(number[i]+" by :"+his[i]);
  }
