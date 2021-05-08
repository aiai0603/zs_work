
## 使用说明

进入项目文件夹

```sh
dotnet clean
dotnet build  # 自动调用fslex fsyacc工具
dotnet run
```

- 查看`*.fsproj`文件，理解`dotnet build`构建工具对 `fslex,fsyacc`的调用  


## 单独命令行操作

### A. fslex,fsyacc 生成 四则运算表达式语言 的 词法分析器 语法分析器

```sh

//加载 抽象语法定义"Absyn.fs"
//词法分析器"ExprLex.fs"
//语法分析器"ExprPar.fs"
//驱动模块"Parse.fs"

#r "nuget: fslexyacc"
#load "Absyn.fs" "ExprPar.fs" "ExprLex.fs" "Parse.fs"

//打开Parse模块
open Parse;;

fromString "2 + 3 * 4";;
fromString "let x = 3 in  2 + x * 4 end"
fromFile "expr.in.txt";;

#q;;

```

### B. 生成词法分析器和语法分析器，并用解释器eval求值。编译器scomp编译到 stack Machine code , seval 执行 stack machine code

```sh
#r "nuget: fslexyacc"
#load Absyn.fs ExprPar.fs ExprLex.fs Parse.fs Expr.fs

open Parse;;
open Expr;;
run (fromString "2 + 3 * 4");;
eval (fromString "2 + x * 4") [("x", 3)];;
eval (fromString "let x = 1+2 in 2 + x * 4 end") [];;

let code1 = scomp (fromString "2 + 3 * 4") [];;
seval code1 [];;

let code2 = scomp (fromString "2 + x * 4") [Bound "x"];;
seval code2 [3];;

let code3 = scomp (fromString "let x = 1+2 in 2 + x * 4 end") [];;
seval code3 [];;

#q;;
```
