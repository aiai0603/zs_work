# **2020-21学年第2学期**

## **实 验 报 告**

![zucc](zucc.png){width="1.5208333333333333in" height="1.5208333333333333in"}

-   课程名称:编程语言原理与编译

-   实验项目:正则表达式，有限自动机，词法分析

-   专业班级\_\_\_计算机1803

-   学生学号\_\_\_31801150

-   学生姓名\_\_\_张帅

-   实验指导教师:郭鸣

## 实验内容

1. 阅读课件，阅读教材第2章

    - 理解词元token的概念，理解词元类型，词元语义值

    - 理解正则表达式的基本情况，与组合方法（选择、连接、重复）

    - 理解 最长匹配，优先次序

    - 理解 p13  2-1 2-2

    - 理解 NFA 、DFA，DFA最小化方法

    - [Automata.js](http://hokein.github.io/Automata.js/) 输入正则表达式，查看结果

      ![image-20210412082047382](.\img\22.png)

      ![image-20210412082122421](.\img\23.png)

      - 招募该项目的改进学生
        - DFA 最小化
        - 识别过程，分步显示
        - 多条正则表达式支持
        - 正则表达式命名支持

2. 写出下面的正则表达式

    - 制表符\\t和空格的任意序列 \\t \\t
       ```
      ^(\t|\s)*$
      ```

      

    - C/C++ 语言的注释 // /\* a/\*\*/sfasfd \*/ 注意查找网络资源
      ```
      \\\*[^*]*\*+([^/*][^*]*\*+)*/$
      ```

      

    - 字符串常量 “this is a string"
      ```
      ^[A-Za-z\s]+$
      ```

    

    - 浮点数 3.14159
      ```
      ^(-?\d+)(\.\d+)?$
      ```

    - 学习 URL 匹配的 正则表达式的例子

          - https://regex101.com/r/Zu0FBG/1
      
         ![image-20210412082315758](.\img\24.png)

1. 请结合实际例子说明什么是 p13
    - 最长匹配规则
    当正则表达式中包含能接受重复的限定符时，匹配尽可能多的字符。
      例如表达式：a\*b，它将会匹配最长的以a开始，以b结束的字符串。如果用它来搜索aabab的话，它会匹配字符串aab而不是ab。
    
    - 规则次序优先
    
      对于一个特定的最长初始子串，第一个与之匹配的正则表达式决定了这个子串的单词类型。也就是说，正则表达式的书写顺序有意义，可以从左至右并按照一个优先权顺序来求值。
    
      例如表达式(aa*)b，他只能匹配字符串aabab中的aab而不能匹配b。因为先判定a，在判定a\*，而不是判定为(aa)\*的运算顺序


​    
1. 考虑下面的正则表达式, 画出相应的NFA/DFA

    <h1>错误太多，紧急下架，作者太菜</h1>

    (a) 构造 NFA

    (b) 构造DFA

    (c) 最小化 DFA

1. 学习 `code/lex.zip` 了解 lex 词法生成工具的运行原理

    - 在实际编译器中 词法分析器`Lexer` ，是被 语法分析器`Parser` 调用，具体见后面题目  calcvar 代码

1. 查看仓库 https://gitee.com/sigcc/plzoofs  目录 `calcvar` 语言程序
   
    ![image-20210409202306465](.\img\1.png)
    
    - 将程序编译，运行
        -  https://gitee.com/sigcc/plzoofs/blob/master/calcvar/README.markdown 参考说明以调试模式运行
        -  查看词元token，语法树
        -  ![image-20210409202506971](.\img\2.png)
    - 理解环境中变量值的绑定与存储
      
    - 理解 其中词法描述文件 `lexer.fsl` 的代码
    
- 初步理解语法描述文件 `parser.fsy` 的代码
  
    - dotnet run -vn 查看 dotnet 调用词法分析器生成工具的命令，内容如下，具体路径有差异

```sh
dotnet "C:\Users\gm\.nuget\packages\fslexyacc\10.2.0\build\/fslex/netcoreapp3.1\fslex.dll"  -o "Scanner.fs" --module Scanner --unicode Scanner.fsl
...  
dotnet "C:\Users\gm\.nuget\packages\fslexyacc\10.2.0\build\/fsyacc/netcoreapp3.1\fsyacc.dll"  -o "Parser.fs" --module Parser Parser.fsy
```

![image-20210409214953885](.\img\3.png)

![image-20210409215207503](.\img\4.png)

理解fsproj 项目文件的参数，这些参数会传递给上面的命令

```sh
<FsLex Include="lexer.fsl">
<OtherFlags>--module Lexer --unicode</OtherFlags>
</FsLex>
<FsYacc Include="parser.fsy">
<OtherFlags>--module Parser</OtherFlags>
</FsYacc>
```

7. 学习 [CLex.fsl](https://gitee.com/sigcc/plzoofs/blob/master/microc/CLex.fsl) 结构，理解 `MicroC` 的词法分析器
    - 用调试模式运行microC 解释器，编译器 -g  具体见 [ReadME.md](https://gitee.com/sigcc/plzoofs/blob/master/microc/ReadME.md)

        ![image-20210409220125931](.\img\5.png)

        ![image-20210409220147861](.\img\6.png)

        ![image-20210409220516443](.\img\7.png)

        ![image-20210409220701902](.\img\8.png)

        ![image-20210409220730491](.\img\9.png)

        ![image-20210409220752259](.\img\10.png)

        ![image-20210409221430231](.\img\11.png)

        - 理解 词元的含义，注意词元的类型，和对应的语义值<Type,Value>
  - VOID        语义值与类型同
          - NAME “n”   类型是`NAME` 语义值是 “n”
          - CSTINT 1   类型是 `CSTINT` 语义值是“1”
        
    ```sh
~ microc>dotnet run -p .\interpc.fsproj -g ex1.c 8
    Micro-C interpreter v 1.1.0 of 2021-3-22
    interpreting ex1.c ...inputargs:[8]
    Token:
    VOID, NAME "main", LPAR, INT, NAME "n", RPAR, LBRACE, WHILE, LPAR, NAME "n", GT, CSTINT 0, RPAR, LBRACE, PRINT, NAME "n", SEMI, NAME "n", ASSIGN, NAME "n", MINUS, CSTINT 1, SEMI, RBRACE, PRINTLN, SEMI, RBRACE, EOF
    ```
    
    ![image-20210409222004470](.\img\12.png)

    - 理解关键字的处理
  - 标识符 Name 放到关键字函数keyword的最后处理
    - 理解注释 的处理
        - `//`  单行
        - `/* */` 多行
    - 理解空白 换行 的处理
    - 理解字符串的处理  （MicroC 只做了词法分析，没有完整实现）
    - 理解转义字符的处理 （MicroC 只做了词法分析，没有完整实现）
8. 大作业分组，并确定语言 [Decaf](https://github.com/decaf-lang)/[MicroC](https://gitee.com/sigcc/plzoofs/)/ [Tiger](https://gitee.com/sigcc/tiger.git) 。。。开始实现词法分析器(自选语言)
    - 大作业词法部分
    - 阅读语言规范 用 `fslex` 实现其词法分析器
      - 教材附录p360页 Tiger 语言规范
    - 注意嵌套注释实现 ` /* /* */ */` 
- 注意字符串实现   ` ""  '' " ' ' " `

9. 阅读书籍 

- 计算的本质 第3章 自动机部分 ，理解采用表驱动方法手工实现NFA，DFA的技术
  https://bb.zucc.edu.cn/bbcswebdav/users/j04014/books/Understanding.Computation
- Ruby 语言使用见 第1章
  
- 第2章 的内容后面学习会用到，提前预习下

10. （自选）阅读JFLAP-simple tutorial.pdf 用`JFLAP`中构造上题目4 的`NFA/DFA`,并截图,保留文件. JFLAP在bb 上 [soft](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/PLC/soft) 目录中,运行方式为

     ```sh
     java -jar JFLAP.jar
     ```

### 提交方式

- 打包zip上传到bb

- 实验报告采用Markdown格式

- zip内容包括Markdown文本、代码、部分体现实验过程的典型截屏(.png格式)

  