var names = ["Sunday", "Monday", "Tuesday", "Wednesday",
             "Thursday", "Friday", "Saturday"];


//export 无需声明，直接使用，这就是模块的接口
//在前面的构造函数作为参数被声明 
exports.name = function(number) {
  return names[number];
};
exports.number = function(name) {
  return names.indexOf(name);
};