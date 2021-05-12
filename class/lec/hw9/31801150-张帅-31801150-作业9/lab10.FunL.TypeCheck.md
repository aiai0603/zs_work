# 2020-2021学年第2学期

##  实 验 报 告

![](zucc.png)

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>函数式语言，类型检查</u>

-   专业班级: <u>计算机1803</u>

-   学生学号: 31801150

-   学生姓名: <u>张帅</u>

-   实验指导教师:<u>郭鸣</u>



## 实验内容

1. 阅读 课件，阅读课本第5章、15 章、16 章

	- http://sigcc.gitee.io/plc2021

1. 阅读 `3.monotype.p18-43.pdf` `type-rule-tutorial.pdf`

    - 理解各个语言语法构造类型检查的过程.
    - 掌握单态类型推理规则

1. 阅读 readings 下 `1.typecheck.ustc.pdf` 

    - 运行文件中 p39-45 例子程序,说明结果

      ```c
      main() {
      	printf("\n%ld\n",gcd(4,12));
      	continue;
      }
      ```

      编译时的报错如下:
      continue.c: In function ‗main‘:
      continue.c:3: continue statement not within a loop

      原因：在c语言中，continue;语句必须用于循环语句中，此处没有循环，因此报错。

      ```c
      main() {
      int i;
      switch(i){
      	case 10: printf("%d\n", 10); break;
      	case 20: printf("%d\n", 20); break;
      	case 10: printf("%d\n", 10); break;
      	}
      }
      ```

      编译时的报错如下：
      switch.c: In function ‗main‘:
      switch.c:6: duplicate case value
      switch.c:4: this is the first entry for that value

      原因：switch拥有两个相同的case值，其运行的可能结果不唯一，因此报错

      ```c
      typedef int A[10][20];
      A a;
      A *fun() {
      return(a);
      }
      
      ```

      该函数在Linux上用gcc编译，报告的错误如下:
      第5行：warning: return from incompatible pointer type

      原因：编译器会检查类型匹配，a是一个二维数组，可以理解为a是一个二级指针。需要的返回值是数组A的指针，可以理解为是一个指向它的一个三级指针，两者类型不匹配。

      ```c
      typedef int A[10][20];
      A a;
      A *fun() {
      return(&a);
      }
      ```

      该函数在Linux上用gcc编译时，没有错误。

      原因：a是一个二维数组，可以理解为a是一个二级指针，&a可以理解为是一个指向它的一个三级指针。需要的返回值是数组A的指针，可以理解为是一个指向它的一个三级指针，两者类型匹配。

      ```c
      typedef int A[10][20];
      typedef int B[20];
      A a;
      B *fun() {
      return(a);
      }
      
      ```

      该函数在Linux上用gcc编译时，没有错误

      原因：编译器会检查类型匹配，a是一个二维数组，可以理解为a是一个二级指针。需要的返回值是数组B的指针，可以理解为是一个指向它（一位数组理解为一级指针）的一个二级指针，两者类型匹配。

      ```c
      typedef int A[10][20];
      A a;
      fun() { printf("%d,%d,%d\n", a, a+1, &a+1);}
      main() { fun(); }
      
      ```

      该程序的运行结果是：
      134518112, 134518192, 134518912

      对一个t 类型的数组a\[ i 1 ][ i 2 ]…[ i n ]来说， 表达式a的类型是： 

      pointer(array(0.. i2 –1, … array(0.. in –1, t)…)) 

      表达式&a的类型是：

      pointer(array(0.. i1 –1, … array(0.. in –1, t)…))

      a是数组a的首地址，即a\[0][0]的地址

      a+1是数组a[1]的首地址a\[1][0]的地址

      &a+1则是a\[0][0]+sizeof(a)的地址，即整个数组地址的下一位

      

    - 在`gcc` 里面 编译 p58 的程序,根据运行结果回答问题

      ![image-20210510103009404](.\img\3.png)

      原因：

      C语言对除记录（结构体）、共用体以外的所有类型使用结构等价，而对记录类型用的是名字等价，以避免类型图中的环。

      第一个函数中，需要返回一个指向int一位数组的二维指针，A1，A2两者都是一维数组，&a返回的为一个二维指针，这两结构等价，所以类型匹配。

      第二个函数中，两者都是结构体，结构等价，但是结构体使用名字等价，两个结构体的名字不一致，所以报错

    - 写出下面 p56 对应的 `fsharp` 代码 ,构造该类型的值,查看其类型.

      ```fsharp
      type cell = 
         | Next of int * cell
         | NULL
      
      let cell = Next(1,Next(2,Next(3,NULL)));;
      ```

      

      ![image-20210510102059378](.\img\1.png)

    ```c
    typedef struct cell {
    int info;
    struct cell  next;
    } cell;
    ```

    - 学习p60多态函数部分 请给出一个多态的`Tree` 的定义,写出计算`Tree` 深度的多态函数 `depth  : 'a Tree -> int`

      ```fs
      type 'a bst = NL | BinTree of  'a bst [] * 'a ;;
      let T =  BinTree([| BinTree([| BinTree([| |],1) |],1) |],1);;
      
      let rec depth(t)  = 
          match t with
          | NL -> 0
          | BinTree ( child,  value )  ->  
               let mutable temp = 0
               for i = 0 to child.Length-1 do
                  if depth(child.[i])+1 > temp then
                     temp <- depth(child.[i])+1
               temp;;
         
      depth(T);;
        
      
      ```

      

      ![image-20210511095738639](.\img\2.png)

    - 理解`类型协变`与`类型逆变`

      “协变”是指能够使用与原始指定的派生类型相比派生程度更大的类型；“逆变”则是指能够使用派生程度更小的类型。

    5.阅读`MicroML`[源代码](https://gitee.com/sigcc/plzoofs/blob/master/Fun/ReadME.md)

    ![image-20210512101210309](.\img\9.png)

    ![image-20210512101426878](.\img\10.png)

    ![image-20210512101615912](.\img\11.png)

    ![image-20210512101734420](.\img\12.png)

    ![image-20210512101920437](.\img\13.png)

    - 函数定义/函数调用的实现

      函数定义:

      定义了一个由函数名 参数名 函数表达式定义 运行方式组成的结构作为函数的定义

      ![image-20210512104404436](.\img\14.png)

      函数调用：

      定义了一个递归的函数作为求值的函数，对于传入的表达式，先判定合法性，之后进行求值，如果为常量定义则返回翻译值；

      如果为变量声明，则判断变量是否合法；如果是不同的表达式，则按照不同表达式的规则进行运行

      ```fs
      let rec eval (e : expr) (env : value env) : int =
          match e with 
          | CstI i -> i
          | CstB b -> if b then 1 else 0
          | Var x  ->
            match lookup env x with
            | Int i -> i 
            | _     -> failwith "eval Var"
          | Prim(ope, e1, e2) -> 
            let i1 = eval e1 env
            let i2 = eval e2 env
            match ope with
            | "*" -> i1 * i2
            | "+" -> i1 + i2
            | "-" -> i1 - i2
            | "=" -> if i1 = i2 then 1 else 0
            | "<" -> if i1 < i2 then 1 else 0
            | _   -> failwith ("unknown primitive " + ope)
          | Let(x, eRhs, letBody) -> 
            let xVal = Int(eval eRhs env)
            let bodyEnv = (x, xVal) :: env
            eval letBody bodyEnv
          | If(e1, e2, e3) -> 
            let b = eval e1 env
            if b<>0 then eval e2 env
            else eval e3 env
          | Letfun(f, x, fBody, letBody) -> 
            let bodyEnv = (f, Closure(f, x, fBody, env)) :: env 
            eval letBody bodyEnv
          | Call(Var f, eArg) -> 
          //  printfn "%A" env
            let fClosure = lookup env f
            match fClosure with
            | Closure (f, x, fBody, fDeclEnv) ->
              let xVal = Int(eval eArg env)
              let fBodyEnv = (x, xVal) :: (f, fClosure) :: fDeclEnv
              eval fBody fBodyEnv
            | _ -> failwith "eval Call: not a function"
          | Call _ -> failwith "eval Call: not first-order function";;
      ```

      

      - 阅读 结合教材第5章、课件里面的 环境与闭包 理解闭包概念

        - 结合代码，理解如何在环境中表示闭包

          变量指向词法上下文中所绑定的值

          闭包 是函数本身的值在运行时的具体表示

          ```fs
          let rec eval (e : expr) (env : value env) : int =  
          match e with   
          | ...  
          | Letfun(f, x, fBody, letBody) ->   
          let bodyEnv = (f, Closure(f, x, fBody, env)) :: env   //Closure-->type value 的构造子
          in eval letBody bodyEnv                             
          | Call(Var f, eArg) ->   
          let fClosure = lookup env f                           
          in match fClosure with      // Evaluate fBody in declaration environment  
            | Closure (f, x, fBody, fDeclEnv) ->  
              let xVal = Int(eval eArg env)  //Int --> type value 的构造子
              let fBodyEnv = (x, xVal) :: (f, fClosure) :: fDeclEnv   
                                              // 将fClosure 保存到fDeclEnv支持定义递归函数
              in eval fBody fBodyEnv  
            | _ -> failwith "eval Call: not a function"  
          ```

          

    - 静态作用域,动态作用域的实现

      - 类型检查的实现

        静态类型语言在编译时需要进行类型检查 Type Checking
        类型检查函数typ 需要参数类型环境env Using a type environment [(“x”, TypI)]

        env中存放了各个变量的类型信息
        例如，类型环境[("x", TypI);("f", TypF (TypI,TypI))] 表示 类型环境中
        有一个变量 x类型int
        有一个函数 f 类型是 int ->int
        类型环境'v env 是一个多态类型，'v是类型参数，
        通过多态类型，构造一个具体类型 typ env，这是类型检查的参数 env 的类型

        typ函数
        Let语句 类型检查 Checking let x=eRhs in letBody end
        If语句 类型检查 Checking if e1 then e2 else e3

        函数定义letfun类型检查 Checking let f x=eBody in letBody end

        函数调用类型检查 Checking f eArg

        类型检查程序typ与求值eval 有类似的结构 The type checker typ and the interpreter eval have similar structure
        类型检查可以看成是一种抽象的程序解释过程 Type checking can be thought of as abstract interpretation of the program
        例如： TypI + TypI => TypI 类似于 3+5=8 We calculate “TypI + TypI gives TypI” instead of “Int 3 + Int 5 gives Int 8”
        不同之处 One major difference:
         对函数的类型检查不需要对函数体内部进行检查,检查函数的类型签名即可 Type checking a function call f(e) does not require type checking the function’s body again
         但是,求值函数是需要对函数体求值 Interpreting a function call f(e) does require interpreting the function’s body
        类型检查一定会终止并得出结果 Type checking always terminates

        ρ|- x:int 在环境 ρ 中，x 类型为 int 查找环境ρ

        ρ[x|->int] 在环境 ρ 中，将 x 绑定到 int，扩展环境 ρ

        简单的说，环境 ρ 可以理解为 机器的内存

        

    - 高阶函数的实现方法（自选）

      -  [http://sigcc.gitee.io/plc2021/#/05/highOrder.typeInfer](http://sigcc.gitee.io/plc2021/#/05/highOrder.typeInfer)

        - 多态函数的类型归并unify 的实现（自选）

1. 理解程序设计语言的类型系统

    - 查看并运行`ExprType.fs` 查看 `a b c e1 e2 e3 eval` 的类型并加以说明

    - ![image-20210511104258307](.\img\6.png)

    - ![image-20210511103331115](\img\4.png)

      ![image-20210511103450169](.\img\5.png)

      a是泛型list列表，因为还没有放入数据，

      b是泛型数组，因为还没有放入数据，

      c是一个int类型的数组，因为放入了两个int类型的数据

      e1,e2,e3是expr类型数据，均是定义了一个表达式

      经过eval函数后，计算出了表达式的结果，所以都成为了int类型的数据

    - 请定义一个积类型 `string * string * int`，表达学生信息(姓名，学号，成绩) 请构造几个合法的值

      ```fs
      type student = Student(string*string*int)
      
      let e1 = Student('张帅','31801150',45);
      let e2 = Student('项伟铭','3132323232323',0);
      
      ```

      

    - 请定义一个函数，使得函数类型为： `'a ->'a->'a`

      ```fs
      let function1 (x: 'a) (y: 'a) =
          x
      ```

      ![image-20210511111025051](.\img\7.png)

    - 查看并运行`ExprEnv.fs` 理解什么是求值环境 `env`

      求值环境 指在表达式的运算中，为其中的自由变量提供值。本demo中用元组表配置求值环境

      ![image-20210511111156912](.\img\8.png)

      
      
      

1. 阅读`4.unification.pdf`(自选)

    - 理解 多态类型推理的类型归并unify方法

1. 设计你大作业的类型系统,在大作业最终报告里面说明

    - 提供哪些基本类型 int/double/char/string/bool

    - 提供哪些类型复合机制  pair list array tuple

    - 完成哪些类型检查/类型推理机制

    - 强类型还是弱类型/静态类型还是动态类型 等.

1. 修改`MicroML` 的函数定义,支持多参数的函数

   
   
    

#### Exercise 4.3

For simplicity, the current implementation of the functional language
requires all functions to take **exactly one** argument. This seriously limits the programs that can be written in the language (at least it limits what that can be written
without excessive cleverness and complications).

Modify the language to allow functions to **take one or more** arguments. Start by
modifying the abstract syntax in` Absyn.fs` to permit a list of parameter names in
`Letfun` and a list of argument expressions in `Call`.
Then modify the eval interpreter in file `Fun.fs` to work for the new abstract
syntax. You must modify the closure representation to accommodate a list of parameters. Also, modify the Letfun and `Call` clauses of the interpreter. You will
need a way to zip together a list of variable names and a list of variable values, to
get an environment in the form of an association list; so function `List.zip` might
be useful.

#### Exercise 4.4

In continuation of Exercise 4.3, modify the parser specification to
accept a language where functions may take any (non-zero) number of arguments.
The resulting parser should permit function declarations such as these:

```fsharp
let pow x n = if n=0 then 1 else x * pow x (n-1) in pow 3 8 end
let max2 a b = if a<b then b else a
in let max3 a b c = max2 a (max2 b c)
in max3 25 6 62 end
end
```

### 附加题 (完成数量不限,需要单独提交)

#### Exercise 4.6

Extend the abstract syntax, the concrete syntax, and the interpreter for
the untyped functional language to handle tuple constructors `(...)` and component
selectors `#i` (where the first component is` #1`):

```fsharp

type expr =
| ...
| Tup of expr list
| Sel of int * expr
| ...

```

If we use the concrete syntax `#2(e)` for `Sel(2, e)` and the concrete syntax
`(e1, e2)` for `Tup[e1; e2]` then you should be able to write programs such as
these:

```fsharp

let t = (1+2, false, 5>8)
in if #3(t) then #1(t) else 14 end
and
let max xy = if #1(xy) > #2(xy) then #1(xy) else #2(xy)
in max (3, 88) end

```

This permits functions to take multiple arguments and return multiple results.
To extend the interpreter correspondingly, you need to introduce a new kind of
value, namely a tuple value `TupV(vs)`, and to allow eval to return a result of
type value (not just an integer):

```fsharp

type value =
| Int of int
| TupV of value list
| Closure of string * string list * expr * value env
let rec eval (e : expr) (env : value env) : value = ...
```

Note that this requires some changes elsewhere in the eval interpreter. For instance, the primitive operations currently work because eval always returns an
`int`, but with the suggested change, they will have to check (by pattern matching)
that eval returns an `Int i`.

#### Exercise 4.7

Modify the abstract syntax tyexpr and the type checker functions
typ and typeCheck in `TypedFun/TypedFun.fs `to allow functions to take
any number of typed parameters.
This exercise is similar to Exercise 4.3, but concerns the typed language. The
changes to the interpreter function eval are very similar to those in Exercise 4.3
and can be omitted; just delete the eval function.

#### Exercise 4.8

Add lists (`CstN` is the empty list `[]`, `ConC(e1,e2)` is `e1::e2`),
and list pattern matching expressions to the untyped functional language, where
`Match(e0, e1, (h,t, e2))` is match `e0` with
` [] -> e1 | h::t-> e2.`

```fsharp
type expr =
| ...
| CstN
| ConC of expr * expr
| Match of expr * expr * (string * string * expr)
| ..

```
## 实验要求

1. 完成各题目
2. 使用Markdown文件完成，推荐Typora
3. 使用[Git](https://learngitbranching.js.org/)工具管理作业代码、文本文件