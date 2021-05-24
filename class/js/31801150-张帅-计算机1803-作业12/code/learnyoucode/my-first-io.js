var fs = require('fs');
var res = fs.readFileSync(process.argv[2], 'utf-8');
console.log(res.split('\n').length-1);