# 2020-2021学年第2学期

##  实 验 报 告

![](zucc.png)

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>MicroC编译器</u>

-   专业班级: <u>计算机1803</u>

-   学生学号: <u>31801150</u>

-   学生姓名: <u>张帅</u>

-   实验指导教师:<u>郭鸣</u>

## 实验要求

1. 完成下面各题目
2. 使用Markdown文件完成，推荐Typora
3. 使用[Git](https://learngitbranching.js.org/)工具管理作业代码、文本文件

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

### 3.  完成 lab中 `ReadME.md 任务`B`

![image-20210519142837931](.\img\13.png)

<h1>注意：</h1>

readme有误,应该改为：//启动fsi
dotnet fsi -r ./bin/Debug/net5.0/FsLexYacc.Runtime.dll Debug.fs Absyn.fs CPar.fs CLex.fs Parse.fs Machine.fs Comp.fs ParseAndComp.fs   

![image-20210519144335516](.\img\14.png)

![image-20210519144530651](.\img\15.png)

![image-20210519144706137](.\img\16.png)

```sh
# 编译microc编译器,并用microc编译器 编译 ex3.c 

dotnet clean  microc.fsproj
dotnet build  microc.fsproj

dotnet run -p microc.fsproj ex3.c

Micro-C Stack VM compiler v 1.0.0.1 of 2017-12-2
Compiling ex3.c to ex3.out
StackVM code:
[LDARGS; CALL (1,"L1"); STOP; Label "L1"; INCSP 1; GETBP; CSTI 1; ADD; CSTI 0;
 STI; INCSP -1; GOTO "L3"; Label "L2"; GETBP; CSTI 1; ADD; LDI; PRINTI; INCSP -1;
 GETBP; CSTI 1; ADD; GETBP; CSTI 1; ADD; LDI; CSTI 1; ADD; STI; INCSP -1;
 INCSP 0; Label "L3"; GETBP; CSTI 1; ADD; LDI; GETBP; CSTI 0; ADD; LDI; LT;
 IFNZRO "L2"; INCSP -1; RET 0]
Numeric code in file:
        ex3.out  
 Please run with VM.
 
# cat ex3.out  #ex3.out机器码
24 19 1 5 25 15 1 13 0 1 1 0 0 12 15 -1 16 43 13 0 1 1 11 22 15 -1 13 0 1 1 13 0 1 1 11 0 1 1 12 15 -1 15 0 13 0 1 1 11 13 0 0 1 11 7 18 18 15 -1 21 0

#gcc machine.c -o machine  #用gcc编译器生成生成c 虚拟机 machine
# ./machine ex3.out 10    #用虚拟机machine 执行ex3.out机器码
0 1 2 3 4 5 6 7 8 9 Used   0.000 cpu seconds
```

![image-20210519144854293](.\img\17.png)

### 4.  请阅读 `ex9.trace.0.txt` `ex9.trace.3.txt`理解 源代码 和 指令的对应关系

```sh
 ./machine.exe ex9.out 0
```
[运行示例参见](http://sigcc.gitee.io/plc2021/#/05/microc.compiler?id=the-code-generated-for-ex9c)

![image-20210520141419998](.\img\20.png)

### 5.  请用 运行下面的命令,仿照4 写出 虚拟机代码的注释

- machine.exe ex5.out 5

  ![image-20210520141322630](.\img\19.png)

-   machine -trace ex5.out 5

![image-20210520141244712](.\img\18.png)



### 6. 选做下面 1 项或多项

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