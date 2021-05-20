# 2020-2021学年第2学期

##  实 验 报 告

![](zucc.png)

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>MicroC解释器</u>

-   专业班级: <u>计算机1803</u>

-   学生学号: <u>31801150</u>

-   学生姓名: <u>张帅</u>

-   实验指导教师:<u>郭鸣</u>

## 实验要求

1. 完成下面各题目
2. 使用Markdown文件完成，推荐Typora
3. 使用[Git](https://learngitbranching.js.org/)工具管理作业代码、文本文件

## 实验内容


### 1. 阅读课件 [MicroC实现,解释器 - 编程语言与编译](http://sigcc.gitee.io/plc2021/#/06/microc.interp)

###  2. 阅读 [计算的本质](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/books/Understanding.Computation)第1 2 3章

- [计算的本质](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/books/Understanding.Computation)

  计算是依据一定的法则对有关符号串的变换过程。

- 请说明大步语义，小步语义的区别

  小步语义定义了一种在一个计算步骤中一次评估表达式的方法。从形式上来说，表达语言的一个小步语义是一个关系称为*归约*关系。小步语义详细描述了表达式所发生的事情。它可以给出无限链的精确描述，甚至是非终止程序。终止程序是这样的程序，即以*值*终止，使得终止。

  大步语义：它抽象了评估的细节，但保留了结果的句法性质。通常，当存在底层的小步语义时，使用该概念，以简洁地表示“以“ ”的形式。大步语义在中间。表达式语言和一组值上的一大步语义是关系。它将表达式与它的值相关（如果语言是不确定的，则可能有多个值）。

  从操作上来说，小步语义相当于查看解释器针对该语言执行的每个操作。大步语义只看结果值。指称语义是一种数学解释，它可能与计算机上发生的事情有关，也可能没有关系

### 3. 阅读课件 2.call.by.parameters.pdf

- 请说明 Call by reference, Call by value的区别

  Call by value：参数在函数调用之前进行求值，函数接受参数的副本（形参），函数中做的事情在外部不可见。

  Call by reference：在函数调用发生之前对参数进行求值，函数接收参数的副本，变量作为指针传递，对函数中变量所做的更改在外部可见。

- (选做)请说明什么是Call by need 

  参数被封装到容器中。
  将容器传递到函数中。
  第一次执行thunk时，会缓存该值。
  使用缓存的值。


### 4. 阅读简单命令式语言代码`imp.zip`(自选)

-   理解命令式语言**存储模型**
-   写出函数`setSto` `getSto` 的类型声明
-   请说明 命令式语言与函数式语言**执行模型**的不同之处

### 5. 阅读`MicroC` 解释器代码

- 请说明 抽象语法树中 对**左值和右值**的表示方式

  AccVar ("x")  拿到x的指向的地址

  Prim2("+" , Access(AccVar ("x")), CstI 5)  访问x的地址内的值

  

- 请说明 表达式`a[i] = x` 中 **左值求值**和**右值求值**的过程,需要调用解释器的哪些方法

  左值：

  ​	调用access函数求左值

  ​	数组 通过access求值`a`得到地址,找到aval=store[ a ]通过eval求值`idx`得到 `i` ，返回`(a+i)`作为地址 

  右值：

  ​	调用eval函数求右值

  ​	通过access函数获取x的地址，通过getSto函数获取x在store中的值

-   请写出 `MicroC` 解释器中以下3个函数的类型声明,说明每个参数的含义

```fsharp
eval
eval : expr -> locEnv -> gloEnv -> store -> int * store
输入: 表达式 expr，局部环境locEnv,全局环境gloEnv,当前存储store
输出: 表达式 expr的值(int类型)，和被修改的store,

exec
exec : stmt -> locEnv -> gloEnv -> store -> store
输入：执行语句stmt，，
输出：更改后的存储store。

access
access : access -> locEnv -> gloEnv -> store -> address * store
输入: 待求值的access类型（变量x，指针*p，数组a[4]），局部环境locEnv,全局环境gloEnv,当前存储store
输出: access 的左值（地址），store
```

-   用解释器 运行 `ex9.c` 给出运行结果. 说明递归调用过程.

- gitee.com/sigcc/plzoofs microc目录 完成 `ReadME.md`中的A部分.
  ![image-20210409220125931](.\img\5.png)
  
  ![image-20210409220147861](.\img\6.png)
  
  ![image-20210409220516443](.\img\7.png)
  
  ![image-20210409220701902](.\img\8.png)
  
  ![image-20210409220730491](.\img\9.png)
  
  ![image-20210409220752259](.\img\10.png)
  
  ![image-20210409221430231](.\img\11.png)
  

###  预习下章 micro C stack machine 指令系统 重点理解

```bash
LDI
STI
GETBP
GETSP
CALL
RET
等指令
```

请使用编译器 输出 ex9.c的指令代码



