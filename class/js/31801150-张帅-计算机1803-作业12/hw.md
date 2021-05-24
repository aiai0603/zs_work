# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/lab/12/lab12.nodejs?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/lab/12/lab12.nodejs?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:node
- 专业班级_ 计算机1803__
- 学生学号_31801150__
- 学生姓名__张帅_
- 实验指导教师:郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/lab/12/lab12.nodejs?id=实验内容)

1. 学习教材 node 部分内容

   - file_server.js 理解

   - https://eloquentjavascript.net/code/#20.3

     ```js
     const {createServer} = require("http");
     
     const methods = Object.create(null);
     
     //执行 HTTP 服务和产生 HTTP 请求的函数。在8080端口开启服务
     //每次客户端尝试连接服务器时，服务器都会调用传递给createServer函数的参数。request和response绑定都是对象，分别表示输入数据和输出数据。request包含请求信息，例如该对象的url属性表示请求的 URL。
     //你需要调用response对象的方法以将一些数据发回客户端。
     createServer((request, response) => {
       let handler = methods[request.method] || notAllowed;
       handler(request)
         .catch(error => {
           if (error.status != null) return error;
           return {body: String(error), status: 500};
         })
         .then(({body, status = 200, type = "text/plain"}) => {
            response.writeHead(status, {"Content-Type": type});
            if (body && body.pipe) body.pipe(response);
            else response.end(body);
         });
     }).listen(8000);
     //使用名为methods的对象来存储处理多种 HTTP 方法的函数。方法处理器是async函数，它接受请求对象作为参数并返回一个Promise，解析为描述响应的对象。
     async function notAllowed(request) {
       return {
         status: 405,
         body: `Method ${request.method} not allowed.`
       };
     }
     
     //为了弄清哪个文件路径对应于请求URL，urlPath函数使用 Node 的url内置模块来解析 URL。 它接受路径名，类似"/file.txt"，将其解码来去掉%20风格的转义代码，并相对于程序的工作目录来解析它。
     
     var {parse} = require("url");
     var {resolve, sep} = require("path");
     
     var baseDirectory = process.cwd();
     
     function urlPath(url) {
       let {pathname} = parse(url);
       let path = resolve(decodeURIComponent(pathname).slice(1));
       if (path != baseDirectory &&
           !path.startsWith(baseDirectory + sep)) {
         throw {status: 403, body: "Forbidden"};
       }
       return path;
     }
     
     //mime包（以text/plain这种方式表示的内容类型，名为 MIME 类型）可以获取大量文件扩展名的正确类型。
     //当请求文件不存在时，应该返回的正确 HTTP 状态码是 404。我们使用stat函数，来找出特定文件是否存在以及是否是一个目录。
     //因为stat访问磁盘需要耗费一些时间，因此该函数是异步的。由于我们使用Promise而不是回调风格，因此必须从fs/promises而不是fs导入。
     //当文件不存在时，stat会抛出一个错误对象，code属性为'ENOENT'。 这些有些模糊的，受 Unix 启发的代码，是你识别 Node 中的错误类型的方式。
     //由stat返回的stats对象告诉了我们文件的一系列信息，比如文件大小（size属性）和修改日期（mtime属性）。这里我们想知道的是，该文件是一个目录还是普通文件，isDirectory方法可以告诉我们答案。
     //我们使用readdir来读取目录中的文件列表，并将其返回给客户端。对于普通文件，我们使用createReadStream创建一个可读流，并将其传递给respond对象，同时使用mime模块根据文件名获取内容类型并传递给respond。
     
     const {createReadStream} = require("fs");
     const {stat, readdir} = require("fs").promises;
     const mime = require("mime");
     
     methods.GET = async function(request) {
       let path = urlPath(request.url);
       let stats;
       try {
         stats = await stat(path);
       } catch (error) {
         if (error.code != "ENOENT") throw error;
         else return {status: 404, body: "File not found"};
       }
       if (stats.isDirectory()) {
         return {body: (await readdir(path)).join("\n")};
       } else {
         return {body: createReadStream(path),
                 type: mime.getType(path)};
       }
     };
     
     //当 HTTP 响应不包含任何数据时，状态码 204（“No Content”，无内容）可用于表明这一点。 由于删除的响应不需要传输任何信息，除了操作是否成功之外，在这里返回是明智的。
     
     const {rmdir, unlink} = require("fs").promises;
     
     methods.DELETE = async function(request) {
       let path = urlPath(request.url);
       let stats;
       try {
         stats = await stat(path);
       } catch (error) {
         if (error.code != "ENOENT") throw error;
         else return {status: 204};
       }
       if (stats.isDirectory()) await rmdir(path);
       else await unlink(path);
       return {status: 204};
     };
     
     const {createWriteStream} = require("fs");
     
     function pipeStream(from, to) {
       return new Promise((resolve, reject) => {
         from.on("error", reject);
         to.on("error", reject);
         to.on("finish", resolve);
         from.pipe(to);
       });
     }
     
     //我们不需要检查文件是否存在，如果存在，只需覆盖即可。我们再次使用pipe来将可读流中的数据移动到可写流中，在本例中是将请求的数据移动到文件中。但是由于pipe没有为返回Promise而编写，所以我们必须编写包装器pipeStream，它从调用pipe的结果中创建一个Promise。
     //当打开文件createWriteStream时出现问题时仍然会返回一个流，但是这个流会触发'error'事件。 例如，如果网络出现故障，请求的输出流也可能失败。 所以我们连接两个流的'error'事件来拒绝Promise。 当pipe完成时，它会关闭输出流，从而导致触发'finish'事件。 这是我们可以成功解析Promise的地方（不返回任何内容）。
     
     methods.PUT = async function(request) {
       let path = urlPath(request.url);
       await pipeStream(request, createWriteStream(path));
       return {status: 204};
     };
     
     const {mkdir} = require("fs").promises;
     
     methods.MKCOL = async function(request) {
       let path = urlPath(request.url);
       let stats;
       try {
         stats = await stat(path);
       } catch (error) {
         if (error.code != "ENOENT") throw error;
         await mkdir(path);
         return {status: 204};
       }
       if (stats.isDirectory()) return {status: 204};
       else return {status: 400, body: "Not a directory"};
     };
     
     ```
     
     

2. 学习

   node web开发

   - 理解 node web服务器运行原理

   - Nodejs收到事件之后的大概的处理流程

     首先是若干个Request，
      请求到Node.js 应用上来；

     拿到请求之后，会生成请求对应的事件，
      插入到事件队列【LIBUV中 的 Event Queue】中去，
      【LIBUV】中的Event Loop会不断循环，
      读取【Event Queue】队头的事件进行处理；

     简单的事件则直接【Callback】，返回一个【Response】
      （如请求一个HTML简单页面的事件）；

     还有复杂一点的事件，
      可能需要调用数据库、做一些查询工作、做数据统计，
      最终展示页面，
      这个时候会从线程池【Thread Pool】取出一个线程【Thread】，
      执行对应的【Function】，最后【Callback】，返回一个【Response】；
      最后回收线程；

     以上两个步骤的【Callback】，
      如果是最终结果，自然是直接返回一个【Response】，
      如果只是中间结果，
      可能还需要再次生成事件，插入【Event Queue】，
      进行下一轮的事件处理

   - 用 chrome 查看 访问node web 服务器 浏览器发起的请求 和服务端的响应

     ![image-20210524140943046](.\img\image-20210524140943046.png)
     
     
     
     

3. 完成 p290 1 2 3

   作业1：

   ```js
   const {statSync, readdirSync, readFileSync} = require("fs");
   
   let searchTerm = new RegExp(process.argv[2]);
   
   
   for (let arg of process.argv.slice(3)) {
    
     search(arg);
   }
   
   
   function search(file) {
     let stats = statSync(file);
     if (stats.isDirectory()) {
       for (let f of readdirSync(file)) {
         search(file + "/" + f);
       }
     } else if (searchTerm.test(readFileSync(file, "utf8"))) {
       console.log(file);
     }
    
   }
   
   ```

   ![image-20210524145220128](.\img\2.png)

   

   作业2：

   ```js
   const {createServer} = require("http");
   
   const methods = Object.create(null);
   
   createServer((request, response) => {
     let handler = methods[request.method] || notAllowed;
     handler(request)
       .catch(error => {
         if (error.status != null) return error;
         return {body: String(error), status: 500};
       })
       .then(({body, status = 200, type = "text/plain"}) => {
          response.writeHead(status, {"Content-Type": type});
          if (body && body.pipe) body.pipe(response);
          else response.end(body);
       });
   }).listen(8000);
   
   async function notAllowed(request) {
     return {
       status: 405,
       body: `Method ${request.method} not allowed.`
     };
   }
   
   var {parse} = require("url");
   var {resolve, sep} = require("path");
   
   var baseDirectory = process.cwd();
   
   function urlPath(url) {
     let {pathname} = parse(url);
     let path = resolve(decodeURIComponent(pathname).slice(1));
     if (path != baseDirectory &&
         !path.startsWith(baseDirectory + sep)) {
       throw {status: 403, body: "Forbidden"};
     }
     return path;
   }
   
   const {createReadStream} = require("fs");
   const {stat, readdir} = require("fs").promises;
   const mime = require("mime");
   
   methods.GET = async function(request) {
     let path = urlPath(request.url);
     let stats;
     try {
       stats = await stat(path);
     } catch (error) {
       if (error.code != "ENOENT") throw error;
       else return {status: 404, body: "File not found"};
     }
     if (stats.isDirectory()) {
       return {body: (await readdir(path)).join("\n")};
     } else {
       return {body: createReadStream(path),
               type: mime.getType(path)};
     }
   };
   
   const {rmdir, unlink} = require("fs").promises;
   
   methods.DELETE = async function(request) {
     let path = urlPath(request.url);
     let stats;
     try {
       stats = await stat(path);
     } catch (error) {
       if (error.code != "ENOENT") throw error;
       else return {status: 204};
     }
     if (stats.isDirectory()) await rmdir(path);
     else await unlink(path);
     return {status: 204};
   };
   
   const {createWriteStream} = require("fs");
   
   function pipeStream(from, to) {
     return new Promise((resolve, reject) => {
       from.on("error", reject);
       to.on("error", reject);
       to.on("finish", resolve);
       from.pipe(to);
     });
   }
   
   methods.PUT = async function(request) {
     let path = urlPath(request.url);
     await pipeStream(request, createWriteStream(path));
     return {status: 204};
   };
   
   const {mkdir} = require("fs").promises;
   
   methods.MKCOL = async function(request) {
     let path = urlPath(request.url);
     let stats;
     try {
       stats = await stat(path);
     } catch (error) {
       if (error.code != "ENOENT") throw error;
       await mkdir(path);
       return {status: 204};
     }
     if (stats.isDirectory()) return {status: 204};
     else return {status: 400, body: "Not a directory"};
   };
   
   ```

   ![image-20210524145527359](.\img\3.png)

   

   作业3：

   ```js
   function request(options, callback) {
     var req = new XMLHttpRequest();
     req.open(options.method || "GET", options.pathname, true);
     req.addEventListener("load", function() {
       if (req.status < 400)
         callback(null, req.responseText);
       else
         callback(new Error("Request failed: " + req.statusText));
     });
     req.addEventListener("error", function() {
       callback(new Error("Network error"));
     });
     req.send(options.body || null);
   }
   
   
   var filelist = document.querySelector("#filelist");
   var textarea = document.querySelector("#file");
   
   
   request({pathname: "../"}, function(error, files) {
     
     if (error) throw error;
   
     files.split("\n").forEach(function(file) {
       var option = document.createElement("option");
       option.textContent = file;
       filelist.appendChild(option);
     });
     
     loadCurrentFile();
   });
   
   
   function loadCurrentFile() {
     request({pathname: filelist.value}, function(error, file) {
       if (error) throw error;
       textarea.value = file;
     });
   }
   
   filelist.addEventListener("change", loadCurrentFile);
   
   function saveFile() {
     request({pathname: filelist.value,
              method: "PUT",
              body: textarea.value}, function(error) {
       if (error) throw error;
     });
   }
   
   ```

   

   ![image-20210524194554859](.\img\6.png)

   - 将文件服务器改为 可以上传，下载文件。

     ```js
     const url = require('url');
     const fs = require('fs');
     const path = require('path');
     const mime = require('mime');
     const STATIC_FOLDER = 'test'; 
     const IS_OPEN_CACHE = false;
     const CACHE_TIME = 10;
     const server = http.createServer((req, res) => {
       let reqUrl = decodeURIComponent(req.url); 
       const obj = url.parse(reqUrl); 
       let pathname = obj.pathname; 
       const realPath = path.join(__dirname, STATIC_FOLDER, pathname); 
       fs.stat(realPath, (err, stats) => {
         let endFilePath = '', contentType = '';;
         if (err) {
           res.writeHead(404, 'not found', {
             'Content-Type': 'text/plain'
           });
           res.write(`the request ${pathname} is not found`);
           res.end();
         } else if (stats.isDirectory()) {
           fs.readdir(realPath, {
             encoding: 'utf8'
           }, (err, files) => {
             res.statusCode = 200;
             res.setHeader('content-type', 'text/html');
             let result = '';
             for (let i = 0; i < files.length; i++) {
               if (pathname === '/') {
                 pathname = '';
               }
               result += `<a href="${pathname}/${files[i]}">${files[i]}</a><br/>`;
             }
             let html = `
               <!doctype html>
               <html>
                 <head>
                   <meta charset='utf-8'/>
                 </head>
                 <body>
                   ${result}
                 </body>
               </html>`;
             res.end(html);
           });
         } else {
           let ext = path.extname(realPath).slice(1); 
           contentType = mime.getType(ext) || 'text/plain';
           endFilePath = realPath;
           res.setHeader('content-type', contentType);
           if (!IS_OPEN_CACHE) {
             let raw = fs.createReadStream(endFilePath);
             res.writeHead(200, 'ok');
             raw.pipe(res);
           } else {
             let lastModified = stats.mtime.toUTCString();
             const ifModifiedSince = 'if-modified-since';
             let expires = new Date();
             expires.setTime(expires.getTime() + CACHE_TIME * 1000);
             res.setHeader("Expires", expires.toUTCString());
             res.setHeader('Cache-Control', 'max-age=' + CACHE_TIME);
     
             if (req.headers[ifModifiedSince] && lastModified === req.headers[ifModifiedSince]) {
               res.writeHead(304, 'Not Modified');
               res.end();
             } else {
               res.setHeader('Last-Modified', lastModified);
               let raw = fs.createReadStream(endFilePath, {
                 encoding: 'utf-8'
               });
               res.writeHead(200, 'ok');
               raw.pipe(res);
             }
           }
         }
       });
     });
     server.listen(port);
     console.log(`server is running at http://localhost:${port}`);
     ```
     
     
     
      ![image-20210524204115345](.\img\7.png)
     
     ![image-20210524204145673](.\img\8.png)
     
     

4. 文件服务器实现 (选做,单独提交)

   - 可以采用页面模版 https://github.com/pugjs/pug
   - 或者用 yoyo https://github.com/maxogden/yo-yo
   - 参考 [fs-explorer](https://github.com/shama/fs-explorer),此项目尚未完成WIP。

5. 用[browserify](https://www.jianshu.com/p/8d8b8752d8a0) 试试 课件里面的`ascii-art`例子.理解将nodejs模块 web化的好处。

   ![image-20210524164538320](.\img\5.png)

6. ```
   npm install learnyounode -g
   ```

   - 运行 `learnyounode`,完成其中的代码

     ![image-20210524164258518](.\img\4.png)

7. （选）在你的大作业里面的程序中公共部分构造为npm module

   - 采用npm 发布,管理这些模块