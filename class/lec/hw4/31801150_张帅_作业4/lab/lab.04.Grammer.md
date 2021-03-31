# 2020-21学年第2学期

## 实 验 报 告

![zucc](zucc.png){width="1.5208333333333333in" height="1.5208333333333333in"}

- 课程名称: <u>编程语言原理与编译</u>
- 实验项目: <u>语言与文法</u>
- 专业班级: <u>计算1803</u>
- 学生学号: <u>31801150</u>
- 学生姓名: <u>张帅</u>
- 实验指导教师: <u>郭鸣</u>

### 实验目的

- 了解文法的历史
- 理解产生式规则
- 掌握最左推导，最右推导
- 掌握文法的二义性
- 掌握文法的分类与层次


### 实验内容

1. 阅读课件
   
    - 自学课件后面的练习题
    - 请先不看答案。

1. 教材 1.3

    - 学习 文法 1-1
    - 学习[直线式语言SPL](http://sigcc.gitee.io/plc2021/#/02/fsharp.case?id=直线式语言spl)  
       - 理解代码与文法的对应关系
       - 文法的产生式规则 
       - 与type 类型定义的关系
       - 与解释器interp的关系
    
1. 参考[简单语言解释器](http://sigcc.gitee.io/plc2021/#/02/fsharp.case?id=简单语言解释器) [Naive.fs](https://gitee.com/sigcc/plzoofs/tree/master/naive)代码 尝试为该语言写出文法
   
   
   
   ST -> getSto store x | setSto k x |eval E |exec S |run S
   
   E -> Cast int | Var string |Prim  string  E E
   
   L -> S | SL
   
   S -> Asgn  string E |If  E S S |For  string E E S |While E S |  Print E |    Block S L
   
    
   
   - naive程序代码结构比书上的Spl更好理解，建议先阅读
   
1. 设有文法 

    ```sh
    G(N)：
    N-> D |N D
    D-> 0 | 1 | 2 | 3 | 4| 5 | 6 | 7 | 8 | 9
    ```
    - G(N) 定义的语言是什么
    L(G(N))={α | α是一个带一个或者多个数字的串}

    - 0123 和 268 的最左推导与最右推导
      N => ND => NDD => NDDD => DDDD => 0DDD => 01DD => 012D => 0123

      N => ND => N3 => ND3 => N23 => ND23 => N123 => D123 => 0123

      N => ND => NDD => DDD => 2DD => 26D => 268

      N => ND => N8 => ND8 => N68 => D68 => 268 

1. 给出下面语言的文法
   
   L1 = {a^m^ b^n^| m,n >=1}
   L2 = { 0^n^ | n>=0}
   
   L1:

   S -> AB
   
   A-> a|aA
   
   B-> b|bB
   
   L2:
   
   S -> 0 | 0S | ε
   
1. 说明下面的文法是二义性的

    ```sh
    S->iSeS|iS|i
    ```
    左推到有两种不同的情况和语法树，所以有二义性：

    S => iSeS =>  iiSeS => iiieS => iiiei

    S => iS => iiSeS =>  iiieS => iiiei

    ![image-20210331100215987](\img\1.png)

1. 下面文法生成的语言分别是什么

    ```sh
    G1 : S-> AB
        A -> aA|ε
        B->bc|bBc
    
    G2: S ->aA|a
        A ->aS
    ```
    G1 = {(a^m)(b^n)(c^k)| m>=0,n=k>=1}

    G2 = {a^(2n+1)| n >=0}

1. （不要求）~~设有文法G(E)~~

    ```sh
    G(E)
    E->E+T|E-T|T
    T->T*F|T/F|F
    F->(E)|i
    ```
    ~~试证明 E + T * F 是它的一个句型，指出此句型的短语，直接短语和句柄~~
    E => E + T => E+T*F
    
    短语：T*F、 E+T\*F
    
    直接短语：T*F
    
    句柄：T*F





