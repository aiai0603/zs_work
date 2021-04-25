// example.js
var invisible = function () {
    console.log("invisible");
  }
  
  // exports 对象将被返回，注意只给exports可附加属性，不应覆盖exports对象
  // 因为 exports 是 require函数的送给模块example.js的参数，是一个引用对象
  exports.message = "hi";
  
  exports.say = function () {
    console.log(message);
  }