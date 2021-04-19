# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/./lab/06/lab06.error.debug.regexp?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/./lab/06/lab06.error.debug.regexp?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:错误正则表达式
- 专业班级___计算机1803
- 学生学号___31801150
- 学生姓名___张帅
- 实验指导教师:郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/./lab/06/lab06.error.debug.regexp?id=实验内容)

1. 阅读课本[第8章](http://sigcc.gitee.io/eloquent-js-3e-zh/#/8) 回答理解以下问题

   - 8.2 如何声明严格模式

     当启用了严格模式（strict mode）后，JavaScript 就会在执行代码时变得更为严格。我们只需在文件或函数体顶部放置字符串"use strict"就可以启用严格模式了。

   - 8.4 调试代码的方法有哪几种

     1.有目的地在程序中使用console.log来查看程序当前的运行状态，是一种不错的获取额外信息的方法。

     2.使用console.log来查看程序行为的替代方法，是使用浏览器的调试器（debugger）功能。 浏览器可以在代码的特定行上设置断点（breakpoint）。 当程序执行到带有断点的行时，它会暂停，并且你可以检查该点的绑定值。

     3.设置断点的另一种方法，是在程序中包含一个debugger语句（仅由该关键字组成）。 如果你的浏览器的开发人员工具是激活的，则只要程序达到这个语句，程序就会暂停。

     

   - 8.6 try catch throw 的作用

     `throw`关键字用于引发异常。 异常的捕获通过将一段代码包装在一个`try`块中，后跟关键字`catch`来完成。 当`try`块中的代码引发异常时，将求值`catch`块，并将括号中的名称绑定到异常值。 在`catch`块结束之后，或者`try`块结束并且没有问题时，程序在整个`try / catch`语句的下面继续执行。

     

     

   - 8.6 new Error() 构造函数 创建的错误对象有哪几个属性

     使用`Error`构造器来创建异常值。这是一个标准的 JavaScript 构造器，用于创建一个对象，包含`message`属性。在多数 JavaScript 环境中，构造器实例也会收集异常创建时的调用栈信息，即堆栈跟踪信息（Stack Trace）。该信息存储在`stack`属性中，对于调用问题有很大的帮助，我们可以从堆栈跟踪信息中得知问题发生的精确位置，即问题具体出现在哪个函数中，以及执行失败为止调用的其他函数链。

     

   - 说明何时会产生**SyntaxError**,**ReferenceError**, **RangeError**,**TypeError**

     **SyntaxError**：解析代码时发生错误，语法错误

     **ReferenceError**：ReferenceError是引用一个不存在的变量时发生的错误，是一种语义错误。另一种触发场景是，将一个值分配给无法分配的对象，比如对函数的运行结果或者this赋值。

     **RangeError**：RangeError是当一个值超出有效范围时发生的错误。主要有几种情况，一是数组长度为负数，二是Number对象的方法参数超出范围，以及函数堆栈超过最大值。

     **TypeError**：TypeError是变量或参数不是预期类型时发生的错误。比如，对字符串、布尔值、数值等原始类型的值使用new命令，就会抛出这种错误，因为new命令的参数应该是一个构造函数。

     

2. 阅读[正则表达式原理](http://sigcc.gitee.io/xplatform/#/06/063.regexp?id=原理)，请思考下面的问题

   - 基本规则，复合规则 如何理解

     原子规则：任意 单个字符 都是正则表达式 匹配单个字符 /a/ --> a /b/ -->b

     复合规则：可以用 顺序 ab, 分支 a|b, 循环 (ab)* , a* 对原子加以复合 得到复合的表达式。 ()表示作用范围

   - 与编程语言的对应关系如何理解

     正则表达式与编程语言的基本构造相同，这其实是计算的本质所决定的。

     

3. 阅读课本[第9章](http://sigcc.gitee.io/eloquent-js-3e-zh/#/9) 正则表达式

   - 字面量的写法与构造函数写法的不同

     我们可以使用两种方法来构造正则表达式：

     一是使用`RegExp`构造器构造一个正则表达式对象；

     二是使用斜杠（`/`）字符将模式包围起来，生成一个字面值。

     使用`RegExp`构造器时，需要将模式书写成普通的字符串，因此反斜杠的使用规则与往常相同。第二种写法将模式写在斜杠之间，处理反斜杠的方式与第一种方法略有差别。首先，由于斜杠会结束整个模式，因此模式中包含斜杠时，需在斜杠前加上反斜杠。此外，如果反斜杠不是特殊字符代码（比如`\n`）的一部分，则会保留反斜杠，不像字符串中会将其忽略，也不会改变模式的含义。一些字符，比如问号、加号在正则表达式中有特殊含义，如果你想要表示其字符本身，需要在字符前加上反斜杠。

     

   - 9.5，9.6 请说明 [匹配和分组](http://sigcc.gitee.io/eloquent-js-3e-zh/#/9?id=匹配和分组)的用法 ，用分组在 `Wed Apr 06 2016 09:21:39 GMT+0900` 匹配出年月日

     1.test方法是匹配正则表达式最简单的方法。该方法只负责判断字符串是否与某个模式匹配。

     2.正则表达式还有一个exec（执行，execute）方法，如果无法匹配模式则返回null，否则返回一个表示匹配字符串信息的对象。exec方法返回的对象包含index属性，表示字符串成功匹配的起始位置。除此之外，该对象看起来像（而且实际上就是）一个字符串数组，其首元素是与模式匹配的字符串。

     3.若正则表达式包含使用圆括号包围的子表达式分组，与这些分组匹配的文本也会出现在数组中。第一个元素是与整个模式匹配的字符串，其后是与第一个分组匹配的部分字符串（表达式中第一次出现左圆括号的那部分），然后是第二个分组。

     4.若分组最后没有匹配任何字符串（例如在元组后加上一个问号），结果数组中与该分组对应的元素将是`undefined`。类似的，若分组匹配了多个元素，则数组中只包含最后一个匹配项。
     
     ```js
       console.log(/(\w{3})\s(\d{1,2})\s(\d{4})/.exec("Wed Apr 06 2016 09:21:39 GMT+0900"));
     ```
     
        ![image-20210419142849156](.\img\1.png)
- 9.7 如何获得当前的 “Unix时间”
  
  JavaScript 提供了用于表示日期的标准类，我们甚至可以用其表示时间点。该类型名为`Date`。如果使用`new`创建一个`Date`对象，你会得到当前的日期和时间。
  
  ```JS
  console.log(new Date());
  ```
  
  ![image-20210419143155594](.\img\2.png)
  
- 9.8 请解释 “单词边界”的含义
  
  所谓单词边界，指的是起始和结束位置都是单词字符（也就是`\w`代表的字符集合），而起始位置的前一个字符以及结束位置的后一个字符不是单词字符。
  
  
  
  
  
  
  
- 9.13 请举例说明 `贪婪模式` 与 `非贪婪模式`的区别
  
  模式重复运算符（+、*、?和{}）是“贪婪”的，指的是这些运算符会尽量多地匹配它们可以匹配的字符，然后回溯。
  
  使用贪婪模式会匹配尽量多的字符，所有abbbbbb均被匹配了,而使用非贪婪模式时，第一次满足时即匹配，即第一个a出现时即成功匹配，所以仅有第一个a被替换了。
  
  ```js
  console.log("abbbbb?1231".replace(/\w+/, "test"));
  console.log("abbbbb?1231".replace(/\w+?/, "test"));
  ```
  
  ![image-20210419144346666](.\img\3.png)



- 9.12 请说明 "THIS is a word".replace(/^(\w+)\s((\s?\w+)+?)/,"$2 $1")的结果，如果 去掉最后的`?` 结果是什么？说明原因。

  结果：is THIS a word

  去掉？后：is a word THIS

  原因:第一次匹配时，没有使用贪婪模式，所以第一次完成匹配时即视为完成匹配，使用将第一个（）包围的内容即THIS和第二个（）包围匹配的内容is进行交换。

  去掉？时，使用贪婪模式，第二个（）匹配的表达式会尽量多地匹配它们可以匹配的字符，使用匹配为 is a word ，两者交换得到后者的结果。

  ![image-20210419144538211](.\img\4.png)

- 9.14 lastIndex属性起什么作用，请问 Regexp#exec() 方法有副作用吗？是否是纯函数？

  1.lastIndex是可以在当正则表达式启用了全局（`g`）或者粘性（`y`），并且使用`exec`匹配模式的时候控制下一次匹配的起始位置。

  如果成功匹配模式，`exec`调用会自动更新`lastIndex`属性，来指向匹配字符串后的位置。如果无法匹配，会将`lastIndex`清零（就像新构建的正则表达式对象`lastIndex`属性为零一样）。

  全局和粘性选项之间的区别在于，启用粘性时，仅当匹配直接从`lastIndex`开始时，搜索才会成功，而全局搜索中，它会搜索匹配可能起始的所有位置。

  2.有副作用它会把 RegExpObject 的 lastIndex 等属性进行改变，不是纯函数。

  

- 9.16 全局选项，请说明 `/y/g` 中`g` 的含义

  正则表达式拥有选项，这些选项写在闭合斜线后面。 `i`选项使匹配不区分大小写。 `g`选项使表达式成为全局的，除此之外，它使`replace`方法替换所有实例，而不是第一个。 `y`选项使它变为粘性，这意味着它在搜索匹配时不会向前搜索并跳过部分字符串。



- 请自己学习理解 9.19 的正则表达式，用例子测试下。
  
  ```js
  console.log(/abc/.test("abc"))
  console.log(/[abc]/.test("a"))
  console.log(/[^abc]/.test("e"))
  console.log(/[0-9]/.test("9"))
  console.log(/[0-9]+/.test("999"))
  console.log(/[0-9]+?/.test("999"))
  console.log(/[0-9]??/.test(""))
  console.log(/[0-9]*/.test(""))
  console.log(/9{2,4}/.test("999"))
  console.log(/(abc)/.test("abc"))
  console.log(/a|b|c/.test("a"))
  console.log(/\d/.test("2"))
  console.log(/\w/.test("a"))
  console.log(/\s/.test(" "))
  console.log(/./.test("&"))
  console.log(/\b/.test("word"))
  console.log(/^\w/.test("w1212"))
  console.log(/\d$/.test("w12121"))
  ```
  
  ![image-20210419153030401](.\img\5.png)

4. 正则表达式，对于同一个问题可以有多种写法

   - [回溯](http://sigcc.gitee.io/eloquent-js-3e-zh/#/9?id=回溯)是正则表达式需要注意的问题

     “回溯”：进入一个分支时，匹配器会记住当前位置，因此若当前分支无法匹配，可以回退并尝试另一条分支。

     

   - 请给出二进制数字的正则表达式的其他写法

     ```js
     console.log(/(0|1)*b/.test("0010001001b"));
     ```

     ![image-20210419153626724](.\img\6.png)

   - 思考回溯与编程中循环的联系

     ​		匹配器首先会不断执行内部循环，直到它发现没有数字为止。因此向前回溯一个位置，开始执行外部循环，接着再次放弃，再次尝试执行一次内部循环。该过程会尝试这两个循环的所有可能路径。

     

5. 理解先行断言

   - [先行断言](http://sigcc.gitee.io/xplatform/#/06/063.regexp?id=（3）先行断言)

     x(?=y)称为先行断言（Positive look-ahead），x只有在y前面才匹配，y不会被计入返回结果。比如，要匹配后面跟着百分号的数字，可以写成/\d+(?=%)/。“先行断言”中，括号里的部分是不会返回的。

     

6. 完成第8章 p115 练习 2 题

   习题1：

   ```js
   class MultiplicatorUnitFailure extends Error {}
   
   function primitiveMultiply(a, b) {
     if (Math.random() < 0.2) {
       return a * b;
     } else {
       throw new MultiplicatorUnitFailure();
     }
   }
   
   function reliableMultiply(a, b) {
     try{
       return primitiveMultiply(a,b);
     }catch(e){
       if (e instanceof  MultiplicatorUnitFailure) {
           return reliableMultiply(a,b);
       }
     }
   
   }
   
   console.log(reliableMultiply(8, 8));
   
   ```

   ![image-20210419155138192](.\img\7.png)

   习题2：

   ```js
   
     const box = {
       locked: true,
       unlock() { this.locked = false; },
       lock() { this.locked = true;  },
       _content: [],
       get content() {
         if (this.locked) throw new Error("Locked!");
         return this._content;
       }
     };
     
     function withBoxUnlocked(body) {
       try{
           body()
       }catch(e){
           console.log(e)
       }finally{
           box.lock()
       }
     }
     
     withBoxUnlocked(function() {
       box.content.push("gold piece");
     });
     
     try {
     withBoxUnlocked(function() {
         throw new Error("Pirates on the horizon! Abort!");
       });
     } catch (e) {
       console.log("Error raised:", e);
     }
   
     console.log(box.locked);
     // → true
   
   ```

   ![image-20210419160336904](.\img\8.png)

7. 完成第9章 p133 练习1 2 3 题

   习题1：

   ```js
   // Fill in the regular expressions
   
   verify(/ca[rt]/,
     ["my car", "bad cats"],
     ["camper", "high art"]);
   
   verify(/p(r)?op/,
     ["pop culture", "mad props"],
     ["plop", "prrrop"]);
   
   verify(/ferr(et|y|ari)/,
     ["ferret", "ferry", "ferrari"],
     ["ferrum", "transfer A"]);
   
   verify(/(ious)\b/,
     ["how delicious", "spacious room"],
     ["ruinous", "consciousness"]);
   
   verify(/\s[,:.]/,
     ["bad punctuation ."],
     ["escape the period"]);
   
   verify(/\w{7}/,
     ["hottentottententen"],
     ["no", "hotten totten tenten"]);
   
   verify(/\b(?![\w]*e)[\w]+\b/i,
     ["red platypus", "wobbling nest"],
     ["earth bed", "learning ape", "BEET"]);
   
   
   function verify(regexp, yes, no) {
   // Ignore unfinished exercises
   if (regexp.source == "...") return;
   for (let str of yes) if (!regexp.test(str)) {
   console.log(`Failure to match '${str}'`);
   }
   for (let str of no) if (regexp.test(str)) {
   console.log(`Unexpected match for '${str}'`);
   }
   }
   ```

   ![image-20210419164137360](.\img\9.png)

   习题2：

   ```js
   let text = "'I'm the cook,' he said, 'it's my job.'";
   // Change this call.
   
   
   console.log(text.replace(/((?<=[^\w])\')|^\'/g,"\""))
   // → "I'm the cook," he said, "it's my job."
   ```

   ![image-20210419202849988](.\img\11.png)

   习题3:

   ![image-20210419200728011](.\img\10.png)

   ```js
   // Fill in this regular expression.
   //let number = /^(\+|\-)?[\d]+((\.[\d]+|(e[\d]+))?(e(\+|\-)?[\d]+)?)$/i;
   
   
   let number = /^((\+|\-)?([\d]+)?((\.[\d]+|(e[\d]+))?(e(\+|\-)?[\d]+)?)|([\d]+\.))$/i;
   // Tests:
   for (let str of ["1", "-1", "+15", "1.55", ".5", "5.",
                    "1.3e2", "1E-4", "1e+12"]) {
     if (!number.test(str)) {
       console.log(`Failed to match '${str}'`);
     }
   }
   for (let str of ["1a", "+-1", "1.2.3", "1+1", "1e4.5",
                    ".5.", "1f5", "."]) {
     if (number.test(str)) {
       console.log(`Incorrectly accepted '${str}'`);
     }
   }
   ```

   

   