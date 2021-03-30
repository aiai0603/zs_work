# 2020-21学年第2学期

## 实 验 报 告

![zucc](zucc.png){width="1.5208333333333333in" height="1.5208333333333333in"}

- 课程名称: <u>编程语言原理与编译</u>
- 实验项目: <u>FSharp OCaml语言</u>
- 专业班级: <u>计算1803</u>
- 学生学号: <u>31801150</u>
- 学生姓名: <u>张帅</u>
- 实验指导教师: <u>郭鸣</u>

### 实验目的

- 掌握FSharp、OCaml语言的发展历史
- 编程ML系列语言的类型系统、控制结构


### 实验内容

1. FSharp
    - 阅读 
      - fsharp/fsharp.crash.course.pdf文件
      - [F#/OCaml简介](http://localhost:5001/plc2021/#/02/ocaml)
      
    - 运行 fsharp/code/Appendix.fs 里面的代码

      ![image-20210310103235527](img\image-1.png)

      ![image-20210310104555980](img\image-4.png)

    
- 
  ​    
  - `#q;;` 或 `Ctrl+D` 退出 `dotnet fsi` 命令行求值器
       - ![image-20210310104413778](img\image-2.png)
  
      - ![image-20210310104453571](img\image-3.png)
  
    - 请写出一个快速排序算法，注意 let rec 的使用。

    -   ```F#
        open System
    let rec QuickSort(xs:List<int>) =
    		match xs with
    		|[]   -> []
    		|[a] -> [a]
        	|(x::xs) ->
	      		let smaller= QuickSort(xs |>List.filter(fun e->e<=x))
	  			let larger = QuickSort(xs |>List.filter(fun e->e>=x))
    		smaller @ [x]@ larger
    let data =[3;2;1;4;5;7;6]
    let result= QuickSort data
        ```
  
- ![image-20210310105037160](img\image-5.png) 
        
    - 阅读 [安装F#](http://sigcc.gitee.io/plc2021/#/install/fsharp)
  - Calc Demo 的代码 code/calcfs.zip 
    
      - 参考页面运行
      
      - ![image-20210310110542160](img\image-6.png)
      
        
  
- 参考[深度优先搜索](http://sigcc.gitee.io/plc2021/#/02/ocaml?id=深度优先搜索-4)，写移植到F#（自选）
  
  
1. OCaml（自选）
   - 阅读 [安装OCaml](http://sigcc.gitee.io/plc2021/#/install/ocaml)
   
   - ocaml目录下的 lecture.ml 中代码
   
     ![image-20210311110025294](img\image-10.png)
   
   - [深度优先搜索](http://sigcc.gitee.io/plc2021/#/02/ocaml?id=深度优先搜索-4)
   
   - 在linux 里面 安装 ocaml 配置utop 求值环境
   
     ![image-20210311105616799](img\image-9.png)
- 同上写出快速排序算法
  
  
1. VS Code 快捷方式
    - `Alt+Enter` 运行选中代码块
    
      ![image-20210310110754822](img\image-7.png)
    
    - `Alt+/` 运行当前行
    
      ![image-20210310110944903](img\image-8.png)








