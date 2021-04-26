# **2020-21学年第2学期**

## **实 验 报 告**

![zucc](zucc.png){width="1.5208333333333333in" height="1.5208333333333333in"}

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>语法分析 `LR`分析</u>

-   专业班级: <u>计算18</u>03

-   学生学号: <u>31801150</u>

-   学生姓名: 张帅

-   实验指导教师: <u>郭鸣</u>

## 实验内容

1. 阅读ppt,阅读教材第3章

- 理解LR（0） DFA的构建过程

- 理解如何从DFA状态图，进行LR分析表的构建

- 教材 p50 3.4.3 理解冲突产生原因
  
  移进—归约冲突指的是在移进和归约之间进行选择
  
  归约—归约冲突指的是在两条不同的规则之间进行归约的一种选择
  
  - p51 理解`图3-13` `LR 状态表`，找到其中的冲突项
  
    state17发生了移进—归约冲突
  
  - 找到其中的 `Action Table（动作表）` ，`Gstaoto Table（状态转换表）`的定义
  
    分析表由action表和goto表两部分组成:
    action[sm, ai]: 表示当状态sm面临输入ai时的动作动作主要包括四种:
  
    Shift s(移进): 将ai和s=action[sm, ai]压入栈中
  
    Reduce A→β(归约): 用产生式A→β归约 
  
    Accept(接受): 停机，接受，成功
  
    Error(报错): 调用出错处理
  
  
    goto[sm, Xi]: 表示当状态sm面对文法符号Xi时需要跳转到的下一状态
  
- 教材 p50 3.4.2.优先级指导 
  - 理解在语法说明文件中，优先级的指定方式 
    - 什么时左/右结合/非结合 ，如何在语法说明文件里面声明 p53
    
      左结合：从左往右运算
    
      右结合：从右向左运算
    
      非结合：不进行集合
    
      声明：
    
      使用%nonassoc声明非结合
    
      使用%left声明左结合
    
      使用%right声明右结合
    
    - 如何用 `%prec` 指示，自定义某规则的优先级 p53
    
      使用%prec指导命令给规则制定一种明确优先级。
    
      这个%prec指示本条规则“| '-' exp”具有与NEG相同的优先级
  - [http://mdaines.github.io/grammophone/#](http://mdaines.github.io/grammophone/) 核对你的作业
  - 请勿抄袭


2. 设有如下文法 

```sh
S -> S A b .
S -> a c b .
A -> b B c .
A -> b c .
B -> b a .
B -> A c .
```
分析栈上的内容如下,请分别写出可归约串是什么（▽ 表示栈底）：
```sh
(a)▽SSAb
(b)▽SSbbc
(c)▽SbBc
(d)▽Sbbc
```

(a) SAb

(b) bc

(c) bBC

(d) bc

  3.设有如下输入串，请用2中的文法，采用 shift/reduce分析下面的串。

   请按ppt 中 构造表格，列出 

   分析栈，输入流， shift/reduce操作 的内容

```sh
(a) acb
(b) acbbcb
(c) acbbbacb
(d) acbbbcccb
(e) acbbcbbcb
```

| 符号栈 | 输入串 | 动作              |
| ------ | ------ | ----------------- |
| $      | acb$   | 移入              |
| $a     | cb$    | 移入              |
| $ac    | b$     | 移入              |
| $acb   | $      | 规约 S -> a c b . |
| $S     | $      | 接受              |

| 符号栈 | 输入串  | 动作              |
| ------ | ------- | ----------------- |
| $      | acbbcb$ | 移入              |
| $a     | cbbcb$  | 移入              |
| $ac    | bbcb$   | 移入              |
| $acb   | bcb$    | 规约 S -> a c b . |
| $S     | bcb$    | 移入              |
| $Sb    | cb$     | 移入              |
| $Sbc   | b$      | 规约 A -> b c .   |
| $SA    | b$      | 移入              |
| $SAb   | $       | 规约 S -> S A b . |
| $S     | $       | 接受              |

| 符号栈 | 输入串    | 动作              |
| ------ | --------- | ----------------- |
| $      | acbbbacb$ | 移入              |
| $a     | cbbbacb$  | 移入              |
| $ac    | bbbacb$   | 移入              |
| $acb   | bbacb$    | 规约 S -> a c b . |
| $S     | bbacb$    | 移入              |
| $Sb    | bacb$     | 移入              |
| $Sbb   | acb$      | 移入              |
| $Sbba  | cb$       | 规约 B -> b a .   |
| $SbB   | cb$       | 移入              |
| $SbBc  | b$        | 规约 A -> b B c . |
| $SA    | b$        | 移入              |
| $SAb   | $         | 规约 S -> S A b . |
| $S     | $         | 接受              |

| 符号栈 | 输入串     | 动作              |
| ------ | ---------- | ----------------- |
| $      | acbbbcccb$ | 移入              |
| $a     | cbbbcccb$  | 移入              |
| $ac    | bbbcccb$   | 移入              |
| $acb   | bbcccb$    | 规约 S -> a c b . |
| $S     | bbcccb$    | 移入              |
| $Sb    | bcccb$     | 移入              |
| $Sbb   | cccb$      | 移入              |
| $Sbbc  | ccb$       | 规约 A -> b c .   |
| $SbA   | ccb$       | 移入              |
| $SbAc  | cb$        | 规约 B -> A c .   |
| $SbB   | cb$        | 移入              |
| $SbBc  | b$         | 规约 A -> b B c . |
| $SA    | b$         | 移入              |
| $SAb   | $          | 规约 S -> S A b . |
| $S     | $          | 接受              |

| 符号栈 | 输入串     | 动作              |
| ------ | ---------- | ----------------- |
| $      | acbbcbbcb$ | 移入              |
| $a     | cbbcbbcb$  | 移入              |
| $ac    | bbcbbcb$   | 移入              |
| $acb   | bcbbcb$    | 规约 S -> a c b . |
| $S     | bcbbcb$    | 移入              |
| $Sb    | cbbcb$     | 移入              |
| $Sbc   | bbcb$      | 规约 A -> b c     |
| $SA    | bbcb$      | 移入              |
| $SAb   | bcb$       | 规约 S -> S A b   |
| $S     | bcb$       | 移入              |
| $Sb    | cb$        | 移入              |
| $Sbc   | b$         | 规约 A -> b c     |
| $SA    | b$         | 移入              |
| $SAb   | $          | 规约 S -> S A b . |
| $S     | $          | 接受              |
4. 设有如下文法和输入串，请说明是否有shift/reduce冲突 或者 reduce/reduce 冲突

```sh
S -> S a b .
S -> b A .
A -> b b .
A -> b A .
A -> b b c .
A -> c .
```

输入串
```sh
(a) b c
(b) b b c a b
(c) b a c b
```

| 符号栈 | 输入串 | 动作                                                      |
| ------ | ------ | --------------------------------------------------------- |
| $      | bc$    | 移入                                                      |
| $b     | c$     | 移入                                                      |
| $bc    | $      | 规约  A -> c .                                            |
| $bA    | $      | 产生reduce/reduce冲突<br />可以对应 S -> b A . A -> b A . |

| 符号栈 | 输入串 | 动作                                                  |
| ------ | ------ | ----------------------------------------------------- |
| $      | bbcab$ | 移入                                                  |
| $b     | bcab$  | 移入                                                  |
| $bb    | cab$   | 产生shift/reduce冲突<br />可以移入c或者规约A -> b b . |

| 符号栈 | 输入串 | 动作         |
| ------ | ------ | ------------ |
| $      | bacb$  | 移入         |
| $b     | acb$   | 移入         |
| $ba    | cb$    | 移入         |
| $bac   | b$     | 规约A -> c . |
| $baA   | b$     | 移入         |
| $baAb  | $      | 接受         |


5. 阅读lecture03.p31.fsyacc.pdf p31页 掌握fslex,fsyacc使用

   ![image-20210425105035173](.\img\1.png)
   
   ![image-20210425105936887](.\img\2.png)
   
   ![image-20210425110041288](.\img\3.png)
   
   ![image-20210425110347059](.\img\4.png)
   
   阅读 calcvar 中

- 词法说明 [lexer.fsl](https://gitee.com/sigcc/plzoofs/blob/master/calcvar/lexer.fsl)
- 语法说明 [parser.fsy](https://gitee.com/sigcc/plzoofs/blob/master/calcvar/parser.fsy)
- 调试运行代码
- 理解优先级指导的写法
  - 阅读 [ReadME]( https://gitee.com/sigcc/plzoofs/blob/master/calcvar/README.markdown)

6. plzoofs [calcvar](https://gitee.com/sigcc/plzoofs/tree/master/calcvar)项目，给`fsyacc` 工具添加 `-v` 参数，查看生成分析器时系统的 LR 状态表
```html
// calcvar.fsproj 
<FsYacc *Include*="parser.fsy">
    <OtherFlags> -v --module Parser</OtherFlags>
</FsYacc>
```
注意下特定状态的
- action table

- goto table

  ![image-20210426092910089](.\img\12.png)

  ![image-20210426093008132](.\img\13.png)


7. 阅读Fun语言中

- 词法说明 [FunLex.fsl](https://gitee.com/sigcc/plzoofs/blob/master/Fun/FunLex.fsl)

- 语法说明 [FunPar.fsy](https://gitee.com/sigcc/plzoofs/blob/master/Fun/FunPar.fsyfsl)

- 调试运行代码

  ![image-20210426095350111](.\img\14.png)

  

- 同上`fsyacc`工具添加 `-v`查看 `LR` 分析状态表

  ![image-20210426095943790](.\img\15.png)

8. 用fslex fsyacc 实现SPL的词法分析，语法分析 

   SPL语法:

```sh
Stm -> Stm ; Stm
Stm -> id := Exp
Stm -> print ( ExpList )
Exp -> id
Exp -> num
Exp -> Exp Binop Exp
Exp -> ( Stm , Exp )
ExpList -> Exp , ExpList
ExpList -> Exp
Binop -> +
Binop -> -
Binop -> /
Binop -> *
```

SPL例子代码:(p3)

```pascal
a := 5 + 3; b := (print(a,a-1),10*a); print(b)
```


9. 阅读MicroC 语法分析器

   - https://gitee.com/sigcc/plzoofs/blob/master/microc/CPar.fsy
   
   - 由于 `C` 语言的指针，数组语法分析比较复杂，构造语法树时用到了比较高级的函数式编程技巧
   
   - 大家慢慢理解
   
     
10. Fsharp参考案例（自选）-

   -   Postfix/  后缀式 运算 1 2 + 3 *
   -   Usql/   sql 语言语法解析

​    

​    

## 参考资料

 

   http://bb.zucc.edu.cn/webapps/cmsmain/webui/users/j04014/PLC/book

   flex与bison 中文版 第二版 高清.pdf

### 提交方式

- 打包`zip`上传到`bb`

- 实验报告采用`Markdown`格式

- `zip`内容包括`Markdown`文本、代码、部分体现实验过程的典型截屏(`.png`格式)

  