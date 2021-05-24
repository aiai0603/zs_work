var http = require('http');

http.createServer(function(req,res){
var postData = '';
req.addListener("data", function (postDataChunk) {
if(req.method==='POST'){
postData += postDataChunk;
}
});
req.addListener("end", function(){
if(req.method==='POST'){
res.end(postData.toUpperCase(),'utf8');
}
});
}).listen(process.argv[2]);
http-json-api-server