
var memoize = function(f) {
    var cache = {};
    return function() {
        //JSON是JS提供的一个工具对象 (Utility)
        var arg_str = JSON.stringify(arguments);
        cache[arg_str] = cache[arg_str] || f.apply(f, arguments);
        return cache[arg_str];
    };
};


function fibo(n){
    // your code
     // your code
    var res1 = 1;
    var res2 = 1;
    var sum = res2;
    for(var i = 1;i < n;i ++){
      sum = res1 + res2;
      res1 = res2;
      res2 = sum;
    }
    return sum;
}

function fibo(n){
    // your code
    var res1 = 1;
    var res2 = 1;
    var sum = res2;
    for(var i = 1;i < n;i ++){
      sum = res1 + res2;
      res1 = res2;
      res2 = sum;
    }
    return sum;
}





function testfibo(n,times){
    //your code
 
   console.time() 
   for(let i=0;i<times;i++)
    fibo(n)
   console.timeEnd() 


}






for(let i=10;i<=10000;i*=10)
    for(let j=50;j<=50000;j*=10)
        testfibo(i,j)


