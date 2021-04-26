# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/lab/08/lab08.egg.language?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/lab/08/lab08.egg.language?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:项目实战-Egg语言解释器
- 专业班级_计算机1803__
- 学生学号__31801150_
- 学生姓名_张帅__
- 实验指导教师:郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/lab/08/lab08.egg.language?id=实验内容)

1. 阅读课本

   十二、项目：编程语言

   相关内容 回答理解以下问题

   - 画出p154页代码的 语法树AST图

     ![image-20210426155153044](.\img\12.png)

   - 11.2 请说明 apply 的求值过程

     求值器为每一种表达式类型都提供了相应的处理逻辑。字面值表达式产生自身的值（例如，表达式`100`的求值为数值`100`）。对于绑定而言，我们必须检查程序中是否实际定义了该绑定，如果已经定义，则获取绑定的值。

     应用则更为复杂。若应用有特殊形式（比如`if`），我们不会求解任何表达式，而是将表达式参数和环境传递给处理这种形式的函数。如果是普通调用，我们求解运算符，验证其是否是函数，并使用求值后的参数调用函数。

     我们使用一般的 JavaScript 函数来表示 Egg 的函数。在定义特殊格式`fun`时，我们再回过头来看这个问题。

     `evaluate`的递归结构类似于解析器的结构。两者都反映了语言自身的结构。我们也可以将解析器和求值器集成到一起，在解析的同时求解表达式，但将其分离为两个阶段使得程序更易于理解。

2. 在浏览器打开代码中 index.html

   ![image-20210426135754216](.\img\2.png)

   

   - 查看教材 p155 的egg 代码 使用 parse, parseExpression,parseApply函数 运行 返回的结果

     ![image-20210426140021940](.\img\3.png)

     ![image-20210426140709319](.\img\5.png)

   - 自己写一段 egg 代码,看看parse函数返回的 抽象语法树对象

     ![image-20210426140255730](.\img\4.png)

   - 提示:用 JSON.stringify(ast_obj) 将抽象语法树对象ast_obj转换为字符串

     ![image-20210426141058339](.\img\6.png)

3. 完成[习题](http://sigcc.gitee.io/eloquent-js-3e-zh/#/12?id=习题) p157 11.8 1 2 3 4 题

   习题1：

   ![image-20210426143412081](.\img\7.png)

   ```js
   topScope.array =(...values)=>values;
   
   topScope.length =array=>array.length;
   
   topScope.element =(array, i)=>array[i];
   
   run(`
   do(define(sum, fun(array,
        do(define(i, 0),
           define(sum, 0),
           while(<(i, length(array)),
             do(define(sum, +(sum, element(array, i))),
                define(i, +(i, 1)))),
           sum))),
      print(sum(array(1, 2, 3))))
   `);
   // → 6
   ```

   习题2：

   ```js
   特殊形式被传给他计算他们的局部作用域以便他们可以在此作用域内评估他们的子形式。fun返回的函数可以访问为其封闭函数的赋予的scope参数，并在调用函数时使用它来创建作用域。这意味着局部作用域的原型将是创建函数的作用域，这使得可以从函数访问此作用域中的绑定。
   ```

   习题3：

   ```js
   function parseExpression(program) {
       program = skipSpace(program);
       let match, expr;
       if (match = /^"([^"]*)"/.exec(program)) {
         expr = {type: "value", value: match[1]};
       } else if (match = /^\d+\b/.exec(program)) {
         expr = {type: "value", value: Number(match[0])};
       } else if (match = /^[^\s(),#"]+/.exec(program)) {
         expr = {type: "word", name: match[0]};
       } else {
         throw new SyntaxError("Unexpected syntax: " + program);
       }
     
       return parseApply(expr, program.slice(match[0].length));
     }
     /*
     function skipSpace(string) {
       let first = string.search(/\S/);
       if (first == -1) return "";
       return string.slice(first);
     }
     */
   
     function skipSpace(string) {
       let s = string.match(/^(\s|#.*)*/);
       return string.slice(s[0].length);
     }
     
     function parseApply(expr, program) {
       program = skipSpace(program);
       if (program[0] != "(") {
         return {expr: expr, rest: program};
       }
     
       program = skipSpace(program.slice(1));
       expr = {type: "apply", operator: expr, args: []};
       while (program[0] != ")") {
         let arg = parseExpression(program);
         expr.args.push(arg.expr);
         program = skipSpace(arg.rest);
         if (program[0] == ",") {
           program = skipSpace(program.slice(1));
         } else if (program[0] != ")") {
           throw new SyntaxError("Expected ',' or ')'");
         }
       }
       return parseApply(expr, program.slice(1));
     }
     
     function parse(program) {
       let {expr, rest} = parseExpression(program);
       if (skipSpace(rest).length > 0) {
         throw new SyntaxError("Unexpected text after program");
       }
       return expr;
     }
     //    operator: {type: "word", name: "+"},
     //    args: [{type: "word", name: "a"},
     //           {type: "value", value: 10}]}
     
     var specialForms = Object.create(null);
     
     function evaluate(expr, scope) {
       if (expr.type == "value") {
         return expr.value;
       } else if (expr.type == "word") {
         if (expr.name in scope) {
           return scope[expr.name];
         } else {
           throw new ReferenceError(
             `Undefined binding: ${expr.name}`);
         }
       } else if (expr.type == "apply") {
         let {operator, args} = expr;
         if (operator.type == "word" &&
             operator.name in specialForms) {
           return specialForms[operator.name](expr.args, scope);
         } else {
           let op = evaluate(operator, scope);
           if (typeof op == "function") {
             return op(...args.map(arg => evaluate(arg, scope)));
           } else {
             throw new TypeError("Applying a non-function.");
           }
         }
       }
     }
     
     specialForms.if = (args, scope) => {
       if (args.length != 3) {
         throw new SyntaxError("Wrong number of args to if");
       } else if (evaluate(args[0], scope) !== false) {
         return evaluate(args[1], scope);
       } else {
         return evaluate(args[2], scope);
       }
     };
     
     specialForms.while = (args, scope) => {
       if (args.length != 2) {
         throw new SyntaxError("Wrong number of args to while");
       }
       while (evaluate(args[0], scope) !== false) {
         evaluate(args[1], scope);
       }
     
       // Since undefined does not exist in Egg, we return false,
       // for lack of a meaningful result.
       return false;
     };
     
     specialForms.do = (args, scope) => {
       let value = false;
       for (let arg of args) {
         value = evaluate(arg, scope);
       }
       return value;
     };
     
     specialForms.define = (args, scope) => {
       if (args.length != 2 || args[0].type != "word") {
         throw new SyntaxError("Incorrect use of define");
       }
       let value = evaluate(args[1], scope);
       scope[args[0].name] = value;
       return value;
     };
     
     var topScope = Object.create(null);
     
     topScope.true = true;
     topScope.false = false;
     
     for (let op of ["+", "-", "*", "/", "==", "<", ">"]) {
       topScope[op] = Function("a, b", `return a ${op} b;`);
     }
     
     topScope.print = value => {
       console.log(value);
       return value;
     };
     
     function run(program) {
       return evaluate(parse(program), Object.create(topScope));
     }
     
     specialForms.fun = (args, scope) => {
       if (!args.length) {
         throw new SyntaxError("Functions need a body");
       }
       let body = args[args.length - 1];
       let params = args.slice(0, args.length - 1).map(expr => {
         if (expr.type != "word") {
           throw new SyntaxError("Parameter names must be words");
         }
         return expr.name;
       });
     
       return function() {
         if (arguments.length != params.length) {
           throw new TypeError("Wrong number of arguments");
         }
         let localScope = Object.create(scope);
         for (let i = 0; i < arguments.length; i++) {
           localScope[params[i]] = arguments[i];
         }
         return evaluate(body, localScope);
       };
     };
   -
   
   
   console.log(parse("# hello\nx"));
   // → {type: "word", name: "x"}
   
   console.log(parse("a # one\n   # two\n()"));
   // → {type: "apply",
   //    operator: {type: "word", name: "a"},
   //    args: []}
   ```

   ![image-20210426133926141](.\img\1.png)

   习题4：

   ```js
   specialForms.set = (args, scope) => {
      
       let varName = args[0].name;
       let value = evaluate(args[1], scope);
     
       let ite = Object.getPrototypeOf(scope)
       if( ite!=null){
         if(Object.prototype.hasOwnProperty.call(ite, varName))
           ite[varName] = value;
         else
           throw new ReferenceError;
       }else{
         throw new ReferenceError;
       }
      
     
     };
     
     run(`
     do(define(x, 4),
        define(setx, fun(val, set(x, val))),
        setx(50),
        print(x))
     `);
     // → 50
     run(`set(quux, true)`);
     // → Some kind of ReferenceError
   
   ```

   ![image-20210426144158818](.\img\9.png)

   

4. [Scheme](https://sigcc.gitee.io/xplatform/#/scheme)有很多实现，其中一个是 JavaScript的 `npm i -g biwascheme` 运行`biwas`

5. - 学习简单的

     Scheme

     - 将 p155 `Egg` 代码改为`scheme`后 在`biwascheme`中运行

```js
run(`
do(define(plusOne, fun(a, +(a, 1))),
   print(plusOne(10)))
`);
// → 11

run(`
do(define(pow, fun(base, exp,
     if(==(exp, 0),
        1,
        *(base, pow(base, -(exp, 1)))))),
   print(pow(2, 10)))
`);
// → 1024
```

```js
var BiwaScheme = require("biwascheme"); 
console.log(BiwaScheme.run("( define plusOne ( lambda (a) (+ a 1 ) )  )")); 
console.log(BiwaScheme.run("( plusOne 10  )")); 
```

![image-20210426151853465](.\img\10.png)

```js
var BiwaScheme = require("biwascheme"); 
console.log(BiwaScheme.run("( define pow ( lambda (base exp) ( if (= exp 0) 1 (* base (pow base (- exp 1) )  )      ) ) )")); 
console.log(BiwaScheme.run("( pow 2 10  )")); 
```

![image-20210426152913463](.\img\11.png)

1. 请说明函数的求值过程

   plusOne：接受一个参数，与1相加然后返回

   pow：接受一个基准值和一个次方，如果一个次方为0则返回1，否则将基准乘以一个 传入基准和次方减一以后的pow函数  进行递归

2. 查看代码 定义的add函数

   ![image-20210426161905300](.\img\13.png)

3. 查看 topScope中创建的 add 函数

   ![image-20210426162042875](.\img\14.png)

4. 理解 add函数调用时候 对函数body求值的过程

   ​		

   - 理解add的参数是如何 ，扩展原有的环境的。

     ```
     求值时，先定义一个newEnv对象，将参入的参数绑定到这个对象上，然后将对象和函数的求值语句传入evaluate函数，求值结果并返回。
     ```

     

```js
//定义第一个 egg 函数
fun(a,b, +(a,b)) 

define: func(a,b) { body}

//调用 egg 函数
call: func(xx,yy)  -->  
            newEnv{..., a:xx ,b:yy} -- evaluate(body,newEnv)

   topScope{...}  
```

1. （自选）请将`Egg`的语法改为 `Scheme`
   - `(if (> a 10) 5 false )`
   - `fun` 改为 `lambda` 表达式 `((lambda (x y) (* x y) ) 2 3)  =>6`
2. 选做
   - 参考 https://github.com/franciscop/human-error
   - 能为egg 提供比较人性化的出错提示吗?
   - 参考 biwascheme ,是否可以实现类似的 终端求值 console repl
   - 是否可以实现为 [oneline repl](https://repl.it/languages/scheme)
3. 自学阅读[程序的含义](https://sigcc.gitee.io/xplatform/#/08/08.uc.semantic)
   - 请说明 小步语义和 大步语义的区别
   
     小步语义定义了一种在一个计算步骤中一次评估表达式的方法。从形式上来说，表达语言的一个小步语义是一个关系称为*归约*关系。小步语义详细描述了表达式所发生的事情。它可以给出无限链的精确描述，甚至是非终止程序;大步语义在中间。表达式语言和一组值上的一大步语义是关系。它将表达式与它的值相关（如果语言是不确定的，则可能有多个值）
   
     
   
   - 请说明什么是 指称语义
   
     在[计算机科学](https://baike.baidu.com/item/计算机科学)中，**指称语义**（英语：Denotational semantics）是通过构造表达其语义的(叫做指称(denotation)或意义的)数学对象来形式化[计算机系统](https://baike.baidu.com/item/计算机系统)的[语义](https://baike.baidu.com/item/语义)的一种方法。编程语言的形式语义的其他方法包括[公理语义](https://baike.baidu.com/item/公理语义)和操作语义。指称语义方式最初开发来处理一个单一计算机[程序](https://baike.baidu.com/item/程序)定义的系统。后来领域扩展到了由多于一个程序构成的系统，比如[网络](https://baike.baidu.com/item/网络)和并发系统。
   
     
4. 选做
   - 参考[程序的含义](https://sigcc.gitee.io/xplatform/#/08/08.uc.semantic)中**指称语义**，实现`Egg`编译到`JavaScript` //transpiler, compiler
   - 11.8.4
   - 如何支持模块
   - 如何支持 repl
   - 给出错误时候的 行号 与位置信息
   - 结合 上题,请思考,你对egg 的改进 哪些是属于 语法方面的改进,哪些是属于语义方面的改进.
   - 参考[forth](https://leanpub.com/readevalprintlove003/read) 和 **Jeforth** 将 Egg 编译到 stack base language
5. 选做
   - 实现egg列表数据结构与操作,[1,2]表示列表, cons,car,cdr功能如下
     - cons(1,[]) => [1]
     - cons(1,[2]) => [1,2]
     - car([1,2]) => 1
     - cdr([1,2]) => [2]
6. 选做
   - 参考课件中给出的[forth](https://sigcc.gitee.io/xplatform/#/08/08.egg.interpreter?id=forth)资料
   - 实现一个 [forth](http://sigcc.gitee.io/easyforth) 解释器