

# 2020-2021学年第2学期

##  实 验 报 告

![](zucc.png)

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>AST，Eval，StackVM</u>

-   专业班级: <u>计算机1803</u>

-   学生学号: 31801150

-   学生姓名: <u>张帅</u>

-   实验指导教师:<u>郭鸣</u>



## 实验内容

1.  阅读 课件，阅读课本第4章


- 后续课程内容参考自 [ProgrammingLanguageConcepts.2e.pdf](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/PLC/book/ProgrammingLanguageConcepts.2e.pdf) 建议下载阅读

- 自学 [Forth]( http://sigcc.gitee.io/easyforth) [Postscript](http://sigcc.gitee.io/wps)理解栈式语言原理

- https://sharplab.io/  写一个Fibonacci的代码，看看生成的栈式语言`MSIL`

  ![image-20210508082508967](.\img\1.png)

- [03 抽象语法树栈式虚拟机](http://sigcc.gitee.io/plc2021/#/03/ast.svm)

2.  浏览 [svm](https://gitee.com/sigcc/plzoofs/tree/master/svm) 目录里面的代码，理解如下概念

- 理解`SimpleExpr.fs` 简单表达式 ，在`F#`中如何表示简单表达式的`AST`
  
  - 嵌套表达式，嵌套的语法树
  
    ![image-20210508082925391](.\img\2.png)
- 理解 `SimpleExprVar.fs` 支持变量声明的简单表达式
  
  - 变量，存储，求值环境
  
    ![image-20210508082957563](.\img\3.png)
  
    ![image-20210508083039362](.\img\4.png)
- 理解 `SVM.RPN.fs` 逆波兰栈式虚拟机
  
  - 栈的操作，后缀式表示
  
    
  
    ![image-20210508083231726](.\img\6.png)
  
    ![1212](.\img\7.png)
- 理解自由变量的概念
  - 代码使用到了，但是未定义值的变量
  - 在求值过程中，环境中需给出自由变量的值
- 理解 `SVM.With.Var` 带变量的逆波兰 栈式虚拟机
  - 重点理解 变量是如何表示为地址的
  
    ![image-20210508083505907](.\img\8.png)
  
  - 编译时的编译环境
  
    ![image-20210508083630976](.\img\10.png)
  
  - 运行时的求值环境
  
    ![image-20210508083609959](.\img\9.png)


3. 写出下面式子的
   - 抽象语法树
   
     Let ("x", CstI 3, Prim ("+", Var "z", Var "x"))
   
     Let ("x", Let ("x", CstI 3, Prim ("*", Var "x", Var "z")),  Prim ("\*", CstI 2, Var "x"))
   
     
   
   - 环境中 z 为 3，环境如何表示
   
     此处用简单的**`名称-值`对**构成的**元组的列表（list of tuple）**来实现
   
     ```fs
     eval ast1 [ ("z", 3) ] |> show
     ```
   
     
   
   - 虚拟机指令， `SVar 0` 
   
     第一题：[SCstI 3; SVar 1; SVar 1; SAdd; SSwap; SPop]
   
     第二题：[SCstI 3; SVar 0; SVar 2; SMul; SSwap; SPop; SCstI 2; SVar 1; SMul; SSwap; SPop]
   
   - 在 SvmWithVar 中验证你的结果
   
     ![image-20210508130109967](.\img\11.png)
   
     ![image-20210508131030330](.\img\12.png)
   
     


   ```fsharp
   let x = 3 in z + x
   
   let x = let x = 3 in x * z in  2 * x
   
   ```

4. 写出下面式子中的自由变量，在自由变量下用 `^` 表示


```fsharp

let x = 3 in x  + z 
                  ^
                自由变量
                  
let x =  x + 2 in x + 2
				  ^
                自由变量

let x = let y = 3 in y + 3 in x + y 
								  ^
                				自由变量

```

5. (选做) 参考`Expr.AST`完成编译 教材 SPL 到逆波兰栈式虚拟机的代码  

参考教材的实现
- p65 解释器
- p67 抽象语法
  - 参考[Naive.fs](https://gitee.com/sigcc/plzoofs/blob/master/naive/naive.fs)

技术实现过程
- 使用`FsLex,FsYacc` 词法分析、语法分析 ===> `AST` 
- 将`AST`编译到`Stack.VM` ===> 类似于： `[RCstI 10; RCstI 7; RDup; RMul; RAdd]` 的虚拟机指令
- 虚拟机运行得到结果===> `13`
- 加一个虚拟机指令 `Print n `实现SPL的输出，Print n 表达式式的值取参数值n
- SPL赋值 用 `Let  in`


6.  (选做) 参考 readings/regneregler.pdf 实现一个符号微分程序.

- 需要自己定义 `AST`类型
- 写出 `let derive e:expr` 函数
-  `derive` 将  `X^2 ==> 2x` 

7. (选做 ) 语言扩展 多重绑定 Extend the expression language expr from `Intcomp1.fs `with
   multiple sequential let-bindings, such as this (in concrete syntax):
   
   ```fsharp
   let x1 = 5+7
   x2 = x1*2 in x1+x2 end
   ```
   To evaluate this, the right-hand side expression 5+7 must be evaluated and bound
   to x1, and then x1*2 must be evaluated and bound to x2, after which the let-body
   x1+x2 is evaluated.
   The new abstract syntax for expr might be
   ```fsharp
   type expr =
   | CstI of int
   | Var of string
   | Let of (string * expr) list * expr
   (* CHANGED *)
   | Prim of string * expr * expr
   ```
   so that the Let constructor takes a list of bindings, where a binding is a pair of a
   variable name and an expression. The example above would be represented as:
   Let ([("x1", ...); ("x2", ...)], Prim("+", Var "x1", Var "x2"))
   Revise the eval interpreter from Intcomp1.fs to work for the expr language
   extended with multiple sequential let-bindings.

   实现解释器，编译器
   
8. (选读)
- readings/下面的经典论文
### 提交方式

- 打包`zip`上传到`bb`

- 实验报告采用`Markdown`格式

- `zip`内容包括`Markdown`文本、代码、部分体现实验过程的典型截屏(`.png`格式)