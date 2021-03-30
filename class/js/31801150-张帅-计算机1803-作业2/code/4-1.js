let called = 0  
function chicken() {
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
chicken()

