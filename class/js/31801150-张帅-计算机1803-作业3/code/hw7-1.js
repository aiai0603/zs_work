
var os=require('os');
var freemem=os.freemem()
var tmpdir=os.tmpdir()
var totalmem=os.totalmem()


const fs = require("fs");


fs.writeFile("./test1.txt", "空闲内存字节"+freemem+"    CPU路径"+tmpdir+"   总内存"+totalmem, error => {
  if (error) return console.log("写入文件失败,原因是" + error.message);
  console.log("写入成功");
});




