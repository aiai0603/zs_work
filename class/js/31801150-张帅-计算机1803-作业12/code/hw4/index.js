const port = 3004; // 端口号
const http = require('http');
const url = require('url');
const fs = require('fs');
const path = require('path');
const mime = require('mime');


const STATIC_FOLDER = 'test'; // 默认读取public文件夹下的文件
const IS_OPEN_CACHE = false; // 是否开启缓存功能
const CACHE_TIME = 10;// 告诉浏览器多少时间内可以不用请求服务器，单位：秒





const server = http.createServer((req, res) => {
  let reqUrl = decodeURIComponent(req.url); // 中文解码
  const obj = url.parse(reqUrl); // 解析请求的url
  let pathname = obj.pathname; // 请求的路径
  // if (pathname === '/') {
  //   pathname = './index.html';
  // }
  const realPath = path.join(__dirname, STATIC_FOLDER, pathname); // 获取物理路径

  // 获取文件基本信息，包括大小，创建时间修改时间等信息
  fs.stat(realPath, (err, stats) => {
    let endFilePath = '', contentType = '';;
    if (err) {
      // 报错了或者请求的路径是文件夹，则返回404
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
      let ext = path.extname(realPath).slice(1); // 获取文件拓展名
      contentType = mime.getType(ext) || 'text/plain';
      // console.log(`ext: ${ext}, content-type: ${contentType}`);
      endFilePath = realPath;
      res.setHeader('content-type', contentType);
      if (!IS_OPEN_CACHE) {
        // 未开启缓存
        let raw = fs.createReadStream(endFilePath);
        res.writeHead(200, 'ok');
        raw.pipe(res);
      } else {
        // 获取文件最后修改时间，并把时间转换成世界时间字符串
        let lastModified = stats.mtime.toUTCString();
        const ifModifiedSince = 'if-modified-since';

        // 告诉浏览器在规定的什么时间内可以不用请求服务器，直接使用浏览器缓存
        let expires = new Date();
        expires.setTime(expires.getTime() + CACHE_TIME * 1000);
        res.setHeader("Expires", expires.toUTCString());
        res.setHeader('Cache-Control', 'max-age=' + CACHE_TIME);

        if (req.headers[ifModifiedSince] && lastModified === req.headers[ifModifiedSince]) {
          // 请求头里包含请求ifModifiedSince且文件没有修改，则返回304
          res.writeHead(304, 'Not Modified');
          res.end();
        } else {
          // 返回头Last-Modified为当前请求文件的最后修改时间
          res.setHeader('Last-Modified', lastModified);

          // 返回文件
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