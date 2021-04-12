function Cat(name, color) {
    let cat = {};
    cat.name = name;
    cat.color = color;
  
    cat.meow = function() {
      console.log(`the ${this.color} ${this.name} is meow ...`);
    };
  
    cat.sleep = function() {
      console.log(`the ${this.color} ${this.name} is sleep ...`);
    };
  
    return cat;
  }
function _new(/* constructor, param, ... */) {
    var args = [].slice.call(arguments);  //将参数转换为数组
    var constructor = args.shift();      //..
    var context = Object.create(constructor.prototype);
    var result = constructor.apply(context, args);
    return (typeof result === 'object' && result != null) ? result : context;
}

let cat = _new(Cat,'mao', 'white')
console.log(cat)
