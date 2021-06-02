# 2020-2021学年第2学期

##  实 验 报 告

![](zucc.png)

-   课程名称: <u>编程语言原理与编译</u>

-   实验项目: <u>续算[Continuation](http://10.66.27.234:8090/#/06.cont/cont?id=callcc-call-with-current-continuation), CPS风格</u>

-   专业班级: <u>计算机1803</u>

-   学生学号: <u>31801150</u>

-   学生姓名: <u>张帅</u>

-   实验指导教师:<u>郭鸣</u>



## 实验内容

1. 阅读课件 

    - [续算, CPS风格](http://sigcc.gitee.io/plc2021/#/cont)
    - 2.07-08-rec-op-CPS.pdf
    - [MicroC优化编译器](http://sigcc.gitee.io/plc2021/#/optmc/optmc) 
    
2. 运行 cont目录中 [README.md](cont/README.md) 中的实验 A ，实验 B

    ![image-20210531075736791](.\img\1.png)

    ![image-20210531075930017](.\img\2.png)

    ![image-20210531080117359](.\img\3.png)

    

    
  - 理解解释器
    - 抛出异常`Raise of  exn `，续算的实现
    
      ```fs
      // CPS风格
      //注意求值函数coEval1 所有的 尾位置 都 使用续算 cont 传递结果
      //cont : int -> answer 续算的类型是一个单值函数
      let rec coEval1 e env (cont : int -> answer) : answer =  
          match e with  
          | CstI i -> cont i  
          | Var x  ->
            match lookup env x with  
              | Int i -> cont i         // cont 返回 常数
              | _     -> Abort "coEval1 Var"  //直接抛出异常
          | Prim(ope, e1, e2) ->
            coEval1 e1 env             // 求值e1结果
      
             (fun i1 ->                //续算 接受 e1的运算结果i1
               coEval1 e2 env
                 (fun i2 ->            //续算 接受 e2的运算结果i2
                  match ope with  
                    | "*" -> cont (i1 * i2)  //最终结果交给 cont  
                    | "+" -> cont (i1 + i2)  
                     | ... ))  
           | Raise (Exn s) -> Abort s  
           
      // if
      let rec coEval1 e env  (cont : int -> answer) : answer =  
          match e with  
          |  ...  
           | If(e1, e2, e3) ->
            coEval1 e1 env  
                   (fun b -> if b<>0 then
                               coEval1 e2 env cont  
                             else
                               coEval1 e3 env cont)  
          | ...  
      
      // call
      let rec coEval1 (e : expr) (env : value env)
      (cont : int -> answer) : answer =
          match e with
              | ...
              // 函数调用 先对 eArg求值
              | Call(f, eArg) ->
              let fClosure = lookup env f
                  match fClosure with
                  | Closure (f, x, fBody, fDeclEnv) ->
                      coEval1 eArg env
                      (fun xVal ->              // 求值eArg后结果xVal，交给续算 
                          let fBodyEnv = (x, Int xVal)  // 构造新的求值环境fBodyEnv
                          :: (f, fClosure) :: fDeclEnv
                          coEval1 fBody fBodyEnv cont)  // 在新环境fBodyEnv中求函数body的值
      
                  | _ -> Abort "eval Call: not a function" // f 不是函数，抛出异常值
      ```
    
      
    
    - 捕获异常`TryWith of  expr  *  exn * expr`，续算的实现
    
      ```fs
      //捕获异常，求值函数 需要 cont econt两个续算参数
      let rec coEval2 e env  (cont : int -> answer)
                             (econt : exn -> answer) : answer =  
          match e with  
          | CstI i -> cont i  
          | If(e1, e2, e3) ->
            coEval2 e1 env (fun b ->  
                            if b<>0 then
                              coEval2 e2 env cont econt  
                            else
                              coEval2 e3 env cont econt)
                           econt  
          | ...  
          | Raise exn -> econt exn   //抛出异常 将异常对象传给 econt续算
          | TryWith (e1, exn, e2) ->
      
            // 构造 e1 的错误处理续算econt1
            // 当抛出错误 会运行此处代码
            let econt1 thrown =
                 //匹配异常类型是相同
                 // 相同则计算 e2的值
                 // 注意 cont econt是原来的参数
                if thrown = exn then coEval2 e2 env cont econt  
                                else econt thrown
                          // 没有捕获到异常，继续抛出thrown-->传给 econt  
      
            // e1 是try block
            // e1 的错误处理续算 econ1
            in coEval2 e1 env cont econt1  
       
      let rec coExec2 stmt (store : naivestore) (cont : naivestore -> answer) (econt : exn * naivestore -> answer) : answer =
      
          match stmt with
              | Asgn(x, e) ->
                  cont (setSto store (x, eval e store))
              | If(e1, stmt1, stmt2) ->
                  if eval e1 store <> 0 then
                  coExec2 stmt1 store cont econt
                  else
                  coExec2 stmt2 store cont econt
              | ...
              | Throw exn ->
                  econt(exn, store)  //抛出异常 exn
              | TryCatch(stmt1, exn, stmt2) ->
      
                  //为代码块 stmt1  定义新的   续算函数 econt1
                  let econt1 (exn1, sto1) =
                      if exn1 = exn then coExec2 stmt2 sto1 cont econt  //异常捕获，处理异常
                      else econt (exn1, sto1)   //未捕获，执行`econt (exn1, sto1)` 继续抛出异常
      
                  //在新的econt1 中有异常exn 的捕获机制，会跳转到stmt2
                  coExec2 stmt1 store cont econt1  
      ```
    
      
    
    - 请写出 函数式语言 和 命令式语言 解释器参数
      
      函数式语言：
      
      ```fs
       type expr =
         |  ...  
         | Raise of exn                    // raise exn  
         | TryWith of expr * exn * expr    // try e1 with exn -> e2  
         
        type answer =
         | Result of int  
         | Abort of string
      
        let rec coEval1 e env (cont : int -> answer) : answer =  
      ```
      
      命令式语言
      
      ```fs
      type stmt =
      | ...
      | Throw of exn
      | TryCatch of stmt * exn * stmt
      
      let rec coExec2 stmt (store : naivestore) (cont : naivestore -> answer) (econt : exn * naivestore -> answer) : answer 
      ```
      
      
      
      - 比较他们有哪些差异   
      
        1.命令式语言会修改 store
      
        2.执行流程不同
      
        


3. 实现 cps目录中 cps-activity.pdf 中的 CPS 转换
- pdf文件里面的代码是`haskell`   在这里可以 试试 https://www.tryhaskell.org/

- 将代码改写为 F#

  ```fsharp
  //第一题F#
  let rec sumList list =
  
     match list with  
  
     | []-> 0    
  
     | head::tail -> head + sumList(tail) ;;
  
  //第一题CPS风格
  let rec sumList_cps list f =
  
     match list with  
  
     | []-> f 0    
  
     | head::tail ->  sumList_cps(tail)(fun v->f( head+v) )  ;;
  
  //测试用例
  let id = fun v -> v
  sumList_cps [1;3;5] id;; 
  
  //第二/三题的F#源代码
  let rec map f list =
     match list with  
     | []-> [] 
     | head::tail -> (f head)::(map f tail) 
  
  //源代码测试样例
  let doublea a =a+3
  map doublea [1;2;3]
  
  //第二题的CPS
  let rec map_cps f list k=
     match list with  
     | []-> k [] 
     | head::tail -> map_cps f tail (fun v->k(f head::v) ) 
  
  //测试用例
  let id = fun v -> v
  map_cps doublea [1;3;5] id;; 
  
  //第三题的CPS
  let rec map_cps3 f list k=
     match list with  
     | []-> k [] 
     | head::tail -> map_cps3 f tail ( fun v ->( f (head::v) k )   )
  
  //测试样例
  let id = fun v -> v
  let doubleb a k=k a
  map_cps3 doubleb [1;3;5] id;; 
  
  
  //第四题F#源代码
  let min a b =
      if a>b then b
      else a
  
  let min4 a b c d=
      min (min a b) (min c d)
  
  //测试用例
  min4 1 2 3 4 
  
  
  //第四题的CPS
  let min_cps a b k=
      if a>b then k b
      else k a
  
  let min4_cps a b c d k =
      min_cps a b (fun v-> (min_cps c d (fun v2-> min_cps v v2 k)) )
  
  //测试用例
  min4_cps 1 2 3 4 id;;
  
  
  //第五题
  let myif a b c k=
      match a with
      | true -> k b
      | false -> k  c
  
  myif (1>2) 4 5 id
  
  
  
  //第六题源代码
  type AUX = 
     | Add of int 
     | Sub of int
     
  
  let rec aux first list = 
      match list with
      | [] -> first
      | head::tail -> 
          match head with
          | Add a -> aux ( first + a ) tail
          | Sub a -> aux ( first - a ) tail
  
  //测试数据
  aux 0 [Add 1;Add 2;Add 6;Sub 7];;
  
  //第六题CPS
  type AUX = 
     | Add of int 
     | Sub of int
     
  
  let rec aux_cps first list k = 
      match list with
      | [] -> first
      | head::tail -> 
          match head with
          | Add a -> aux_cps  (first+a)  tail ( fun v -> (k v) )
          | Sub a -> aux_cps  (first-a)  tail ( fun v -> (k v) )
  
  
  
   //测试数据
  aux_cps 0 [Add 2;Add 2;Add 6;Sub 7] id;;
  
  ```

  

- 阅读课件  [CPS 转换](http://sigcc.gitee.io/plc2021/#/08/cont?id=cps-转换)，理解CPS 变换的四个步骤

  - 第 1 步，给函数定义加上续算`参数 k`,

  - 第 2 步，应用续算函数k到尾位置的简单表达式

  - 第 3 步，续算 k 直接作为`参数`传递给`尾调用`函数 Step 3: Pass the current continuation to every function call in tail position

  - 第 4 步，不在尾位置的函数调用，需要构造新的续算函数，其中包含了原来的`续算k`。

  

- 阅读课件 [利用 id 函数](http://sigcc.gitee.io/plc2021/#/08/cont?id=利用-id-函数🎈-evaluating-facc-n-id) 
  
  - CPS 程序取值 id 函数的作业
  
    ```fsharp
     let rec prodc xs k =
         match xs with
         | []    ->  k 1
         | x::xr ->  prodc(xr)(fun v-> k(x*v))
    ```


4. 完成 MicroC实验中[ReadME.md](https://gitee.com/sigcc/plzoofs/blob/master/microc/ReadME.md) 的 C D 部分 基于续算的优化编译器

    ![image-20210531082317711](.\img\6.png)

    ![image-20210531082535873](.\img\7.png)

    ![image-20210531082741566](.\img\8.png)

    ![image-20210531082806859](.\img\9.png)

    - 生成microcc.exe ,用优化编译器编译microc案例代码 ex*.c'

      ![image-20210531082317711](.\img\6.png)

    - 在优化编译器中编译`ex11.c`比较生成的代码,并测试性能 

      ![image-20210531082535873](.\img\7.png)

5. 请说明MicroC 虚拟机尾递归调用`TCALL`指令的对栈帧的操作，参数`m ，n`分别是什么含义

    当编译器检测到一个函数调用是尾递归的时候，它就覆盖当前的活动记录而不是在栈中去创建一个新的。编译器可以做到这点，因为递归调用是当前活跃期内最后一条待执行的语句，于是当这个调用返回时栈帧中并没有其他事情可做，因此也就没有保存栈帧的必要了。通过覆盖当前的栈帧而不是在其之上重新添加一个，这样所使用的栈空间就大大缩减了，这使得实际的运行效率会变得更高。

    - `m` 尾调用函数的参数
    - `n` 原函数的参数个数
    - 递归调用时 `m = n`

6. 请写出案例程序，用`microcc`编译，用运行结果说明该编译器生成代码是`尾递归优化`的。

    ```c
    int t;
    
    void main(int i) {
      int r;
      fac(i, &r);
      print r;
    }
    
    void fac(int n, int *res) {
      if (n == 0)
        *res = 1;
      else {
        int tmp;
        fac(n - 1, &tmp);
        *res = tmp * n;
      }
    }
    
    
    栈帧下标从0开始
     |
     v
    [ ]{0: INCSP 1}               // int t;  没有使用的全局变量
    [ 0 ]{2: LDARGS}              // main 命令行参数 i = 0    
    [ 0 0 ]{3: CALL 1 7}          // 调用 位于7 的 main(0) 函数 参数个数为1
                                  // 栈帧内容 [6 -999 0] 的解释
                                  // CALL 1 7 拿掉栈上1个参数 0 
                                  // 放上 返回地址: 6
                                          old bp: -999   默认初始bp值为 -999
                                           参数i : 0
    [ 0 6 -999 0 ]{7: INCSP 1}    // 给 int  r; 留空间
    [ 0 6 -999 0 0 ]{9: GETBP}    // bp = 3   
    [ 0 6 -999 0 0 3 ]{10: CSTI 0}   bp + 0   main参数 i的位置
    [ 0 6 -999 0 0 3 0 ]{12: ADD}
    [ 0 6 -999 0 0 3 ]{13: LDI}   //  得到参数 i=0
    [ 0 6 -999 0 0 0 ]{14: GETBP}
    [ 0 6 -999 0 0 0 3 ]{15: CSTI 1}  bp+1  main局部变量r的位置 
    [ 0 6 -999 0 0 0 3 1 ]{17: ADD}   bp+1   &r=4
    [ 0 6 -999 0 0 0 4 ]{18: CALL 2 35}   //调用 位于 35 的fac(0,4)  4是r的在栈上的地址 &r
                                          // CALL 2 35 拿掉栈上的两个参数 0 4
    [ 0 6 -999 0 0 21 3 0 4 ]{35: GETBP}
    [ 0 6 -999 0 0 21 3 0 4 7 ]{36: CSTI 0}
    [ 0 6 -999 0 0 21 3 0 4 7 0 ]{38: ADD}
    [ 0 6 -999 0 0 21 3 0 4 7 ]{39: LDI}   // 得到 fac 参数n的值 =0
    [ 0 6 -999 0 0 21 3 0 4 0 ]{40: CSTI 0}   
    [ 0 6 -999 0 0 21 3 0 4 0 0 ]{42: EQ}     //  n = 0 ?
    [ 0 6 -999 0 0 21 3 0 4 1 ]{43: IFZERO 57}  // n != 0  else 转到 57 条件为FALSE 则跳转
    [ 0 6 -999 0 0 21 3 0 4 ]{45: GETBP}         // n=0 执行
    [ 0 6 -999 0 0 21 3 0 4 7 ]{46: CSTI 1}
    [ 0 6 -999 0 0 21 3 0 4 7 1 ]{48: ADD}  
    [ 0 6 -999 0 0 21 3 0 4 8 ]{49: LDI}    // *res的左值 = 4  
    [ 0 6 -999 0 0 21 3 0 4 4 ]{50: CSTI 1}
    [ 0 6 -999 0 0 21 3 0 4 4 1 ]{52: STI}  // *res = 1  注意: STI对栈上位置4 赋值 1
    [ 0 6 -999 0 1 21 3 0 4 1 ]{53: INCSP -1}
                ^^^
    [ 0 6 -999 0 1 21 3 0 4 ]{55: GOTO 97}
    [ 0 6 -999 0 1 21 3 0 4 ]{97: INCSP 0}  //fac 没有局部变量
    [ 0 6 -999 0 1 21 3 0 4 ]{99: RET 1}    //从 fac(0,4)返回 撤销栈帧  return; RET m-1                                         //                    fac参数个数 m=2
    [ 0 6 -999 0 1 4 ]{21: INCSP -1}       //  fac(0); 丢弃 fac(0);的值 
    [ 0 6 -999 0 1 ]{23: GETBP}             
    [ 0 6 -999 0 1 3 ]{24: CSTI 1}
    [ 0 6 -999 0 1 3 1 ]{26: ADD}          //得到r的偏移地址  
    [ 0 6 -999 0 1 4 ]{27: LDI}           // 得到main 的值 r
    [ 0 6 -999 0 1 1 ]{28: PRINTI}       //输出 r
    1 [ 0 6 -999 0 1 1 ]{29: INCSP -1}   // 丢弃 PRINTI 的值 (r值) 
    [ 0 6 -999 0 1 ]{31: INCSP -1}  // 丢弃 main 的局部变量 r
    [ 0 6 -999 0 ]{33: RET 0}          //  从main(0) 中 return; RET m-1
                                                 // main 参数个数 m=1 
    [ 0 0 ]{6: STOP}             // 执行结束       
    
    ```

    可见：调用返回时栈帧中并没有其他事情可做，没有保存栈帧的必要了,通过覆盖当前的栈帧而不是在其之上重新添加一个实现递归的调用

    

7. 查看 c 编译器的优化效果， 访问 https://godbolt.org/  

    - 编译如下的  S16-lecture-01.pdf  p44 程序
      
      - 阅读上述pdf，理解常规优化方法
      
        ![image-20210602210334329](.\img\10.png)
      
        
      
    - 选择   参数 -O0  或 -O3 查看生成的汇编代码
      - 注意左边源代码 与右边汇编指令的对应关系
      
      - 优化级别高，访问内存少 	
      
        ![image-20210602210646078](.\img\11.png)
      
        ![image-20210602210811317](.\img\12.png)
      
    - 选择不同的编译器  clang  gcc 查看生成的汇编

    - ![image-20210602211344898](.\img\13.png)

    ```c
    int sumcalc(int a, int b, int N)
    {
        int i, x, t, u, v;
        x = 0;
        u = ((a<<2)/b);
        v = 0;
        for(i = 0; i <= N; i++) {
            t = i+1;
            x = x + v + t*t;
            v = v + u;
        }
        return x;
    }
    ```

8. 自选，完成  Cont 目录里面 c 语言的 longjmp and setjmp 

9. 自选, 实现支持异常指令的 Stack Machine 

10. 自选,在大作业实现的语言中支持异常处理，尾递归优化



## 实验要求

1. 使用Markdown文件完成，推荐Typora
1. 使用[Git](https://learngitbranching.js.org/)工具管理作业代码、文本文件

