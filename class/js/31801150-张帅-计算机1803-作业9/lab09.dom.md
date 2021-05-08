

# 2020-2021学年第2学期
# **实 验 报 告**
![zucc](../../zucc.png "ZUCC")

- 课程名称:跨平台脚本开发技术  
- 实验项目:DOM 
- 专业班级__计算机1803_                      
- 学生学号__31801150_
- 学生姓名__张帅_
- 实验指导教师:郭鸣

## 实验内容

1. 阅读 [十三、浏览器中的 JavaScript](http://sigcc.gitee.io/eloquent-js-3e-zh/#/13?id=十三、浏览器中的-javascript)相关内容 回答理解以下问题 
    - 13.2 请给出如下URL 各个部分的含义
        
        http://  :  HTTP协议
        
        10.66.27.234  :  获取文件的服务器地址      
        
        /lab/lab07.uc.fsm/#_2    :  想要获取的具体文件（或资源）的路径    
        
        name=desk  :  访问时带的参数
        
        - `http://10.66.27.234/lab/lab07.uc.fsm/#_2?name=desk`
        
          
        
    - 13.3 什么是 **[HTML 实体](https://www.w3school.com.cn/html/html_entities.asp)**，请举例，实体的作用是什么,如何用实体表示  **版权符号** copyright ， **人民币符号** 
    
        在 HTML 中，某些字符是预留的。
    
        在 HTML 中不能使用小于号（<）和大于号（>），这是因为浏览器会误认为它们是标签。
    
        如果希望正确地显示预留字符，我们必须在 HTML 源代码中使用字符实体（character entities)
    
        如需显示小于号，我们必须这样写：\&lt; 或 \&#60;
    
        使用实体名而不是数字的好处是，名称易于记忆。不过坏处是，浏览器也许并不支持所有实体名称（对实体数字的支持却很好）。
    
        | 显示结果 | 描述              | 实体名称          | 实体编号 |
        | :------- | :---------------- | :---------------- | :------- |
        |          | 空格              | &nbsp;            | &#160;   |
        | <        | 小于号            | &lt;              | &#60;    |
        | >        | 大于号            | &gt;              | &#62;    |
        | &        | 和号              | &amp;             | &#38;    |
        | "        | 引号              | &quot;            | &#34;    |
        | '        | 撇号              | &apos; (IE不支持) | &#39;    |
        | ￠       | 分（cent）        | &cent;            | &#162;   |
        | £        | 镑（pound）       | &pound;           | &#163;   |
        | ¥        | 元（yen）         | &yen;             | &#165;   |
        | €        | 欧元（euro）      | &euro;            | &#8364;  |
        | §        | 小节              | &sect;            | &#167;   |
        | ©        | 版权（copyright） | &copy;            | &#169;   |
        | ®        | 注册商标          | &reg;             | &#174;   |
        | ™        | 商标              | &trade;           | &#8482;  |
        | ×        | 乘号              | &times;           | &#215;   |
        | ÷        | 除号              | &divide;          | &#247;   |
    
    - 13.4 JavaScript 加载过程
    
        正常的网页加载流程如下:
    
        1. 浏览器一边下载HTML网页，一边开始解析网页
        2. 解析过程中，发现\<script>标签
           1. **暂停解析网页**，网页渲染的控制权**转交给JavaScript引擎**
           2. 如果script标签引用了外部脚本，就**下载**该脚本，否则就直接执行
        3. 执行完毕，**控制权交还渲染引擎**，恢复往下解析HTML网页
    
        加载外部脚本时，浏览器会**暂停**页面渲染，等待脚本下载并执行完成后，再继续渲染。
    
        **原因**是JavaScript可以**修改DOM**（比如使用`document.write`方法）。
    
        如果外部脚本加载时间很长（比如一直无法完成下载），就会造成网页长时间失去响应，浏览器就会呈现**“假死”**状态。
    
    
    
1. 阅读[十四、文档对象模型](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=十四、文档对象模型)相关内容 回答理解以下问题
   
    - 14.2 写出下面HTML代码的DOM tree
        
        - [code](code.html)
        
          ![c2fab493226102ef292542fc0c1502d](.\img\1.jpg)
        
    - 14.6  [修改文档](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=修改文档) 请编程将p175 p元素 `one two three` 复制一份 并逆次序排列。
    
        ```js
        <p>One</p>
        <p>Two</p>
        <p>Three</p>
        
        <script>
          let paragraphs = document.body.getElementsByTagName("p");
          let temp = [];
          for(let i = 0;i<paragraphs.length;i++){
            temp.push(paragraphs[i].cloneNode(true));
          }
        
         //document.body.insertBefore(paragraphs[2], paragraphs[0]);
         document.body.insertBefore(temp[0],paragraphs[0]);
         document.body.insertBefore(temp[1],paragraphs[0]);
         document.body.insertBefore(temp[2],paragraphs[0]);
        
        </script>
        ```
    
        ![image-20210508141650421](.\img\3.png)
    
    - 14.9 [布局](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=布局)请在浏览器查看元素的getBoundingClientRect()返回的对象，请说明其含义。
    
        `getBoundingClientRect`方法是获取屏幕中某个元素精确位置的最有效方法。该方法返回一个对象，包含`top`、`bottom`、`left`和`right`四个属性，表示元素相对于屏幕左上角的位置（单位是像素）。
    
        ![image-20210508141957447](.\img\4.png)
    
    - 14.9 14.10 [样式](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=样式)请说明 display:block display:inline的区别,display:none的作用
    
        `display`属性控制一个元素是否显示为块元素或内联元素。
    
        `block`标签会结束其所在的那一行，因为块元素是不会和周围文本内联显示的。
    
        `inline`标签会继续所在那行，和周围文本内联显示。
    
    - 14.13 请[位置与动画](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=位置与动画)明 CSS中 position: static,relative,absolute的区别，请调整定位方式的值，使图像分别显示在，屏幕正中，屏幕右下，屏幕左下。
    
        `position`样式属性是一种强大的布局方法。默认情况下，该属性值为`static`，表示元素处于文档中的默认位置。
    
        若该属性设置为`relative`，该元素在文档中依然占据空间，但此时其`top`和`left`样式属性则是相对于常规位置的偏移。
    
        若`position`设置为`absolute`，会将元素从默认文档流中移除，该元素将不再占据空间，而会与其他元素重叠。其`top`和`left`属性则是相对其最近的闭合元素的偏移，其中`position`属性的值不是`static`。如果没有任何闭合元素存在，则是相对于整个文档的偏移。
    
        ```
        <img src="../img/cat.png" style="position:absolute;left: 45%;top:43%">
        
        <script>
          
        </script>
        ```
    
        
    
        ![image-20210508162711496](.\img\17.png)
    
        ```
        <img src="../img/cat.png" style="position:absolute;">
        <script> 
        </script>
        ```
    
        ![image-20210508144446769](C:\Users\asus\Desktop\class\跨平台\作业9\img\8.png)
    
        ```
        <img src="../img/cat.png" style="position:absolute;right: 0;">
        <script> 
        </script>
        ```
    
        ![image-20210508143941776](.\img\5.png)
    
        ```
        <img src="../img/cat.png" style="position:absolute;right: 0;bottom: 0;">
        <script>
        </script>
        ```
    
        ![image-20210508144056306](.\img\6.png)
    
        ```
        <img src="../img/cat.png" style="position:absolute;left: 0;bottom: 0;">
        <script>
        </script>
        ```
    
        ![image-20210508144155482](.\img\7.png)
    
    - 14.13 [位置与动画](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=位置与动画)请运行p179的例子，修改代码，比较没有采用requestAminmationFrame()方法的运行结果，说明requestAminmationFrame的作用
    
        采用requestAminmationFrame():美观的动画
    
        ![image-20210508144556528](.\img\9.png)
    
        不采用requestAminmationFrame():禁止不动
    
        ![image-20210508144924343](.\img\10.png)
    
        使用`requestAnimationFrame`在每次浏览器准备重绘屏幕时调用`animate`函数。`animate`函数再次调用`requestAnimationFrame`以准备下一次更新。当浏览器窗口（或标签）激活时，更新频率大概为 60 次每秒，这种频率可以生成美观的动画。若我们只是在循环中更新 DOM，页面会静止不动，页面上也不会显示任何东西。浏览器不会在执行 JavaScript 程序时刷新显示内容，也不允许页面上的任何交互。这就是我们需要`requestAnimationFrame`的原因，该函数用于告知浏览器 JavaScript 程序目前已经完成工作，因此浏览器可以继续执行其他任务，比如刷新屏幕，响应用户动作。我们将动画生成函数作为参数传递给`requestAnimationFrame`。为了确保每一毫秒猫的移动是稳定的，而且动画是圆滑的，它基于一个速度，角度以这个速度改变这一次与上一次函数运行的差。
    
        
    
    - 学习常用的[CSS 选择器参考手册](http://www.w3school.com.cn/cssref/css_selectors.asp)  
        - 按F12 进入 DevTools  进入 Elements 面板，选择 DOM tree 上的元素。参考上面的文档，理解 copy selector 的值
    
          copy selector的值：body > img
    
          copy selector选择是从根节点到该元素的路径
    
          ![image-20210508145055240](.\img\11.png)
    
        - 查看 copy outerHtml的值
    
           copy outerHtml的值：
    
          ```
          <img src="../img/cat.png" style="position: relative">
          ```
    
          
    
        - 用document.querySelector() 定位页面的 p 元素 查看该 元素的  textContent  innerHtml outerHtml属性的值
    
          ![image-20210508145534537](.\img\12.png)
    
          ```
          document.querySelector("p").outerHTML;
          "<p style=\"text-align: center\">\n  <img src=\"../img/cat.png\" style=\"position: relative\">\n</p>"
          
          document.querySelector("p").textContent;
          "\n  \n"
          
          document.querySelector("p").innerHTML;
          "\n  <img src=\"../img/cat.png\" style=\"position: relative\">\n"
          ```
    
          
    
1. 完成 [习题](http://sigcc.gitee.io/eloquent-js-3e-zh/#/14?id=习题) 14.15 1 2 3 题

    第一题：

    ```js
    <h1>Mountains</h1>
    <div id="mountains"></div>
    <script>
      const MOUNTAINS = [
        {name: "Kilimanjaro", height: 5895, place: "Tanzania"},
        {name: "Everest", height: 8848, place: "Nepal"},
        {name: "Mount Fuji", height: 3776, place: "Japan"},
        {name: "Vaalserberg", height: 323, place: "Netherlands"},
        {name: "Denali", height: 6168, place: "United States"},
        {name: "Popocatepetl", height: 5465, place: "Mexico"},
        {name: "Mont Blanc", height: 4808, place: "Italy/France"}
      ];
      let tab = document.createElement("table");
      let text = document.createElement("tr");
      let name = document.createElement("th");
      name.innerHTML = "name";
      let height = document.createElement("th");
      height.innerHTML = "height";
      let place = document.createElement("th");
      place.innerHTML = "place";
      text.appendChild(name);
      text.appendChild(height);
      text.appendChild(place);
      tab.appendChild(text);
      for(let i=0;i<MOUNTAINS.length;i++){
        let text = document.createElement("tr");
        let name = document.createElement("td");
        name.innerHTML = MOUNTAINS[i].name;
        let height = document.createElement("td");
        height.innerHTML = MOUNTAINS[i].height;
        let place = document.createElement("td");
        place.innerHTML = MOUNTAINS[i].place;
        text.appendChild(name);
        text.appendChild(height);
        text.appendChild(place);
        tab.appendChild(text);
      }
      tab.style.textAlign="right";
      document.getElementById("mountains").appendChild(tab);
    </script>
    ```

    ![image-20210508152154693](.\img\13.png)

    第二题：

    ![image-20210508160644269](.\img\14.png)

    ```
    
    <h1>Heading with a <span>span</span> element.</h1>
    <p>A paragraph with <span>one</span>, <span>two</span>
      spans.</p>
    
    <script>
      
      function byTagName(node, tagName) {
        
        let re = [];
        if( node.tagName === tagName.toUpperCase() )
        {
            re.push(node);
        }
    
        for(let i=0;i<node.childNodes.length;i++){
    
        
            let rep =  byTagName(node.childNodes[i],tagName);
            for(let j=0;j<rep.length;j++){
            re.push(rep[j])
     
        }
      }
        
    
        return re;
       
      
    }
    
      console.log(byTagName(document.body, "h1").length);
      // → 1
      console.log(byTagName(document.body, "span").length);
      // → 3
      let para = document.querySelector("p");
      console.log(byTagName(para, "span").length);
      // → 2
    </script>
    ```

    

    第三题:

    ```js
    
    <style>body { min-height: 200px }</style>
    <img src="../img/cat.png" id="cat" style="position: absolute;margin-top: 200px;margin-left: 200px;">
    <img src="../img/hat.png" id="hat" style="position: absolute;margin-top: 200px;margin-left: 200px;">
    
    <script>
      let cat = document.querySelector("#cat");
      let hat = document.querySelector("#hat");
    
      let angle = 0;
      let lastTime = null;
      function animate(time) {
        if (lastTime != null) angle += (time - lastTime) * 0.001;
        lastTime = time;
        cat.style.top = (Math.sin(angle) * 40 + 40) + "px";
        cat.style.left = (Math.cos(angle) * 200 + 230) + "px";
    
     
        // Your extensions here.
    
        hat.style.top = (Math.sin(angle) * 150 + 60) + "px";
        hat.style.left = (Math.cos(angle) * 290 + 230) + "px";
    
    
    
        requestAnimationFrame(animate);
      }
     requestAnimationFrame(animate);
    </script>
    ```

    

    ![image-20210508162000541](.\img\15.png)

    ![image-20210508162037393](.\img\16.png)

1. 阅读[浏览器工作原理详解](http://www.html5rocks.com/zh/tutorials/internals/howbrowserswork/)

    

1. （选）学习[vdom](http://sigcc.gitee.io/xplatform/#/09/09.vdom)自己实现一个Vdom算法

    

1. （选 ）请准备一个Javascript 技术的小专题

 