function findSolution(a) {
  function find(a,b) {
    if(a===4){
      return `${b} -> 2 -> 1`;
    }
    if(a%2===0)
    {
       return find(a/2,`${b} -> `+ (a/2) );
    }else{
       return find(a*3+1,`${b} -> `+(a*3+1) );
    }
  }
  return find(a, a);
}
console.log(findSolution(7));