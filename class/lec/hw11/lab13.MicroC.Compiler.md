# 2020-2021学年第2学期

##  实 验 报 告

![](zucc.png)

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>MicroC编译器</u>

-   专业班级: <u>计算机1803</u>

-   学生学号: <u>31801150</u>

-   学生姓名: <u>张帅</u>

-   实验指导教师:<u>郭鸣</u>

## 实验内容

### 1.  阅读课件 [MicroC实现,编译器 - 编程语言与编译](http://sigcc.gitee.io/plc2021/#/07/microc.compiler)

### 2.  阅读`MicroC` 解释虚拟机指令集

- LDI

  - 将 栈帧上 某位置的值入栈 `s,i --> s,v ; v = s(i)`
  - `i`值为相对栈底的偏移量，从 `0` 开始索引, 如 `s(0)` 表示栈底的第一个值。
  - 访问局部变量 `x` 的值: `x + 3`

- STI

  - 将 值写入栈上某个位置 `s,i,v ---> s,v ; s(i) <= v`
  - 该指令用于赋值语句`x`: `x = y + 3`

- GETBP

  ​     GETBP 得到当前栈帧基地址 bp

  ​     bp+0 对应函数第1个参数/局部变量 v1
  ​     bp+1 .......第2个............ v2

- GETSP

  - 获得当前栈的地址sp

- CALL

  - `m`是函数参数个数, `a` 是函数跳转目标地址
  - call 执行后，将 返回地址`r`，上个栈帧原来`bp`值保存到栈上,参数v1---vm拷贝到栈上。
  - 新 `bp` 寄存器的值 指向当前栈帧基地址，即从函数参数开始的地址

- RET

  - `m` 尾调用函数的参数
  - `n` 原函数的参数个数
  - 递归调用时 `m = n`

请说明上面指令的作用

### 3.  完成  [MicroC](https://gitee.com/sigcc/plzoofs/tree/master/microc) /ReadME.md 任务`B`

```sh
# 编译microc编译器,并用microc编译器 编译 ex3.c 
~ microc>dotnet clean  microc.fsproj  # optional
~ microc>dotnet build  microc.fsproj  # optional
~ microc>dotnet run -p microc.fsproj example/ex3.c # 编译
Micro-C Stack VM compiler v 1.2.0 of 2021-5-12
Compiling ex3.c ......

VM instructions saved in file:
        ex3.ins
VM instructions saved in file:
        ex3.insx86
x86 assembly saved in file:
        ex3.asm
Numeric code saved in file:
        ex3.out
Please run with VM.
~ microc>cat example/ex3.ins  # Stack VM 指令
LDARGS 1
CALL (1, "L1_main")
STOP
FLabel (1, "L1_main")
INCSP 1
GETBP
OFFSET 1
ADD
CSTI 0
...
~ microc>cat example/ex3.out           # ex3.out机器码
24 19 1 5 25 15 1 13 0 1 1 0 0 12 15 -1 16 43 13 0 1 1 11 22 15 -1 13 0 1 1 13 0 1 1 11 0 1 1 12 15 -1 15 0 13 0 1 1 11 13 0 0 1 11 7 18 18 15 -1 21 0
~ microc> gcc machine.c -o machine # gcc编译器生成虚拟机
~ microc>./machine.exe ex3.out 10  # 执行ex3.out机器码
0 1 2 3 4 5 6 7 8 9 Used   0.000 cpu seconds
```


![image-20210526102534043](.\img\21.png)

'![image-20210526102654157](.\img\22.png)

![image-20210526102726383](.\img\23.png)

![image-20210526103028478](.\img\24.png)

![image-20210526103110976](.\img\25.png)

![image-20210526103147247](.\img\26.png)

'请编译如下MicroC案例程序，读懂相应的 输出代码  `*.ins` ，理解每种编程结构的`编译模式`

- example/emptymain.c

  ![image-20210526103559225](.\img\27.png)

- example/onearg.c

  ![image-20210526103709847](.\img\28.png)

- example/global.c

  ![image-20210526103745484](.\img\29.png)

- example/array.c

  ![image-20210526103824367](.\img\30.png)

- example/while.c

  ![image-20210526103913525](.\img\31.png)

- example/if.c

  ![image-20210526103957898](.\img\32.png)

- example/return.c

  ![image-20210526104028596](.\img\33.png)

- example/function.c

- ![image-20210526104108244](.\img\34.png)

- example/*.c


### 4.  请阅读 `ex9.trace.0.txt` `ex9.trace.3.txt`理解 源代码 和 指令的对应关系

```sh
 ./machine.exe example/ex9.out 0
 ./machine.exe -trace example/ex9.out 3
```
[运行示例参见]

[](http://sigcc.gitee.io/plc2021/#/05/microc.compiler?id=the-code-generated-for-ex9c)

​			![image-20210526105521149](.\img\35.png)

![image-20210526105549246](.\img\36.png)

### 5.  请用 运行下面的命令,仿照4 写出 虚拟机代码的注释

- machine.exe example/ex5.out 5

  ![image-20210520141322630](.\img\19.png)

- machine -trace example/ex5.out 5

  ![image-20210520141244712](.\img\18.png)
  
  ```
  栈帧下标从0开始
   |
   v
  [ ]{0:LDARGS}
  [ 5 ]{1:CALL 1 5}
  [ 4 -999 5 ]{5:INCSP 1}      int r;
  [ 4 -999 5 0 ]{7:GETBP}
  [ 4 -999 5 0 2 ]{8:CSTI 1} 
  [ 4 -999 5 0 2 1 ]{10:ADD}
  [ 4 -999 5 0 3 ]{11:GETBP}
  [ 4 -999 5 0 3 2 ]{12:CSTI 0}
  [ 4 -999 5 0 3 2 0 ]{14:ADD}
  [ 4 -999 5 0 3 2 ]{15:LDI}     r=n；
  [ 4 -999 5 0 3 5 ]{16:STI}
  [ 4 -999 5 5 5 ]{17:INCSP -1}
  [ 4 -999 5 5 ]{19:INCSP 1}     int r;
  [ 4 -999 5 5 5 ]{21:GETBP}
  [ 4 -999 5 5 5 2 ]{22:CSTI 0}
  [ 4 -999 5 5 5 2 0 ]{24:ADD}
  [ 4 -999 5 5 5 2 ]{25:LDI}     square n 
  [ 4 -999 5 5 5 5 ]{26:GETBP}
  [ 4 -999 5 5 5 5 2 ]{27:CSTI 2}
  [ 4 -999 5 5 5 5 2 2 ]{29:ADD}   square &r
  [ 4 -999 5 5 5 5 4 ]{30:CALL 2 57}   call square
  [ 4 -999 5 5 5 33 2 5 4 ]{57:GETBP}       
  [ 4 -999 5 5 5 33 2 5 4 7 ]{58:CSTI 1}
  [ 4 -999 5 5 5 33 2 5 4 7 1 ]{60:ADD}
  [ 4 -999 5 5 5 33 2 5 4 8 ]{61:LDI}     获取指针地址
  [ 4 -999 5 5 5 33 2 5 4 4 ]{62:GETBP}
  [ 4 -999 5 5 5 33 2 5 4 4 7 ]{63:CSTI 0}
  [ 4 -999 5 5 5 33 2 5 4 4 7 0 ]{65:ADD}
  [ 4 -999 5 5 5 33 2 5 4 4 7 ]{66:LDI}   获取指针地址
  [ 4 -999 5 5 5 33 2 5 4 4 5 ]{67:GETBP}
  [ 4 -999 5 5 5 33 2 5 4 4 5 7 ]{68:CSTI 0}
  [ 4 -999 5 5 5 33 2 5 4 4 5 7 0 ]{70:ADD}
  [ 4 -999 5 5 5 33 2 5 4 4 5 7 ]{71:LDI}      i = 5入栈
  [ 4 -999 5 5 5 33 2 5 4 4 5 5 ]{72:MUL}    做平方
  [ 4 -999 5 5 5 33 2 5 4 4 25 ]{73:STI}
  [ 4 -999 5 5 25 33 2 5 4 25 ]{74:INCSP -1}   
  [ 4 -999 5 5 25 33 2 5 4 ]{76:INCSP 0}
  [ 4 -999 5 5 25 33 2 5 4 ]{78:RET 1}   返回
  [ 4 -999 5 5 25 4 ]{33:INCSP -1}
  [ 4 -999 5 5 25 ]{35:GETBP}
  [ 4 -999 5 5 25 2 ]{36:CSTI 2}
  [ 4 -999 5 5 25 2 2 ]{38:ADD}
  [ 4 -999 5 5 25 4 ]{39:LDI}
  [ 4 -999 5 5 25 25 ]{40:PRINTI}    输出
  25 [ 4 -999 5 5 25 25 ]{41:INCSP -1}
  [ 4 -999 5 5 25 ]{43:INCSP -1}
  [ 4 -999 5 5 ]{45:GETBP}
  [ 4 -999 5 5 2 ]{46:CSTI 1}
  [ 4 -999 5 5 2 1 ]{48:ADD}
  [ 4 -999 5 5 3 ]{49:LDI}
  [ 4 -999 5 5 5 ]{50:PRINTI}    输出
  5 [ 4 -999 5 5 5 ]{51:INCSP -1}
  [ 4 -999 5 5 ]{53:INCSP -1}
  [ 4 -999 5 ]{55:RET 0}
  [ 5 ]{4:STOP
  ```
  
  
  
  

### 6. 在ex1.c 中

- 加上代码 h[4] = 5; 

- ![image-20210526110717191](.\img\37.png)

- ![image-20210526112221633](.\img\39.png)

- 结合MicroC堆栈的布局，请解释一下程序运行的结果

  h[4]=5的命令产生了数组越界的错误，修改了栈中的运行完毕后返回的出口参数，程序运行完成后可以没有正常退出，而是因为修改了出口，再次运行了输出的程序，使得结果打印了两次。

- 试试分别加上 h[5]---h[12]，程序发生了什么？
  
  ![image-20210526112320718](.\img\40.png)
  
  - 网上搜索缓冲区溢出漏洞的基本原理
  
    缓冲区溢出是指当计算机向缓冲区内填充数据位数时超过了缓冲区本身的容量溢出的数据覆盖在合法数据上,理想的情况是 程序检查数据长度并不允许输入超过缓冲区长度的字符,但是绝大多数程序都会假设数据长度总是与所分配的储存空间想匹配,这就为缓冲区溢出埋下隐患.操作系统所使用的缓冲区 又被称为"堆栈". 在各个操作进程之间,指令会被临时储存在"堆栈"当中,"堆栈"也会出现缓冲区溢出 。
  
    通过往程序的缓冲区写超出其长度的内容，造成缓冲区的溢出，从而破坏程序的堆栈，使程序转而执行其它指令，以达到攻击的目的。造成缓冲区溢出的原因是程序中没有仔细检查用户输入的参数。
  
    当然，随便往缓冲区中填东西造成它溢出一般只会出现“分段错误”（Segmentation fault），而不能达到攻击的目的。最常见的手段是通过制造缓冲区溢出使程序运行一个用户shell，再通过shell执行其它命令。如果该程序属于root且有suid权限的话，攻击者就获得了一个有root权限的shell，可以对系统进行任意操作了。
    缓冲区溢出攻击之所以成为一种常见安全攻击手段其原因在于缓冲区溢出漏洞太普遍了，并且易于实现。而且，缓冲区溢出成为远程攻击的主要手段其原因在于缓冲区溢出漏洞给予了攻击者他所想要的一切：植入并且执行攻击代码。被植入的攻击代码以一定的权限运行有缓冲区溢出漏洞的程序，从而得到被攻击主机的控制权。

### 7. 在大作业编译器中，尝试完成下面的任务

#### Exercise 8.3

This abstract syntax for preincrement `++e` and predecrement `--e` was
introduced in Exercise 7.4:

```fsharp
type expr =
...
| PreInc of access (* C/C++/Java/C ++i or ++a[e] *)
| PreDec of access (* C/C++/Java/C --i or --a[e] *)
```

Modify the compiler (`function cExpr`) to generate code for `PreInc(acc)` and
`PreDec(acc)`. To parse micro-C source programs containing these expressions,
you also need to modify the lexer and parser.
It is tempting to expand `++e` to the assignment expression `e = e+1`, but that
would evaluate e twice, which is wrong. Namely, e may itself have a side effect, as
in `++arr[++i]`.
Hence e should be computed only once. For instance, `++i` should compile to
something like this: 

`<code to compute address of i>;, DUP, LDI, CSTI 1, ADD, STI`, 

where the address of `i` is computed once and then duplicated.
Write a program to check that this works. If you are brave, try it on expressions of
the form `++arr[++i]` and check that i and the elements of arr have the correct
values afterwards.

#### Exercise 8.6

Extend the lexer, parser, abstract syntax and compiler to implement\
switch statements such as this one:

```fsharp

switch (month) {
    case 1:
        { days = 31; }
    case 2:
        { days = 28; if (y%4==0) days = 29; }
    case 3:
        { days = 31; }
}
```

Unlike in C, there should be no fall-through from one case to the next: after the

last statement of a case, the code should jump to the end of the switch statement.

The parenthesis after switch must contain an expression. The value after a case

must be an integer constant, and a case must be followed by a statement block.

A switch with n cases can be compiled using n labels, the last of which is at the

very end of the switch. For simplicity, do not implement the break statement or

the default branch.

#### Exercise 8.7

(Would be convenient) Write a disassembler that can display a machine code program in a more readable way. You can write it in Java, using a variant

of the method insname from Machine.java.

#### Exercise 8.9

Extend the language and compiler to accept initialized declarations\
such as

```fsharp
int i = j + 32;
```

Doing this for local variables (inside functions) should not be too hard. For global
ones it requires more changes.

## 实验要求

1. 完成下面各题目
2. 使用Markdown文件完成，推荐Typora
3. 使用[Git](https://learngitbranching.js.org/)工具管理作业代码、文本文件
