let called = 0  
function chicken(a) {
     called++
     return egg();
 
 }
 function egg() {
     called++
     return chicken();
 }
 

function exitprog(){
    console.log("stack overflow:"+called) ; 
    process.exit(1);
}

process.on('uncaughtException', exitprog)
chicken([12,33,12,3232,12121,2323,12121])

