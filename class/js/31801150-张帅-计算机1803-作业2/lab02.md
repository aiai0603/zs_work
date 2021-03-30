# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/lab/02/lab02.function?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/lab/02/lab02.function?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:函数入门
- 专业班级___计算机1803
- 学生学号___31801150
- 学生姓名___张帅
- 实验指导教师:___郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/lab/02/lab02.function?id=实验内容)

1. 教材第三章 p38页 习题1,2,3

   习题1：
   ```javascript
   const mymin=(a,b)=>{
    return a>b?b:a
   }
   console.log(mymin(1,0))
   ```
   ![image-20210315134301374](\img\1.png)
   
   习题2:
   
   ```javascript
   const isEven=(a)=>{
    if(a==1)return false
    else if(a==0)return true
    else return isEven(a-2)
   }
   console.log(isEven(50))
   console.log(isEven(75))
   console.log(isEven(-1))
   ```
   ![image-20210315140212928](\img\2.png)
   
   习题2拓展：解决办法
   
   1.增加判定
    ```javascript
    const isEven=(a)=>{
        if(a<0)return "invalid number"
        else if(a==1)return false
        else if(a==0)return true
        else return isEven(a-2)
    }

    console.log(isEven(50))
    console.log(isEven(75))
    console.log(isEven(-1))
    ```
   
   ![image-20210315140544770](\img\2-1.png)
   
   
   
   2.将输入的数值转为正整数
    ```javascript
     const isEven=(a)=>{
        if(a<0) a=-a
        if(a==1)return false
        else if(a==0)return true
        else return isEven(a-2)
    }

    console.log(isEven(50))
    console.log(isEven(75))
    console.log(isEven(-1))
    ```
   
   ![image-20210315140839223](\img\2-2.png)
   
   习题3：
    ```javascript
    const countBs=(str)=>{
    let sum=0;
    let i=0;
    for(;i<str.length;i++){
        if(str[i]==="B"){
                sum++
        }
    }
    return sum
}
console.log(countBs("BBBBB212bbb"));
    ```
   
   ![image-20210315141414313](\img\3-1.png)
   
   ```javascript
   const countChar=(str,c)=>{
    let sum=0;
    let i=0;
    for(;i<str.length;i++){
        if(str[i]===c){
                sum++
        }
    }
    return sum
}
console.log(countChar("BBBBB212bbb",'b'));
   ```
   
   ![image-20210315141805678](\img\3-2.png)

2. 阅读第三章 p.30 理解[调用栈](http://sigcc.gitee.io/eloquent-js-3e-zh/#/3?id=调用栈) 。按下面所述，修改chichen egg 函数。（有的对结果有影响，有的没有）
   - 请修改程序，记录并显示在溢出前最多可以相互调用次数
       ```javascript
   let called = 0  
function chicken() {
        called++
        return egg();
 }
    function egg() {
        called++
     return chicken();
 } 
   function exitprog(){
           console.log("stack overflow:"+called) ; 
           process.exit(1);
       }
       process.on('uncaughtException', exitprog)
       chicken()
     ```
       ![image-20210315143703306](\img\4-1.png)

   - 请给程序添加 不同个数，不同类型的参数
   
        ![image-20210315145020189](\img\4-7.png)

   - 参数个数的变化对调用次数的影响
   
   	   初步结论：没有影响
   	
   	1.一个number类型参数
   	
   	   ![image-20210315143944938](\img\4-2.png)
   	
   	   2.一个布尔类型参数
   	
   	   ![image-20210315144328214](\img\4-3.png)
   	
   	   3.一个string类型
   	
   	   ![image-20210315144148358](\img\4-4.png)
   	
   	   4.一个空值
   	
   	   ![image-20210315144408115](\img\4-5.png)
   	
   	5.一个数组
   	
   	![image-20210315144944181](\img\4-8.png)
   	
   - 参数类型对调用次数的影响
   
        初步结论：参数越多，可以调用次数越多
   
        1.一个参数
   
        ![image-20210315144408115](\img\4-5.png)
   
        2.两个参数
   
        ![image-20210315144731227](\img\4-6.png)
   
        3.三个参数
   
          ![image-20210315144830324](\img\4-7.png)
   
   - 假设一个 Number 占用 8 字节，请估计调用栈的大小
   
        size=x*15703
   
        size=（x+8)*10469
   
        (15703-10469)x=8*10469
   
        x=16
   
        size=16*15703=251,272字节


```javascript
        // 由于node 堆栈溢出时候会闪退
       // 用process.on函数监听程序退出的异常，并调用exitprog
    var called = 0   
    function exitprog(){
        console.log("stack overflow:"+called) ; process.exit(1);
    }
    process.on('uncaughtException', exitprog)

        //请如下例所示，自行调整egg的参数
        //egg(1,2,"asdf")
        //egg([1,2])
```

1. 运行 [递归](http://sigcc.gitee.io/eloquent-js-3e-zh/#/3?id=递归) 一节中（p.33） findSolution程序

   - 请修改程序计算出 1-100内 调用深度最大的 数字

     答案不唯一,所以使用数组存储，运行结果如下下图所示：
   ```javascript
   let max=0;
   let number=[];
   let his=[];
   function findSolution() {
    function find(current, level, history) {
      if(current+5>100){
          if(level>max)
          {
            max=level;
            number=[];
            number.push(current);
            his=[]
            his.push(history);
          }else if(level===max){
               
            number.push(current);
            his.push(history);
        }  
      }else{
        if(current*3>100){
            if(level>max)
            {
                max=level;
                number=[];
                number.push(current);
                his=[]
                his.push(history);
            }else if(level===max){
               
                number.push(current);
                his.push(history);
            }
           
        }else{
            find(current*3,level+1 ,"("+history+") * 3");
        }
        find(current+5,level+1, history+" + 5");
      }
    }
    find(1, 1,"1");
    }
    findSolution()
    for(let i=0;i<number.length;i++){
    console.log(number[i]+" by :"+his[i]);
    }
   ```

     ![image-20210315152344128](\img\5-1.png)

   - 画出该数字 p.34 的 [调用图](https://cn.bing.com/images/search?q=call+graph&FORM=HDRSC2)
   ```
数字98：
    find(1, 1,"1")
     find(3, 2, "(1)*3")
    	find(8, 3,"(1)*3 +5")
      	  find(13, 4,"(1) * 3 + 5 + 5")
           find(18, 5,"(1) * 3 + 5 + 5 + 5")
             find(23, 6,"(1) * 3 + 5 + 5 + 5 + 5")
                省略...运行find(current+5,level+1, history+" + 5")函数14次
             	 find(99, 18 ,"(1) * 3 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5")
             	 //99+5>100运行结束，level>=max,将结果push入结果数组中
             	 
   数字99：
   find(1, 1,"1")
     find(3, 2, "(1)*3")
    	find(9, 3,"((1)*3 ) * 3")
      	  find(14, 4,"(1) * ((1)*3 ) * 3 + 5")
           find(19, 5,"((1)*3 ) * 3 + 5 + 5")
             find(24, 6,"((1)*3 ) * 3 + 5 + 5 + 5")
                省略...运行find(current+5,level+1, history+" + 5")函数13次
             	 find(98, 18 ,"((1) * 3) * 3 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5 + 5")
             	 //98+5>100运行结束，level>=max,将结果push入结果数组中
     
   ```

2. 递归实现**考拉兹猜想** [Collatz conjecture](http://www.equn.com/wiki/3x%2B1问题#.E4.B8.80.E4.B8.AA.E7.AE.80.E5.8D.95.E7.9A.84.E9.97.AE.E9.A2.98)


   任取一个自然数，如果它是偶数，我们就把它除以2，如果它是奇数，我们就把它乘3再加上1。在这样一个变换下，我们就得到了一个新的自然数。如果反复使用这个变换，我们就会得到一串自然数。 比如说我们先取5，首先我们得到3*5+1=16，然后是16/2=8，接下去是4，2和1，由1我们又得到4，于是我们就陷在4→2→1这个循环中了。 再举个例子，最开始的数取7，我们得到下面的序列：7→22→11→34→17→52→26→13→40→20→10→5→16→8→4→2→1这次复杂了一点，但是我们最终还是陷在4→2→1这个循环中。

   - 请编程 给出一个数字，输出考拉兹序列
 ```javascript
function findSolution(a) {
    function find(a,b) {
      if(a===4){
        return `${b} -> 2 -> 1`;
      }
      if(a%2===0)
      {
         return find(a/2,`${b} -> `+ (a/2) );
      }else{
         return find(a*3+1,`${b} -> `+(a*3+1) );
      }
    }
    return find(a, a);
}
console.log(findSolution(7));
 ```

 ![image-20210315160927144](\img\6-1.png)


   - 请输出 1-100间 考拉兹序列最长的数字
```javascript
let max=0;
let number=[];
let line=[];
function findSolution() {
    function find(a,b) {
      if(a===4){
        return b ;
      }
      if(a%2===0)
      {
         b.push(a/2)
         return find(a/2,b);
      }else{
         b.push(a*3+1)
         return find(a*3+1,b);
      }
    }
    for(let i=1;i<=100;i++){
      let re=[];
      re.push(i);
      let reb=find(i, re);
      if(reb.length>max){
          max=reb.length;
          number=[];
          line=[];
          number.push(i);
          line.push(reb);
      }else if(reb.length===max){
          number.push(i);
          line.push(reb);
      }
    } 
}
findSolution();
for(i=0;i<number.length;i++){
  let res=line[i][0];
  for(let j=1;j<line[i].length;j++){
    res+=" -> "+line[i][j]
  }
   console.log(number[i]+" "+res+" -> 2 -> 1")
}
```
![image-20210315162857317](\img\6-2.png)

3. 理解 [第一级对象 First Class Object](https://sigcc.gitee.io/xplatform/#/02/02.control.flow.function?id=第一级对象-first-class-object) 4条特点

   - 写出代码，在代码中用注释说明 是哪条特点
     ```javascript
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
     ```
     ![image-20210315164424808](\img\7.png)

4. 理解 p.31 [闭包](http://sigcc.gitee.io/eloquent-js-3e-zh/#/3?id=闭包)

   - 观看视频 2-7.函数简介.Closure.Object.ecm.mp4，学习使用DevTools 查看函数的代码与申明环境

   - 写一个 function makeAccount(n) 程序

     var account = makeAccount(100); //返回一个函数 account(10); //给帐号存钱 account(-10); //给帐号扣钱 account(); //显示当前账户余额

        ```javascript
     function makeAccount(m){
         return money => {
             if(money===undefined)
                 return m;
             else
                 m =  m + money;
         }
     }
     let account = makeAccount(1000);
     account(-8900)
     account(100)
     console.log(account());
        ```
        ![image-20210315183454515](\img\8-1.png)
     
- 在 DevTools 中找到闭包中n的值，再创建一个account2，请在DevTools中查看 account account2 的 环境/作用域链 scope chain。
  
  ![image-20210315184624539](\img\8-2.png)![image-20210315184913664](\img\8-3.png)
  ![image-20210315185147058](\img\8-4.png)
  
- 采用部分应用技术,支持多个币种 'RMB' 'EURO' '$'
  
  var rmbAccount = makeAccount('RMB'); var account = rmbAccount(10);
  
  ![image-20210315191906969](\img\8-5.png)
  ```javascript
function makeAccount(kind){
        return (m) =>{
            return (money) => {
                if(money===undefined)
                    return kind + " " +m;
                else
                    m =  m + money;
            }
        }
}
var rmbAccount = makeAccount('RMB'); 
var account = rmbAccount(100);
console.log(account())
var dollarAccount = makeAccount('$'); 
var account2 = dollarAccount(10000);
console.log(account2())
  ```
5. 理解 **纯函数** [函数的副作用](http://sigcc.gitee.io/eloquent-js-3e-zh/#/3?id=函数及其副作用) 的区别,写出一个纯函数（数学函数）和 有副作用的函数（访问外面变量，修改外部变量，输入输出）

   ```javascript
   const foo=(a,b)=>{
    return a+b;
   }
   let test=7;
   const foo2=(a,b)=>{
    test=test+a+b;
    console(test)
   }
   ```

   - 说明使用纯函数的好处

     使用纯函数的一个主要好处是它们可以直接测。 如果传入相同的参数，它们将始终产生相同的结果，这对于测试的编写是非常友好的。同时纯函数还使得维护和重构代码变得更加容易。你可以放心地重构一个纯函数，不必操心没注意到的副作用搞乱了整个应用，如果项目中充斥着副作用，那么函数/模块之间的逻辑可能互相交织耦合，在后期新增逻辑时可能由于依赖复杂而难以重构，更常见的是开发为了应付需求而不断的引入新的副作用到原本的逻辑上从而导致代码变得越来越糟糕。

     正确地使用纯函数可以产生更加高质量的代码。并且也是一种更加干净的编码方式。

   - 上面题目中 你写的 Collatz函数 是纯函数吗？ 如果不是请写出一个纯函数版本的Collatz函数。

      ```javascript
      function findSolution(a) {
       function find(a,b) {
      if(a===4){
        return `${b} -> 2 -> 1`;
      }
      if(a%2===0)
      {
         return find(a/2,`${b} -> `+ (a/2) );
      }else{
         return find(a*3+1,`${b} -> `+(a*3+1) );
      }
       }
       return find(a, a);
      }
      console.log(findSolution(7));
      ```
   
6. 请举例说明 原始值类型 Number String Boolean 比较与 复合类型 [] {} 比较的不同 == vs ===

   ​	1.原始值是非对象，JavaScript五大基本的数据类型，null、undefined、number、string、boolean都被视为原始值，因为他们是不可细化的，本身是简单的，不能表示由其他的值组成的值。进行比较时，原始值会去检查表示的值是否相等；复杂值是通过引用来进行存储和操作的。创建一个包含复杂对象的变量时，其值是内存中的一个引用地址。引用一个复杂对象时，使用它的名称（即变量或对象属性）通过内存中的引用地址获取对象值。复杂对象只有在引用相同的对象（即有相同的引用地址）时才相等，指向内存中复杂对象的变量，只有在引用相同对的‘地址’的情况下才是相等的，相反，两个单独创建的对象、即使具有相同的类型并拥有完全相同的属性，他们也是不相等的。

   ​	2.在使用==进行原始值比较时，左右两边会先进行隐式转型再进行比较，如果使用===进行比较，则会严格按照当前的数据类型进行比较；在使用===对复合对象进行比较时，和==没有区别。

   例如："12"==12结果是true，因为'12'隐式转型为了12，两边相等；"12"===12结果是false。

   ​			[12]===[12]结果是false，因为两者是两个不同的数组，指向不同的地址，

   ​			使用let a=[12]；le b=a；后a===b结果才是true，因为两者指向同一个地址

   ![image-20210315202208829](\img\10.png)

7. 学习[es6](http://es6.ruanyifeng.com/#docs/function) 函数部分

8. 完成[CLOSURE PUZZLES](https://sigcc.gitee.io/xplatform/slides/Functions.html#/8)部分的练习，思考运行结果，并说明。（网站404）

9. 学习使用帮助手册[devdocs.io](https://devdocs.io/)

   - 查找帮助，配置(enable) 帮助文件

     ![image-20210315210019988](\img\11-2.png)

   - 将帮助文档下载到本地

     ![image-20210315205933322](\img\11.png)

10. (选) 思考一下，如何自己[实现闭包](https://cn.bing.com/search?q=闭包实现&FORM=HDRSC1)

