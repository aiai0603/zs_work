# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/./lab/04/lab04.function.adv?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/./lab/04/lab04.function.adv?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:函数式编程
- 专业班级__计算机1803_
- 学生学号_31801150__
- 学生姓名_张帅__
- 实验指导教师:郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/./lab/04/lab04.function.adv?id=实验内容)

1. 阅读课本相关内容
2. 实现 `fibonacci` 数列 1 1 2 3 5 ....
   
   - 测试对比 采用/没有采用 `memorize`技术运行时间 `fibo(10) fibo(100),fibo(1000),fibo(10000)  50,500,5000,50000`次 所需要的时间.
   
     ![image-20210329210709175](\img\10.png)
   
     ![image-20210329210747754](\img\11.png)
   
     ```js
     var memoize = function(f) {
         var cache = {};
         return function() {
             //JSON是JS提供的一个工具对象 (Utility)
             var arg_str = JSON.stringify(arguments);
             cache[arg_str] = cache[arg_str] || f.apply(f, arguments);
             return cache[arg_str];
         };
     };
     
     function fibo(n){
         // your code
          // your code
         var res1 = 1;
         var res2 = 1;
         var sum = res2;
         for(var i = 1;i < n;i ++){
           sum = res1 + res2;
           res1 = res2;
           res2 = sum;
         }
         return sum;
     }
     
     function fibo(n){
         // your code
         var res1 = 1;
         var res2 = 1;
         var sum = res2;
         for(var i = 1;i < n;i ++){
           sum = res1 + res2;
           res1 = res2;
           res2 = sum;
         }
         return sum;
     }
     
     function testfibo(n,times){
         //your code
        console.time() 
        for(let i=0;i<times;i++)
        fibo(n)
        console.timeEnd() 
     }
     
     for(let i=10;i<=10000;i*=10)
         for(let j=50;j<=50000;j*=10)
             testfibo(i,j)
     ```
   
     

```js
var memoize = function(f) {
    var cache = {};
    return function() {
        //JSON是JS提供的一个工具对象 (Utility)
        var arg_str = JSON.stringify(arguments);
        cache[arg_str] = cache[arg_str] || f.apply(f, arguments);
        return cache[arg_str];
    };
};

function fibo(n){
    // your code
}

function testfibo(n,times){
    //your code
}
// Date.now()   可以返回当前毫秒数
// console.time()  console.timeLog() console.timeEnd() 显示、记录时间
```

1. 完成讲义 04 函数式编程-->柯里化函数`curry function` 最后面的练习

   - 在Node中使用ramda 库，在当前目录，`npm install ramda`

     ![image-20210329100919765](\img\1.png)

   - 浏览器里面使用`ramda`,请自行参考 [应用例子](http://sigcc.gitee.io/xplatform/#/04/044.function.demo)一节中, `requirejs`的写法.

     

```js
var R = require('ramda');


// 练习 1
//==============
// 通过部分应用（partial apply）移除所有参数

var words = function(str) {
  return R.split(' ', str);
};


var words2 = R.split(' ');


console.log(words2("21212 12121 2 12 12 1"))

// 练习 1a
//==============
// 使用 `map` 创建一个新的 `words` 函数，使之能够操作字符串数组

var sentences = undefined;
sentences = R.map(words)

console.log(sentences(["21211","1212 121 212","21"]))



// 练习 2
//==============
// 通过部分应用（partial apply）移除所有参数

var filterQs = function(xs) {
  return filter(function(x){ return match(/q/i, x);  }, xs);
};

var filterQs2=R.filter(R.match(/q/i));

console.log(  filterQs2(['quick', 'camels', 'quarry', 'over', 'quails']) );


// 练习 3
//==============
// 使用帮助函数 `_keepHighest` 重构 `max` 使之成为 curry 函数

// 无须改动:
var _keepHighest = function(x,y){ return x >= y ? x : y; };

// 重构这段代码:
var max = function(xs) {
  return reduce(function(acc, x){
    return _keepHighest(acc, x);
  }, -Infinity, xs);
};

max = R.reduce(_keepHighest,-Infinity)

console.log(max([3,2,4]))


// 彩蛋 1:
// ============
// 包裹数组的 `slice` 函数使之成为 curry 函数
// //[1,2,3].slice(0, 2)

var slice2 = R.curry(function(start, end, xs){ return xs.slice(start, end); });
console.log(   slice2(1,2, ['a', 'b', 'c']   ))

// 彩蛋 2:
// ============
// 借助 `slice` 定义一个 `take` curry 函数，该函数调用后可以取出字符串的前 n 个字符。
var take = R.curry(function(n,xs){
  return xs.slice(0,n);
});

console.log(   take(1, ['a', 'b', 'c']   ))
```

![image-20210329134329445](\img\3.png)

   3.完成讲义 04 函数式编程-->[函数组合](http://sigcc.gitee.io/xplatform/#/04/043.function.compose)最后面的练习 

```js
var _ = require('ramda');
var accounting = require('accounting');

// 示例数据
var CARS = [
    {name: "Ferrari FF", horsepower: 660, dollar_value: 700000, in_stock: true},
    {name: "Spyker C12 Zagato", horsepower: 650, dollar_value: 648000, in_stock: false},
    {name: "Jaguar XKR-S", horsepower: 550, dollar_value: 132000, in_stock: false},
    {name: "Audi R8", horsepower: 525, dollar_value: 114200, in_stock: false},
    {name: "Aston Martin One-77", horsepower: 750, dollar_value: 1850000, in_stock: true},
    {name: "Pagani Huayra", horsepower: 700, dollar_value: 1300000, in_stock: false}
  ];

// 练习 1:
// ============
// 使用 _.compose() 重写下面这个函数。提示：_.prop() 是 curry 函数
var isLastInStock = function(cars) {
  var last_car = _.last(cars);
  return _.prop('in_stock', last_car);
};

console.log(isLastInStock(CARS))
isLastInStock = _.compose(_.prop('in_stock'),_.last)

console.log(isLastInStock(CARS))

// 练习 2:
// ============
// 使用 _.compose()、_.prop() 和 _.head() 获取第一个 car 的 name
var nameOfFirstCar = _.compose( _.prop('name'), _.head);
console.log(nameOfFirstCar(CARS))


// 练习 3:
// ============
// 使用帮助函数 _average 重构 averageDollarValue 使之成为一个组合
var _average = function(xs) { return _.reduce(_.add, 0, xs) / xs.length; }; // <- 无须改动

var averageDollarValue = function(cars) {
  var dollar_values = _.map(function(c) { return c.dollar_value; }, cars);
  return _average(dollar_values);
};

averageDollarValue(  _average('dollar_value') , _.map )

console.log(averageDollarValue(CARS))

// 练习 4:
// ============
// 使用 compose 写一个 sanitizeNames() 函数，返回一个下划线连接的小写字符串：例如：sanitizeNames(["Hello World"]) //=> ["hello_world"]。

var _underscore = _.replace(/\W+/g, '_'); //<-- 无须改动，并在 sanitizeNames 中使用它

var sanitizeNames = _.compose(_underscore,_.toLower);

console.log(  sanitizeNames("Hello World") )


// 彩蛋 1:
// ============
// 使用 compose 重构 availablePrices

var availablePrices = function(cars) {
  var available_cars = _.filter(_.prop('in_stock'), cars);
  return available_cars.map(function(x){
    return accounting.formatMoney(x.dollar_value);
  }).join(', ');
};

var format=_.compose(accounting.formatMoney,_.prop('dollar_value'))
var availablePrices=_.compose( _.join(', '),_.map(format),_.filter(_.prop('in_stock')) )
console.log(availablePrices( CARS  ))

// 彩蛋 2:
// ============
// 重构使之成为 pointfree 函数。提示：可以使用 _.flip()

var fastestCar = function(cars) {
  var sorted = _.sortBy(function(car){ return car.horsepower }, cars);
  var fastest = _.last(sorted);
  return fastest.name + ' is the fastest';
};

var append = _.flip(_.concat);
var faseesrCar = _.compose(append(' is the fastest') ,_.prop('name'), _.last,_.sortBy(_.prop(' horsepower')) )
console.log(faseesrCar(CARS))

```

![image-20210329152530782](\img\4.png)


4. 完成讲义 04 函数式编程--> [应用例子](http://sigcc.gitee.io/xplatform/#/04/044.function.demo)中获取图片的的练习
   服务器请改为 baidu 163 等国内可以访问的地址

   ```js
   
     
   requirejs.config({
     paths: {
       ramda: 'https://cdnjs.cloudflare.com/ajax/libs/ramda/0.13.0/ramda.min',
       jquery: 'https://ajax.loli.net/ajax/libs/jquery/2.1.1/jquery.min'
     }
   });
   
     require([
       'ramda',
       'jquery'
     ],
       function (_, $) {
         ////////////////////////////////////////////
         // Utils
     
         var Impure = {
           getJSON: _.curry(function(callback, url) {
             $.getJSON(url, callback);
           }),
     
           setHtml: _.curry(function(sel, html) {
             $(sel).html(html);
           })
         };
     
         var img = function (url) {
           return $('<img />', { src: url });
         };
     
         var trace = _.curry(function(tag, x) {
           console.log(tag, x);
           return x;
         });
     
         ////////////////////////////////////////////
     
         var url = function (t) {
           return 'https://api.flickr.com/services/feeds/photos_public.gne?tags=' + t + '&format=json&jsoncallback=?';
         };
     
         var mediaUrl = _.compose(_.prop('m'), _.prop('media'));
     
         var srcs = _.compose(_.map(mediaUrl), _.prop('items'));
     
         var images = _.compose(_.map(img), srcs);
     
         var renderImages = _.compose(Impure.setHtml("body"), images);
     
         var app = _.compose(Impure.getJSON(renderImages), url);
     
         app("cats");
       });
   ```

   

   ![image-20210329102922199](\img\2.png)

5. 教材 p 71 页 [习题][ejs5] 1，2，3，4

   习题1：

   ```js
   var _ = require('ramda');
   let arrays = [[1, 2, 3], [4, 5], [6]];
   
   let func = function(x){
      
    
      return  _. reduce(  (prev,c) => 
      Array.isArray(c)? prev.concat( func(c) ):prev.concat(c)
       
     
     ,[], x );
   }
   
   
   console.log(func(arrays))
   ```

   ![image-20210329161640011](\img\5.png)

   习题2：

   ```js
   var _ = require('ramda');
   var loop = _.curry(function(start, bool, updated,todo ){  if( bool(start) ) {
     todo(start);
    
     loop( updated(start), bool, updated,todo)
   }else{
     return ;
   } });
   
   
   loop(3, n => n > 0, n => n - 1, console.log);
   ```

   

   ![image-20210329162438856](\img\6.png)

   习题3

   ```js
   var _ = require('ramda');
   function every(array, test) {
     
      if(_.reject( test,array).length===0)
         return true;
      else
         return false;
   }
   
   console.log(every([1, 3, 5], n => n < 10));
   // → true
   console.log(every([2, 4, 16], n => n < 10));
   // → false
   console.log(every([], n => n < 10));
   // → true
   ```

   ![image-20210329164353049](\img\7.png)

   习题3（使用some的版本）

   ```js
   var _ = require('ramda');
   function every(array, test) {
     
      let mytest=(n) => {
         if(test(n))
            return false;
         else
            return true;
      }
   
      if( array.some(mytest) )
         return false;
      else
         return true;
   
   }
   
   console.log(every([1, 3, 5], n => n < 10));
   // → true
   console.log(every([2, 4, 16], n => n < 10));
   // → false
   console.log(every([], n => n < 10));
   // → true
   
   ```

   

   ![image-20210329190838059](\img\8.png)

   习题4

   ```js
   
   function characterScript(code) {
      for (let script of SCRIPTS) {
        if (script.ranges.some(([from, to]) => {
          return code >= from && code < to;
        })) {
          return script;
        }
      }
      return null;
    }
    
   function countBy(items, groupName) {
      let counts = [];
      for (let item of items) {
        let direction = groupName(item);
        let known = counts.findIndex(c => c.direction == direction);
        if (known == -1) {
          counts.push({direction, count: 1});
        } else {
          counts[known].count++;
        }
      }
      return counts;
    }  
    
   
   function textScripts(text) {
      let scripts = countBy(text, char => {
        let script = characterScript(char.codePointAt(0));
        return script ? script.direction : "none";
      }).filter(({direction}) => direction != "none");
    
      let total = scripts.reduce((n, {count}) => n + count, 0);
      if (total == 0) return "No scripts found";
    
      return "语言方向是"+_.sortBy(_.prop("direction"),scripts)[0].direction;
    }
    
    console.log(textScripts('英国的狗说"woof", 俄罗斯的狗说"тяв"'));
   ```

   

   ![image-20210329195240815](\img\9.png)

   - `[[1,2],3,4] ---> [1,2,3,4]` 从高维数组降到 1 维数组
   - 要求 使用 `map reduce filter curry`等函数式编程的技巧，使用`ramda`等函数式编程库 
     - [Ramda Pipe Compose](http://sigcc.gitee.io/xplatform/#/15/thinking.ramda1)
     - [Ramda Curry](http://sigcc.gitee.io/xplatform/#/15/thinking.ramda2)
     - [Ramda Lens](http://sigcc.gitee.io/xplatform/#/15/thinking.ramda3)

6. 请写出 p 71 页 [习题][ejs5]  1，2，3，4 的函数的`Hindley-Milner` 类型签名    

   ```js
   //func::[Number] -> [Number]
   let func = function(x){
      
      //reduce::[Number] -> [Number] -> [Number]
      return  _. reduce(  (prev,c) => 
      Array.isArray(c)? prev.concat( func(c) ):prev.concat(c)
       
     
     ,[], x );
   }
   
   //loop:: undefined -> (Number -> undifined) -> (Number-> Boolean)-> Number
   var loop = _.curry(
   
     function(start, bool, updated, todo ){  
   
     if( bool(start) ) {
     todo(start);
   
     loop( updated(start), bool, updated,todo)
   
   }else{
     return ;
   } });
   
    // every::[String] -> (Number -> Boolean) -> Boolean
   function every(array, test) {
     
      // reject::[String] -> (Number -> Boolean) -> [String]
      if(_.reject( test,array).length===0)
         return true;
      else
         return false;
   
   }
   
   //String -> [Object] 
   function characterScript(code) {
      for (let script of SCRIPTS) {
        if (script.ranges.some(([from, to]) => {
          return code >= from && code < to;
        })) {
          return script;
        }
      }
      return null;
   }
    
   //[Object] -> (Object -> String) -> [Object]
   function countBy(items, groupName) {
      let counts = [];
      for (let item of items) {
        let direction = groupName(item);
        let known = counts.findIndex(c => c.direction == direction);
        if (known == -1) {
           counts.push({direction, count: 1});
        } else {
           counts[known].count++;
        }
      }
      return counts;
    }  
    
   //String -> String
   function textScripts(text) {
      // String -> ( (String ) ->  ( [Object] -> String ) -> [Object] )
      let scripts = countBy(text, char => {
        let script = characterScript(char.codePointAt(0));
        return script ? script.direction : "none";
      }).filter(({direction}) => direction != "none");
      
      let total = scripts.reduce((n, {count}) => n + count, 0);
      if (total == 0) return "No scripts found";
   
      return "语言方向是"+_.sortBy(_.prop("direction"),scripts)[0].direction;
   }
   ```

   

7. 扩展阅读 [函数式编程][most] 理解 `Maybe Ether Functor Monad`等概念
   自己学习使用 `npm install ramda-repl`


[most]: https://gitee.com/sigcc/mostly-adequate-guide-chinese
[ejs5]: http://sigcc.gitee.io/eloquent-js-3e-zh/#/5?id=%e4%b9%a0%e9%a2%98

