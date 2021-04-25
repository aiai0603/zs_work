# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/./lab/07/lab07.module?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/./lab/07/lab07.module?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:模块
- 专业班级__计算机1803_
- 学生学号_31801150__
- 学生姓名__张帅_
- 实验指导教师:郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/./lab/07/lab07.module?id=实验内容)

1. 阅读课本相关内容 回答理解以下问题

   - 10.1 模块的好处在哪里

     与将文章划分为段落，章节类似。

     - 可以通过模块，得到组织良好的代码结构，可以清晰发现代码的逻辑结构
     - 通过模块，方便关注特定功能的代码内容

   - 10.2 为什么 JavaScript中函数可以作为名称空间

      JS采用对象机制提供公有public名称空间，如Math，JSON等对象；采用立即执行函数表达式（IIFE）提供私有private名称空间

   - 10.3 如何使用对象作为接口

     - 采用`对象`作为模块之间的接口 p137

     ```js
     var weekDay = function() {
       var names = ["Sunday", "Monday", "Tuesday", "Wednesday",
                    "Thursday", "Friday", "Saturday"];
     // return 返回的是对象
       return {
         name: function(number) { return names[number]; },
         number: function(name) { return names.indexOf(name); }
       };
     }();
     
     //使用 weekDay 模块
     console.log(weekDay.name(weekDay.number("Sunday")));
     // → Sunday
     ```

     如上：定义一个对象，使用对象.函数或者对象.属性获取其中的内容

   - 10.4 解释代码 `new Function("a,b"," console.log(arguments); return arguments[0];")`

     定义了一个函数，参数名称为为a,b，执行方法是打印参数数组，并且返回第一个参数

   - 10.6 参考书上实现 `require()`，在`node`中加载模块`weekDay`。

     ![image-20210425140500548](.\img\1.png)

   - (选) 参考课件 [requirejs](https://sigcc.gitee.io/xplatform/#/07/07.requirejs),在浏览器中加载模块`weekDay`。

     

2. 阅读 [nodejs中 require 方法的加载规则](http://sigcc.gitee.io/xplatform/#/07/07.require.order?id=nodejs中-require-方法的加载规则)理解模块的4种类型，说明下面分别是那种

   - `var fs = require('fs')`

     引入原生模块

   - `var R = require('ramda')`

     引入第三方模块

   - `var test = require('/test.js')`

     引入绝对路径的文件模块

   - `var mod = require('../mod')`

     引入相对路径的文件模块

   - `require.resolve()` 可以查看解析模块的路径

   ```js
   //在app.js中输入如下内容：
   //app.js
   
   console.log(module.paths);
   
   // require函数包装之后的app.js将会封装为以下形式:
   // 参数由Node系统提供 在 app.js可以直接使用
   
   (function (exports, require, module, __filename, __dirname) {
       console.log(module.paths);
   });
   ```

![image-20210425141659543](.\img\2.png)

1. 学习[require命令](http://sigcc.gitee.io/xplatform/#/07/07.require?id=require命令) `require` 的本质

   - 文件作为模块，输入如下代码

     ![image-20210425143633260](.\img\3.png)

   - 修改`example.js` 输出 该模块 module.paths 的值

     ![image-20210425143742685](.\img\4.png)

   - 在`example.js`中 用 require 导入 `figlet` 模块，查看 module.children 的值

     ![image-20210425144711561](.\img\5.png)

```js
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
```

- 查看当前`REPL`中 `module module.id module.path module.children`

  ![image-20210425144936014](.\img\6.png)

  ![image-20210425145038953](.\img\7.png)

- 理解 require 前后 module.children module.

  引入example之后，example模块成为了当前module的children

```js
//node REPL 
var example = require('./example.js');
example
```

1. 理解 es6 module 与 es5 module 的关系

   - 查看

     ```
     es5.js  es6.mjs
     ```

     ![image-20210425151844893](.\img\9.png)

     ![image-20210425151903828](.\img\10.png)

     学习

     ```
     es5  es6
     ```

     模块的写法

     - 注意 es6 后缀 `mjs`

       es5:使用require导入模块，定义的模块中的内容使用exports.名称属性导出

       es6:使用import导出函数 在定于语句前加上export表示导出的模块内容

   - 查看 mod_es5.js mod_es6.mjs

     - 理解 require 函数 与 import export 关键字的联系

       es5中，使用require函数引入模块，模块中定义的exports内容将暴露，通过require函数返回。

       es6中，使用export 命令用于规定模块的对外接口，import命令用于输人其他模块提供的功能。

     - 在 VS Code 中查看

       - es5 模块 module module.exports module.children的值

         ![image-20210425153247491](.\img\11.png)

       - es6 模块中 有这些值吗？ 思考一下为什么？

         没有，es6中，使用export 命令用于规定模块的对外接口，import命令用于输人其他模块提供的功能。一个模块就是一个独立的文件。该文件内部的所有变量，外部无法获取。如果希望外部能够读取模块内部的某个变量，就必须使用export关键字输出该变量。es5的模块是一个对象，而es6的模块不再是一个对象了，因而没有这些值。ES6 模块输出的是值的引用，输出接口动态绑定，ES6 模块编译时执行

2. 思考 程序设计语言的演变过程

   - 外置的require 函数（第三方库） 是如何 成为语言内置的功能 （关键字）

     ​		es6中，使用export 命令用于规定模块的对外接口，import命令用于输人其他模块提供的功能。

   - 这种现象在 Javascript很常见

     - 原型继承 Function.prototype属性 ==> class 关键字
     - 异步编程 async co 第三方库 ，promise 语言库 ==> async await 语言关键字

3. 自学阅读[模块设计原则](https://sigcc.gitee.io/xplatform/#/07/07.package.principle)

   - 理解内聚性原则与耦合性原则

     随着应用程序规模和复杂度的增加，我们需要更高层次的包和组件来对其之间的依赖关系进行组织管理。

     首先明确一下本文中谈到的包或组件的概念，因为通常软件开发中关于包这个术语都有各自的说法，所以在本文中需要明确说明，在此定义为一种能够被独立部署的二进制单元。包通常是动态链接库DLL，也可以是子系统、库或组件。

     包的**内聚性原则**是开发者决定如何把类划分到不同包中的指导，它是一种“自底向上”的思想。

     内聚性不单单是指一个模块执行一项且仅单独一项功能，它还需要考虑到可重用性（reusability）和可开发性（developability），及其之间的相互作用力和需求之间的平衡关系。

     包的**耦合性**反映不同包之间的依赖关系。其受影响的因素有很多，如可开发性、逻辑设计、技术路线和行政力量等。我们可以通过依赖性管理度量去测试和判断一个设计的依赖性与抽象结构模式间的匹配程度。

4. 完成[模块](http://sigcc.gitee.io/eloquent-js-3e-zh/#/10?id=十、模块)p145 1 2 3 题

   习题1：

   构建路线图的代码放在graph模块中，导出函数buildGraph。

   路线图数据放在road模块中，包含roads数组，它依赖于graph模块，导出路线图。

   state模块包含VillageState类和randomPick函数，依赖于road模块，导出VillageState类和runRobot函数。

   其他相关的函数放置在robots模块中，它包含mailRoute routeRobot findRoute goalOrientedRobot，依赖于road模块并导出函数。

   dijksreajs等模块可以在NPM中找到。

   我会选择NPM，因为NPM编写的模块更加高效，自己编写容易出现问题

   

   习题2：

   ```js
   const {buildGraph} = require("./graph");
   
   const roads = [
     "Alice's House-Bob's House",   "Alice's House-Cabin",
     "Alice's House-Post Office",   "Bob's House-Town Hall",
     "Daria's House-Ernie's House", "Daria's House-Town Hall",
     "Ernie's House-Grete's House", "Grete's House-Farm",
     "Grete's House-Shop",          "Marketplace-Farm",
     "Marketplace-Post Office",     "Marketplace-Shop",
     "Marketplace-Town Hall",       "Shop-Town Hall"
   ];
   
   exports.roadGraph = buildGraph(roads.map(r => r.split("-")));
   ```

   

   习题3：

   在开始加载模块之前用require函数将模块添加到缓存中，如果在程序运行时做出任何require尝试调用加载某一个模块，此模块是已知的，并且返回当前接口，而不是再次加载模块。

   如果模块覆盖其modules.exports值，则在完成加载之前已接受其接口值的然后其他模块将保持默认接口对象，而不是预期的接口值

5. npm 使用 npm 建立一个 js 模块 并 导入使用

   - https://my.oschina.net/dkvirus/blog/1068813

     ![image-20210425151154099](.\img\8.png)

6. 扩展阅读 John Conway’s Game of Life

   - [John Conway’s Game of Life](https://bitstorm.org/gameoflife/)
   - [uc.ch7.通用性无处不在.pdf](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/books/Understanding.Computation/uc.ch7.通用性无处不在.pdf)