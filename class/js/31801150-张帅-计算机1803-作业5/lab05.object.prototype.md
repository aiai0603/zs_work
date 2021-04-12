

# 2020-2021学年第2学期
# **实 验 报 告**
![zucc](./zucc.png "ZUCC")

- 课程名称:跨平台脚本开发技术  
- 实验项目:对象原型继承
- 专业班级__ 计算机1803_                      
- 学生学号_ 31801150__
- 学生姓名__ 张帅_
- 实验指导教师:郭鸣

## 实验内容

1. 阅读课本相关内容 回答理解以下问题 
    - 6.4 说明
      
      - 构造函数用法
      
      当任意一个普通函数用于创建一类对象时，它就被称作构造函数，或构造器。
      
      一个函数要作为一个真正意义上的构造函数，需要满足下列条件：
      
      - 1、 在函数内部对新对象（this）的属性进行设置，通常是添加属性和方法。
      - 2、 构造函数可以包含返回语句，但返回值必须是this，或者其它非对象类型的值。
      
      可以使用new表达式来调用构造函数
      
      ```js
      function C1(){
          var o = {
              p:'hello world'
          }
          return o;
      }
      var o1 = new C1();
      alert(o1.p); 
      ```
      
      
      
      - 构造函数的 `prototype`属性的作用
      
        ​        每一个函数都有一个prototype属性，该属性是一个指针，该指针指向了一个对象。Object.prototype指向Object构造函数的原型对象，该原型对象中的一些属性和方法是所有实例共享的，也就是全局的属性和方法。这个属性在我们使用js系统或者自己创建的对象的时候，会默认的加上。如果需要可以覆盖他。
      
        ![image-20210412134925246](.\img\1.png)
      
      
      
    - 6.3 6.6说明对象属性查找机制
    
      ​		首先会在对象本身查找有没有该属性,如果有直接返回 ;如果没有,此时就会在构造函数中查找通过this给对象添加的成员中有没有,如果有就直接返回 ;如果没有, 就回到对象的原型对象中去查找,如果有,就返回 ;如果没有, 就会到原型对象的原型对象中查找;如此 往复,如果最后也没有找到, 获取到的值就是: undefined
    
      ![image-20210412135109467](.\img\2.png)
    
      
    
    - 6.7 为什么需要 无原型对象，好处在哪里
      
      无原型对象生成的对象不会从Object.protoype派生，可以安全地用作映射，如toString等不会默认在对象中。
      
      - 理解 `Object.create` 方法的作用 
      
        Object.create(null) 创建的对象是一个空对象，在该对象上没有继承 Object.prototype 原型链上的属性或者方法,
      
        Object.create()方法接受两个参数:Object.create(obj,propertiesObject) ;
      
        obj:一个对象，是新创建的对象的原型。
      
        propertiesObject：可选。该参数对象是一组属性与值，该对象的属性名称将是新创建的对象的属性名称，值是属性描述符（这些属性描述符的结构与Object.defineProperties()的第二个参数一样）。该参数对象不能是 undefined，另外只有该对象中自身拥有的可枚举的属性才有效，也就是说该对象的原型链上属性是无效的。
      
        ![image-20210412135156761](.\img\3.png)
      
    - 6.9 理解符号Symbol，结合6.10 理解符号命名的方法
    
      `Symbol`表示独一无二的值，最大的用法是用来定义对象的唯一属性名，对于每一个`Symbol`的值都是不相等的，所以`Symbol`作为对象的属性名，可以保证属性不重名。该数据类型通常被用作一个对象属性的键值，例如当想使对象属性的键为私有值时。符号类型值可以通过调用函数`Symbol()`创建，这个函数动态地生成了一个匿名，唯一的值。`Symbol`类型唯一合理的用法是用变量存储`symbol`的值，然后使用存储的值创建对象属性。
    
      ```js
      let obj = {};
      let prop = Symbol();
      obj[prop] = 1;
      console.log(obj[prop]); 
      ```
    
      ![image-20210412135628326](.\img\4.png)
    
      
    
    - 6.10理解 [迭代器接口](http://sigcc.gitee.io/eloquent-js-3e-zh/#/6?id=迭代器接口)  的写法 next() 返回的对象有什么属性
    
      js提供给`for/of`循环的对象预计为可迭代对象（iterable）。 这意味着它有一个以`Symbol.iterator`符号命名的方法（由语言定义的符号值，存储为`Symbol`符号的一个属性）。
    
      当被调用时，该方法应该返回一个对象，它提供第二个接口迭代器（iterator）。 这是执行迭代的实际事物。 它拥有返回下一个结果的`next`方法。 这个结果应该是一个对象，如果有下一个值，`value`属性会提供它；没有更多结果时，`done`属性应该为`true`，否则为`false`。请注意，`next`，`value`和`done`属性名称是纯字符串，而不是符号。 只有`Symbol.iterator`是一个实际的符号，它可能被添加到不同的大量对象中。
    
      ```js
      let okIterator = "OK"[Symbol.iterator]();
      console.log(okIterator.next());
      console.log(okIterator.next());
      console.log(okIterator.next());
      ```
    
    ![image-20210412140741887](.\img\5.png)
    
    
    
    - 6.11 如何定义对象的 [读写器和静态](http://sigcc.gitee.io/eloquent-js-3e-zh/#/6?id=读写器和静态) getter setter
    
      接口通常主要由方法组成，但也可以持有非函数值的属性。这样的对象甚至不需要直接在实例中计算和存储这样的属性。 即使直接访问的属性也可能隐藏了方法调用。 这种方法称为读取器（getter），它们通过在方法名称前面编写`get`来定义。每当有人读取此对象的非函数值的属性时，就会调用相关的方法。 当使用写入器（setter）写入属性时，可以做类似的事情。
    
      ```js
      let o1 = {
        
          get size() {
            return 22;
          },
          set size(s) {
              this.c=  s+22; 
          }
      
        };
      console.log(o1.size);
      o1.size = 18
      console.log(o1.c)
      ```
    
      ![image-20210412142636603](.\img\6.png)
    
      类通过 static 关键字定义静态方法。不能在类的实例上调用静态方法，而应该通过类本身调用。这些通常是实用程序方法，例如创建或克隆对象的功能。
    
      ```js
      class Ob1  {
        static test() {
            return 12;
        }
      };
      let o1 = new Ob1();
      console.log(o1.test);
      console.log(Ob1.test())
      ```
    
      ![image-20210412143302152](.\img\7.png)
    
    - 6.11 如何用 class 实现[继承](http://sigcc.gitee.io/eloquent-js-3e-zh/#/6?id=继承) 代码中，下面 super 关键字的作用是什么
    
      JavaScript 的原型系统可以创建一个新类，就像旧类一样，但是它的一些属性有了新的定义。 新类派生自旧类的原型。在面向对象的编程术语中，这称为继承（inheritance）, 新类继承旧类的属性和行为。`extends`这个词用于表示，这个类不应该直接基于默认的`Object`原型，而应该基于其他类。 这被称为超类（superclass）。 派生类是子类（subclass）;
    
      构造器通过`super`关键字调用其超类的构造器, 某一个方法使用`super`前缀，是从超类的一组方法中调用特定的方法
    
      ```js
      class Matrix {
        constructor(width, height, element = (x, y) => undefined) {
          this.width = width;
          this.height = height;
          this.content = [];
          for (let y = 0; y < height; y++) {
            for (let x = 0; x < width; x++) {
              this.content[y * width + x] = element(x, y);
            }
          }
        }
        get(x, y) {
          return this.content[y * this.width + x];
        }
        set(x, y, value) {
          this.content[y * this.width + x] = value;
        }
      }
      
      class SymmetricMatrix extends Matrix {
        constructor(size, element = (x, y) => undefined) {
          super(size, size, (x, y) => {
            if (x < y) return element(y, x);
            else return element(x, y);
          });
        }
      
        set(x, y, value) {
          super.set(x, y, value);
          if (x != y) {
            super.set(y, x, value);
          }
        }
      }
      let matrix = new SymmetricMatrix(5, (x, y) => `${x},${y}`);
      console.log(matrix.get(2, 3));
      ```
      
    - 查看  SymmetricMatrix  Matrix  两个构造函数的prototype ，他们之间有什么关系吗
    

```js
class SymmetricMatrix extends Matrix {  //es6
    constructor(size, element = (x, y) => undefined) {
        super(size, size, (x, y) => {
            if (x < y) return element(y, x);
            else return element(x, y);
        });
    }
```

![image-20210412145029863](.\img\8.png)

![image-20210412145126243](.\img\9.png)

​							前者的prototype相同都是Matrix  。


2. 教材 p 83 页 [习题](http://sigcc.gitee.io/eloquent-js-3e-zh/#/6?id=习题) 1，2，3

   习题1：

   ```js
   class Vec{
       constructor(x,y){
           this.x = x;
           this.y = y;
       }
   
       get length(){
           return Math.sqrt((Math.pow(this.x,2)+Math.pow(this.y,2)))
       }
   
       plus(o1){
           return new Vec(this.x+o1.x,this.y+o1.y)
       }
   
       minus(o1){
           return new Vec(this.x-o1.x,this.y-o1.y)
       }
   }
   
   console.log(new Vec(1, 2).plus(new Vec(2, 3)));
   console.log(new Vec(1, 2).minus(new Vec(2, 3)));
   console.log(new Vec(3, 4).length);
   ```

   ![image-20210412145917354](.\img\10.png)

   习题2：

   ```js
   class Group {
       constructor(){
           this.data = []
       }
       static from(d){
           let newGroup = new Group();
           for(let value of d){
               newGroup.data.push(value)
           }
   
           return newGroup;
       }
   
       has(num){
          
           if(this.data.indexOf(num) !== -1){
               return true;
           }else{
               return false;
           }
       }
   
       add(num){
          
           if(this.data.indexOf(num) === -1){
               this.data.push(num)
           }
       }
   
       delete(num){
           let index = this.data.indexOf(num);
           if(index !== -1){
               this.data.splice(index,1)
           }
           
       }
   
   
   
     }
     let group = Group.from([10, 20]);
   
     console.log(group.has(10));
     // → true
     console.log(group.has(30));
     // → false
     group.add(10);
     group.delete(10);
   
     
     console.log(group.has(10));
   
   ```

   ![image-20210412154345073](.\img\11.png)

习题3:

```js
class Group {
    constructor(){
        this.data = []
    }
    static from(d){
        let newGroup = new Group();
        for(let value of d){
            newGroup.data.push(value)
        }

        return newGroup;
    }

    has(num){
       
        if(this.data.indexOf(num) !== -1){
            return true;
        }else{
            return false;
        }
    }

    add(num){
       
        if(this.data.indexOf(num) === -1){
            this.data.push(num)
        }
    }

    delete(num){
        let index = this.data.indexOf(num);
        if(index !== -1){
            this.data.splice(index,1)
        }
        
    }


    [Symbol.iterator]() {
            this.current = 0
            this.length = this.data.length
            return this;
    }
    next(){
    
        if (this.current < this.length)
            return {done:false,value:this.data[this.current++]};
        else 
            return {done:true};
        
    }


 
}


  for (let value of Group.from(["a", "b", "c"])) {
    console.log(value);
  }
```



![image-20210412161845395](.\img\12.png)

习题4：

```js
let map = {one: true, two: true, hasOwnProperty: true,
    hasOwnProperty(word){
       
            for (let key in this) {
                 if(key === word)
                 return true
            }
            return false
        
    }
};
// Fix this call
console.log(map.hasOwnProperty("one"));
// → true
```

![image-20210412164417932](.\img\13.png)


2. 学习es5 构造函数的原型继承的写法

   - 阅读本书[第二版代码](https://eloquentjavascript.net/2nd_edition/code/chapter/06_object.js)

   - `TextCell RTextCell` 之间关系是构造函数的原型继承，请理解下面语句的含义

```js
// 指定TextCell构造函数的this，然后调用父类TextCell构造函数
function RTextCell(text) {
  TextCell.call(this, text);  //es6  super()3377
}


// 将RTextCell 的原型指定为TextCell的原型
//RTextCell.prototype.__proto__ === TextCell.prototype
RTextCell.prototype =Object.create(TextCell.prototype);

// 将RTextCell 的原型的构造函数指定为RtextCell的构造函数
RTextCell.prototype.constructor = RTextCell; 
```
4. 继承是一种代码复用机制，除此之外 还有基于组合的代码复用

  - 阅读本书[第二版代码](https://eloquentjavascript.net/2nd_edition/code/chapter/06_object.js)  理解 UnderlinedCell  与 TextCell 之间的组合复用关系

  - 请说明面向对象设计中，对象组合与对象继承的不同。
    
    ​        类继承是在编译时静态定义的，且可直接应用，程序设计语言直接支持类继承。类继承可以较方便地改变被复用的实现。当一个子类重定义父类的部份实现时，它也能影响它所继承的操作。
    
    ​      类继承不足之处在于继承在编译时就定义了，所以没法在运行时辰改变从父类继承的实现。继承对子类暴露了其父类的实现细节，所以继承常被认为“损坏了封装性”。子类与父类存在着很强的依赖关系，父类实现中的任何变更必然会致使子类发生变更。如果继承上去的实现不适合处理新的问题，则父类必须重写或被其他更适合的类替换。这种依赖关系限制了灵活性并终究限制了复用
    
      性。一个可用的处理方法就是只继承抽象类，因为抽象类通常供给较少的实现。
    
    ​       对象组合是通过取得对其他对象的引用而在运行时辰动态定义的。组合要求对象遵守彼此的接口约定，进而要求更仔细地定义接口，而这些接口其实不妨碍你将一个对象和其他对象一起应用。对象只能通过接口拜访，只要类型一致，运行时还可以用一个对象来替换另一个对象；对象的实现是基于接口写的，所以实现上存在较少的依赖关系。
    
    ​     
    
    - 请说明何为 **优先**使用**对象组合**而非**继承**、自行网上查找。
    
      ​       对象组合对系统设计优先应用对象组合有助于你保持每个类被封装，并被会合在单个任务上。这样类和类继承层次会保持较小范围，并且不太可能增长为弗成控制的庞然大物。另一方面，基于对象组合的设计会有更多的对象(而有较少的类)，且系统的行为将依赖于对象间的关系而不是被定义在某个类中。

```js
  function UnderlinedCell(inner) {
    this.inner = inner;
  }
  ...
  
  let uc = new UnderlinedCell(new TextCell(name));
```



5. 参考上面代码，采用原型继承 写一个构造函数 `VectorMul` 采用原型继承习题1中`Vec`
  - 点乘 `dotMul(number,Vector) :: Number->Vector->Vector`  

  - 叉乘 `crossMul() :: Vector ->Vector->Vector`    

  - 用 `ramda` 库 写出`curry`化函数

    ```js
    var R = require('ramda');
    
    function Vec(x,y) {
        this.x = x;
        this.y = y;
      }
    Vec.prototype.length = function() {
        return Math.sqrt((Math.pow(this.x,2)+Math.pow(this.y,2)))
    };
    
    Vec.prototype.plus = function(o1) {
        return new Vec(this.x+o1.x,this.y+o1.y)
    }
    
    Vec.prototype.minus = function(o1) {
        return new Vec(this.x-o1.x,this.y-o1.y)
    }
     
    
    class VectorMul extends Vec{
        constructor(x,y){
            super(x,y)
        }
        
        dotMul = R.curry((number,vector)  => {
            this.x=vector.x*number;
            this.y=vector.y*number
            return this })
        
        
        crossMul = R.curry((vector,vector2)  => {
            this.x=vector.x*vector2.x;
            this.y=vector.y*vector2.y;
            return this })
           
    
    
    }
    
    
    
    let myvec = new VectorMul(1,2);
    console.log  (myvec.dotMul(3)(myvec)   )
    
    let myvec2 = new VectorMul(2,2)
    console.log  (myvec2.crossMul(myvec2)(myvec2) )
    ```
    
    
    
    ![image-20210412222524212](.\img\16.png)
6. 用`es6 class`语法实现上题中的原型继承，目前这是继承的普遍写法

     ```js
    var R = require('ramda');
    class Vec{
        constructor(x,y){
            this.x = x;
            this.y = y;
        }
        get length(){
            return Math.sqrt((Math.pow(this.x,2)+Math.pow(this.y,2)))
        }
        plus(o1){
            return new Vec(this.x+o1.x,this.y+o1.y)
        }
        minus(o1){
            return new Vec(this.x-o1.x,this.y-o1.y)
        }
    }
    
    class VectorMul extends Vec{
        constructor(x,y){
            super(x,y)
        } 
        dotMul = R.curry((number,vector)  => {
            this.x=vector.x*number;
            this.y=vector.y*number
            return this })
        crossMul = R.curry((vector,vector2)  => {
            this.x=vector.x*vector2.x;
            this.y=vector.y*vector2.y;
            return this })
    }
    let myvec = new VectorMul(1,2);
    console.log  (myvec.dotMul(3)(myvec)   )
    let myvec2 = new VectorMul(2,2)
    console.log  (myvec2.crossMul(myvec2)(myvec2) )
    
     ```

    ![image-20210412221444866](.\img\15.png)

7. 阅读代码 `object00.js---object05.js`  理解这些代码的演进关系
    - 理解`catMethod` 对象的含义、 它与 `Cat.prototype`的关系

      catMethod对象中定义了对象几个方法，调用了Object.create() 函数之后，CatMetods对象被绑定在了Cat的prototype 属性上，即Cat.prototype为CatMethods，在Cat的对象实例中，可以调用CatMethod中的方法。

      

    - 理解 **`class` 语法糖 Syntax sugar**的含义，它是如何封装 `this Object.create prototype` 

      ​        传统的javascript中只有对象，没有类的概念。它是基于原型的面向对象语言。原型对象特点就是将自身的属性共享给新对象，ES6引入了Class（类）这个概念，通过class关键字可以定义类。该关键字的出现使得其在对象写法上更加清晰，更像是一种面向对象的语言，类实质上就是一个函数，类自身指向的就是构造函数。

      ​        类的所有方法都定义在类的prototype属性上，constructor方法是类的构造函数的默认方法，通过new命令生成对象实例时，自动调用该方法，constructor中定义的属性可以称为实例属性，即定义在this对象上;constructor外声明的属性都是定义在原型上的，可以称为原型属性，即调用Object.create方法将所有的constructor外定义的方法组成的对象绑定到实例的prototype 属性上。

      

8. 掌握 `new` 关键字的本质，理解下面的代码，说明每行代码的**含义**，试试运行结果

    ![image-20210412190848088](.\img\14.png)

```js
function _new(/* constructor, param, ... */) {
    var args = [].slice.call(arguments);  //将参数转换为数组
    var constructor = args.shift();      //把参数数组的第一个元素从其中删除，并返回第一个元素的值作为构造器
    var context = Object.create(constructor.prototype);   //将该构造器的原型对象设置为构器引用的那个原型对象
    var result = constructor.apply(context, args);  //将参数数组中剩余的参数传入构造函数并运行
    return (typeof result === 'object' && result != null) ? result : context;   //判断返回值是不是对象，如果是对象则返回，否则返回其构造函数
}
let cat = _new(Cat,'mao', 'white')
```
9. 阅读文档[JavaScript 秘密花园](https://bonsaiden.github.io/JavaScript-Garden/zh/#object.prototype)理解原型继承

10.  [扩展阅读](http://www.cnblogs.com/feipeng/archive/2007/03/02/661840.html)
    [敏捷软件开发 ASD](https://book.douban.com/subject/2347790/)

    [ASD bb](https://bb.zucc.edu.cn/bbcswebdav/users/j04014/CSharp/lec-lab/lec-lab.03.%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1SOLID%E5%8E%9F%E5%88%99.zip)

> 面向对象设计总原则：
>     面向接口编程 Design to interfaces. 
>     优先使用对象组合而非继承 Favor composition over inheritance.
>     找到变化点，封装之 Find what varies and encapsulate it.
> 具体细则：
>     单一职责原则--SRP
>     开放封闭原则--OCP
>     Liskov替换原则--LSP
>     依赖倒置原则--DIP
>     接口隔离原则--ISP