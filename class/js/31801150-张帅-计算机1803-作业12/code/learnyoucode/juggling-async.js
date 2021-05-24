var http = require('http');
var result = ['','',''];
var isEnd = [false, false, false];

   http.get(process.argv[2], function(res){
       res.setEncoding('utf8');
       res.on('data', function(data){
           result[0] += data;
       });
       res.on('end', function(data){
           isEnd[0] = true;
           if(isEnd[0]&&isEnd[1]&&isEnd[2]){
               console.log(result[0]);
               console.log(result[1]);
               console.log(result[2]);
           }
       });
   });
   http.get(process.argv[3], function(res){
       res.setEncoding('utf8');
       res.on('data', function(data){
           result[1] += data;
       });
       res.on('end', function(data){
           isEnd[1] = true;
           if(isEnd[0]&&isEnd[1]&&isEnd[2]){
               console.log(result[0]);
               console.log(result[1]);
               console.log(result[2]);
           }
       });
   });
   http.get(process.argv[4], function(res){
       res.setEncoding('utf8');
       res.on('data', function(data){
           result[2] += data;
       });
       res.on('end', function(data){
           isEnd[2] = true;
           if(isEnd[0]&&isEnd[1]&&isEnd[2]){
               console.log(result[0]);
               console.log(result[1]);
               console.log(result[2]);
           }
       });
   });