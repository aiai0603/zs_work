 

//work.js
// self 是当前worker的global对象

//监听 父线程的消息

self.addEventListener('message', function(e) {
  self.postMessage('You said: ' + e.data);
}, false)

self.onmessage = function(event) {
  var method = event.data.method;
  var args = event.data.args;
  
function fib(args){
  if(args == 1){
    return 1;
  }else if(args == 2){
    return 1;
  }else if(args <= 0){
    return 0;
  }else{
    return fib(args-1)+fib(args-2);
  }
}

var reply = fib(args);

self.postMessage({method: method, reply: reply});
}