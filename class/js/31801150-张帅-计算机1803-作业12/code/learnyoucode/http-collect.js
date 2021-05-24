var http = require('http');

 http.get(process.argv[2], function(res){
 var result = '';
 res.setEncoding('utf8');
 res.on('data', function(data){
 result += data;
 });
 res.on('end', function(data){
 console.log(result.length);
 console.log(result);
 });
});
juggling-asyn