//函数可以赋值给变量
let one = function(){
    return 1
}
let two = function(){
    return 2
}
let third = function(){
    return 3
}
//函数可以放置于数据结构中（数组）
let list=[one,two,third];
console.log(list[0]());

//函数可以作为参数传递给其他函数
let test = function(a){
    return a();
}
console.log(test(two))

//函数可以作为返回值
let test2 = function(){
    return third;
}
console.log((test2())())





