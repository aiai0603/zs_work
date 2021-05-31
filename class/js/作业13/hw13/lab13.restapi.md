

# 2020-2021学年第2学期
# **实 验 报 告**
![zucc](../../zucc.png "ZUCC")

- 课程名称:跨平台脚本开发技术  
- 实验项目:  REST API 设计
- 专业班级_ 计算机1803__                      
- 学生学号_31801150__
- 学生姓名__张帅_
- 实验指导教师:郭鸣

## 实验内容



## lecture

[REST API](http://sigcc.gitee.io/xplatform/#/14/rest.api)

[REST API Design](http://sigcc.gitee.io/xplatform/#/14/rest.api.design)

[HTTP API 设计指南](https://github.com/cocoajin/http-api-design-ZH_CN)




## 使用 restify 开发 REST API

- https://www.ibm.com/developerworks/cn/web/wa-lo-use-restify-develop-rest-api/index.html 

参考文章完成里面的程序

## 参考视频

- https://bb.zucc.edu.cn/bbcswebdav/users/j04014/JavaScript/video

参考视频完成里面的程序

Build A Restful Api With Node.js Express  MongoDB _ Rest Api Tutorial.mp4

 <h2> 代码详见code文件夹的demo</h2>



![image-20210531211138980](.\img\6.png)

![image-20210531211317493](.\img\7.png)

![image-20210531211427765](.\img\8.png)

![image-20210531211516734](.\img\9.png)

![image-20210531211541178](.\img\10.png)





## tools
https://www.getpostman.com/

![image-20210531160505439](.\img\5.png)

https://swagger.io/

![image-20210531160348936](C:\Users\asus\Desktop\class\跨平台\作业13\img\4.png)

## demo

https://github.com/gothinkster/realworld

api endpoints
https://github.com/gothinkster/realworld/tree/master/api

![image-20210531153325225](.\img\1.png)

- 请使用 Rest Client  工具 测试上面的 API 

  ![image-20210531155604507](.\img\2.png)

  ![image-20210531155821761](.\img\3.png)

- 思考命名规范，是否符合REST 思想

  符合REST思想：

  然后再来理解一个具体的RESTful架构——面向资源的架构（Resource-Oriented Architecture，ROA）：

  资源是由URI来指定。所谓「上网」，就是与互联网上一系列的「资源」互动，调用它的URI。
  对资源的操作包括获取、创建、修改和删除资源，这些操作正好对应HTTP协议提供的
  get(获取网络中某个地址的资源),
  post（创建资源也叫更新资源）,
  put（更新资源）,
  patch（更新网络资源）
  delete（删除网络资源）
  最常见的就是get和post请求
  通过操作资源的表现形式来操作资源。具体表现形式，应该在HTTP请求的头信息中用Accept和Content-Type字段指定。
  资源的表现形式则是XML或者HTML，取决于读者是机器还是人，是消费web服务的客户软件还是web浏览器。当然也可以是任何其他的格式。
  应用于Web服务，符合REST设计风格的Web API称为RESTful API。它从以下三个方面资源进行定义：

  直观简短的资源地址：URI，比如：http://example.com/resources/；每一个URI代表一种资源；
  传输的资源：Web服务接受与返回的互联网媒体类型，比如：JSON，XML，YAML等。
  对资源的操作：Web服务在该资源上所支持的一系列请求方法（比如：POST，GET，PUT或DELETE）。


## 大作业

请在大作业里面 实现REST API