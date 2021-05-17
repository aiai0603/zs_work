
# 2020-2021学年第2学期

# **实 验 报 告**



- 课程名称:跨平台脚本开发技术
- 实验项目:Http JavaScript异步Http请求XHR Promise
- 专业班级_计算机1803__
- 学生学号__31801150_
- 学生姓名__张帅_
- 实验指导教师:郭鸣

## 实验内容

1. 阅读课本相关内容 回答理解以下问题
    - 18.1 理解Http请求与响应的格式
        [http请求 (三个部分)]
        
        - 请求行 request
          - 方法 `GET,POST,HEAD,PUT,DELETE ...`
          - 路径 服务器资源的虚拟路径 + 查询字符串QueryString
          - 协议版本 `HTTP/1.1` `HTTP/2.0`
        - 头部 headers
          
          - 支持协议工作的名称值对 (k,v) pairs `name: value`
        - 消息体 body
          
          - Form Data (URL encoded)
          
        - 上传的文件
        
        
      
      [http响应 (三部分)]
      
        - 响应行
          - 协议
      - 状态码
          - 状态短语
        - 头部
        - 消息体
      
    - 18.2 请在DevTools/F12中 , Network面板中，查看 GET POST 方式提交的数据 ，请求，响应的内容,请求行,状态码,状态短语,头部的内容
      
    - ```bash
        //在12.form.html 所在的目录，运行下面的命令，启动 http server
        npm i -g http-server 
        hs
        ```
        
        - 连接URL地址 http://127.0.0.1:8080/12.form.html
        
          ![image-20210517133326466](.\img\2.png)
        
        - 给出 hs命令的 结果，是web server 的连接日志，对结果加以说明
        
          ![image-20210517133217894](.\img\1.png)
        
        - ```bash
          [2020-05-12T03:06:17.434Z]  "GET /12.form.html" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.4100.0 Iron Safari/537.36"
          [2020-05-12T03:06:17.596Z]  "GET /favicon.ico" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.4100.0 Iron Safari/537.36"
          ```
        
          GET:协议
          
           /12.form.html：路径
          
          name？=1212&message=11：get传递的参数
          
          “Mozilla/5.0 (Windows NT 10.0; Win64; x64) 
          
          AppleWebKit/537.36 (KHTML, like Gecko) 
          
          Chrome/79.0.4100.0 Iron Safari/537.36”浏览器信息
          
          
        
    - 18.4/5 请访问http://127.0.0.1:8080/ 在DevTools中, Console面板中，写出请求的返回结果
    
        ![image-20210517134427614](.\img\3.png)
```js
    //同步请求
    var req = new XMLHttpRequest();
    req.open("GET", "/12.form.html", false); //sync request
    req.send(null);
    console.log(req.status, req.statusText);
    // → 200 OK
    console.log(req.getResponseHeader("content-type"));
    // → text/plain
    //
    //异步请求
    var req = new XMLHttpRequest();
    req.open("GET", "/12.form.html", true); //async request
    req.addEventListener("load", function() {
    console.log("Done:", req.status);
    });
    req.send(null);
```
- 请说明 异步请求与同步请求的区别。

  同步是指：发送方发出数据后，等接收方发回响应以后才发下一个数据包的通讯方式。  
  异步是指：发送方发出数据后，不等接收方发回响应，接着发送下个数据包的通讯方式。

  同步通信方式要求通信双方以相同的时钟频率进行，而且准确协调，通过共享一个单个时钟或定时脉冲源保证发送方和接收方的准确同步，效率较高；
  异步通信方式不要求双方同步，收发方可采用各自的时钟源，双方遵循异步的通信协议，以字符为数据传输单位，发送方传送字符的时间间隔不确定，发送效率比同步传送效率低。

  使用者可以同步或异步实现服务调用。从使用者的观点来看，这两种方式的不同之处在于：

  同步——使用者通过单个线程调用服务；该线程发送请求，在服务运行时阻塞，并且等待响应。
  异步——使用者通过两个线程调用服务；一个线程发送请求，而另一个单独的线程接收响应。
  术语同步 和异步 经常与顺序 和并发 混淆了。后面的这两个术语与执行单独的任务必须遵循的顺序有关，而同步和异步 与线程执行单个任务（如调用单个服务）的方式有关。理解同步和异步调用之间的不同的一种很好的方法是考虑崩溃恢复的后果：

  同步——如果使用者在服务运行的过程中阻塞时崩溃了，当它重新启动时，将无法重新连接到正在进行的调用，所以响应丢失了。使用者必须重复调用过程，并且期望这次不会崩溃。
  异步——如果使用者在发送了请求之后等待响应时崩溃了，当它重新启动时，可以继续等待响应，所以响应不会丢失。

- 18.8 请结合代码 说明使用抽象的好处

  用抽象类及接口最重要的用处还是在于，使代码实现很方便的扩展，最简单的就是在new对象时，将生成对象定义为接口，在以后需要替换时就很方便。抽象类及接口，并不只是为了抽象，为了接口面抽象，而接口。在你需要用到一系列可继承自抽象类的子类，或是需要实现共同接口的多个实现类时，才需要考虑。

  

- 18.8 请理解在 XHR中为何 无法捕获回调函数的异常

  try...catch是被设计成捕获当前执行环境的异常，意思是只能捕获同步代码里面的异常，异步调用里面的异常无法捕获。

  异步的调用的callback代码在得到返回值时运行，由于try catch 已经结束，所以无法捕获异常

  

- 18.9 请理解Promise对象的作用

  [Promise](https://sigcc.gitee.io/xplatform/#/11/11.promise) 期约 可以看成是一个异步的值, 是对`未来返回`的值的抽象。 

  Promise对象 有`then()` 方法,在`then()` 方法中处理异步值.

  

- 18.9 Promise对象 then方法返回的对象类型是什么.

  `then()`方法返回的依然是一个`Promise`对象.

  

- 请用 Fetch API 完成 12.form.html 提交

  ![image-20210517142927961](.\img\6.png)

  ```js
  
  
    <div>GET</div>
    <p>Name: <input type="text" name="name"></p>
    <p>Message:<br><textarea name="message"></textarea></p>
    <p><button onclick="fetch1()">Send via GET </button></p>
  
    <div>POST</div>
    <p>Name: <input type="text" name="name"></p>
    <p>Message:<br><textarea name="message"></textarea></p>
    <p><button onclick="fetch2()">Send via POST </button></p>
  
  
  <script>
     var fetch1 = function(){
      fetch("http://192.168.130.1:8080/demo1.html?name="+document.getElementsByName("name")[0].innerText+"&message="+document.getElementsByName("message")[0].innerText, {
      method: "GET",
     
          headers: {
      "Content-Type": "application/x-www-form-urlencoded"
      },
    
  }).then(function(res) {
    if (res.ok) {
      console.log("Perfect! Your settings are saved.");
    } else if (res.status == 401) {
      console.log("Oops! You are not authorized.");
    }
  }, function(e) {
    console.log("Error submitting form!");
  });
  }
  
  
  var fetch2 = function(){
      fetch("http://192.168.130.1:8080/demo1.html",{
      method: "POST",
     
          headers: {
      "Content-Type": "application/x-www-form-urlencoded"
      },
      body:"name="+document.getElementsByName("name")[1].innerText+"&message="+document.getElementsByName("message")[1].innerText,
    
  }).then(function(res) {
    if (res.ok) {
      console.log("Perfect! Your settings are saved.");
    } else if (res.status == 401) {
      console.log("Oops! You are not authorized.");
    }
  }, function(e) {
    console.log("Error submitting form!");
  });
  }
  ```

  

  


1. 完成 18.17  1  题

     hw1:

    ```js
    const url = "https://eloquentjavascript.net/author";
    const types = ["text/plain",
                   "text/html",
                   "application/json",
                   "application/rainbows+unicorns"];
    
    async function showTypes() {
      for (let type of types) {
        let resp = await fetch(url, {headers: {accept: type}});
        console.log(`${type}: ${await resp.text()}\n`);
      }
    }
    showTypes();
    ```

    

    ![image-20210517154957920](.\img\12.png)

    hw2:

    ```js
    <textarea id="code">return "hi";</textarea>
    <button id="button">Run</button>
    <pre id="output"></pre>
    
    <script>
      document.getElementById("button").addEventListener("click", () => {
        let code = document.getElementById("code").value;
        let outputNode = document.getElementById("output");
        try {
          let result = Function(code)();
          outputNode.innerText = String(result);
        } catch (e) {
          outputNode.innerText = "Error: " + e;
        }
      });
    </script>
    ```

    

    ![image-20210517155912744](.\img\13.png)

    ![image-20210517155939840](.\img\14.png)

    hw3:

    ```js
    <div id="grid"></div>
    <button id="next">Next generation</button>
    
    
    <script>
      const width = 30, height = 15;
    
      let gridNode = document.querySelector("#grid");
      
      let checkboxes = [];
      for (let y = 0; y < height; y++) {
        for (let x = 0; x < width; x++) {
          let box = document.createElement("input");
          box.type = "checkbox";
          gridNode.appendChild(box);
          checkboxes.push(box);
        }
        gridNode.appendChild(document.createElement("br"));
      }
    
      function gridFromCheckboxes() {
        return checkboxes.map(box => box.checked);
      }
      function checkboxesFromGrid(grid) {
        grid.forEach((value, i) => checkboxes[i].checked = value);
      }
      function randomGrid() {
        let result = [];
        for (let i = 0; i < width * height; i++) {
          result.push(Math.random() < 0.3);
        }
        return result;
      }
    
      checkboxesFromGrid(randomGrid());
    
      function countNeighbors(grid, x, y) {
        let count = 0;
        for (let y1 = Math.max(0, y - 1); y1 <= Math.min(height - 1, y + 1); y1++) {
          for (let x1 = Math.max(0, x - 1); x1 <= Math.min(width - 1, x + 1); x1++) {
            if ((x1 != x || y1 != y) && grid[x1 + y1 * width]) {
              count++;
            }
          }
        }
        return count;
      }
    
      function nextGeneration(grid) {
        let newGrid = new Array(width * height);
        for (let y = 0; y < height; y++) {
          for (let x = 0; x < width; x++) {
            let neighbors = countNeighbors(grid, x, y);
            let offset = x + y * width;
            if (neighbors < 2 || neighbors > 3) {
              newGrid[offset] = false;
            } else if (neighbors == 2) {
              newGrid[offset] = grid[offset];
            } else {
              newGrid[offset] = true;
            }
          }
        }
        return newGrid;
      }
    
      function turn() {
        checkboxesFromGrid(nextGeneration(gridFromCheckboxes()));
      }
    
      document.querySelector("#next").addEventListener("click", turn);
    
     
    </script>
    ```

    ![image-20210517161539216](.\img\15.png)

1. 学习[Fiddler教程](https://www.jianshu.com/p/99b6b4cd273c) 在实验中使用该软件 分析 `http请求与响应`的数据

     ![image-20210517174244946](.\img\19.png)

​    

1. 请查看类似于   https://api.github.com
    - 用 XHR 或 Fetch API

      ```js
        fetch("https://api.github.com/repos/aiai0603/zs_work", {
          method: "GET",
        
        }).then(function(res) {
        
          console.log(res);
          return res.json()
          }).then(function(json) {
            console.log( json)
       
        })
      ```

      

    - 获取一个项目的描述,项目最新的提交记录等信息.

      ![image-20210517200233469](C:\Users\asus\Desktop\class\跨平台\作业11\img\22.png)

    - 将内容显示在网页上

      ```js
      <p>描述：</p>
      <p id="myp"></p>
      <p>最近一次提交：</p>
      <p id="mydate"></p>
      <script>
        
        fetch("https://api.github.com/repos/aiai0603/zs_work", {
          method: "GET",
        
        }).then(function(res) {
        
          console.log(res);
          return res.json()
          }).then(function(json) {
            document.getElementById("myp").innerHTML = json.description;
            document.getElementById("mydate").innerHTML = json.pushed_at;
       
        })
      
      </script>
      ```

      

      ![image-20210517201147817](.\img\23.png)

    - 找找 天气接口 或地理位置接口 显示天气预报,或 你当前的ip 地址信息

      ```
  <p>天气：</p>
      <p id="myp"></p>
      <script>
        
        fetch("http://wthrcdn.etouch.cn/weather_mini?city=北京",{
          method: "GET",
        
        }).then(function(res) {
        
          console.log(res);
          return res.json()
          }).then(function(json) {
            document.getElementById("myp").innerHTML = JSON.stringify(json.data);
           
       
        })
      
       
      
      </script>
      ```
      
      ![image-20210517212849515](.\img\24.png)
    
1. 阅读文章[Promise](https://sigcc.gitee.io/xplatform/#/11/11.promise)相关文

    - [https://bb.zucc.edu.cn/bbcswebdav/users/j04014/JavaScript/homework/11.Tasks%2C%20microtasks%2C%20queues%20and%20schedules.pdf](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/JavaScript/homework/11.Tasks%2C microtasks%2C queues and schedules.pdf)

    - 什么是 任务，什么是微任务

      ES6 规范中，microtask 称为 `jobs`，macrotask 称为 `task`
      宏任务是由宿主发起的，而微任务由JavaScript自身发起。

      所以，总结一下，两者区别为：

      |                    | 宏任务（macrotask）                                          | 微任务（microtask）                                          |
      | ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
      | 谁发起的           | 宿主（Node、浏览器）                                         | JS引擎                                                       |
      | 具体事件           | 1. script (可以理解为外层同步代码) 2. setTimeout/setInterval 3. UI rendering/UI事件 4. postMessage，MessageChannel 5. setImmediate，I/O（Node.js） | 1. Promise 2. MutaionObserver 3. Object.observe（已废弃；`Proxy` 对象替代） 4. process.nextTick（Node.js） |
      | 谁先运行           | 后运行                                                       | 先运行                                                       |
      | 会触发新一轮Tick吗 | 会                                                           | 不会                                                         |

      

1. `npm install -g json-server`  `npm install faker` 

    - 参考[文章](https://segmentfault.com/a/1190000008574028)

    - 请写出 GET/POST/PUT/DELETE的请求fetch api调用代码

      ![image-20210517151945259](.\img\7.png)

      ![image-20210517152527556](.\img\8.png)

      ![image-20210517152740698](.\img\9.png)

      ![image-20210517152841964](.\img\10.png)

      ![image-20210517152953707](.\img\11.png)

      

      ```
      //GET
      fetch('http://localhost:3000/customers/')
        .then(function(response) {
          return response.json()
        }).then(function(json) {
          console.log('parsed json: ', json)
        }).catch(function(ex) {
          console.log('parsing failed: ', ex)
        });
      
      
      //POST
      fetch('http://localhost:3000/customers/', {
        method: 'post',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
             "id": 2, "first_name": "zhang", "last_name": "shuai",  "phone": "219-839-2819" 
         })
      }).then(function(response) {
            return response.json()
          }).then(function(json) {
            console.log('parsed json: ', json)
          }).catch(function(ex) {
            console.log('parsing failed: ', ex)
          });
          
          
      //PUT
      fetch('http://localhost:3000/customers/1', { //在url后面指定下id就好
        method: 'put',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
             "done": true
         })
      }).then(function(response) {
            return response.json()
          }).then(function(json) {
            console.log('parsed json: ', json)
          }).catch(function(ex) {
            console.log('parsing failed: ', ex)
          });
          
          
      //DELETE
      fetch('http://localhost:3000/customers/1', {
      method: 'delete'
      }).then(function(response) {
         return response.json()
       }).then(function(json) {
         console.log('parsed json: ', json)
       }).catch(function(ex) {
         console.log('parsing failed: ', ex)
       });
      ```

      

1. 理解跨域资源访问CORS，请给出例子，查看服务器返回的关于CORS头部信息

    - https://enable-cors.org/

    - https://enable-cors.org/resources.html

      ![image-20210517194844775](.\img\21.png)

1. 查看 https://httpie.org/doc#installation 命令行工具  http://httpbin.org/ 服务信息

    - 用 XHR 或 Fetch API 使用POST方法提交信息到 /post 查看返回的信息

      ![image-20210517162840186](.\img\16.png)

    - 访问 http://httpbin.org/headers 查看返回的信息

      ![image-20210517162906851](.\img\17.png)

    - 安装httpie https://httpie.org/doc#installation

      ![image-20210517163143103](.\img\18.png)

