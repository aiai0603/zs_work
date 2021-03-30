# [2020-2021学年第2学期](https://sigcc.gitee.io/xplatform/#/lab/03/lab03.object.array?id=_2020-2021学年第2学期)

# [**实 验 报 告**](https://sigcc.gitee.io/xplatform/#/lab/03/lab03.object.array?id=实-验-报-告)

![zucc](https://sigcc.gitee.io/xplatform/zucc.png)

- 课程名称:跨平台脚本开发技术
- 实验项目:对象与数组
- 专业班级 计算机1803
- 学生学号 31801150
- 学生姓名 张帅
- 实验指导教师:郭鸣

## [实验内容](https://sigcc.gitee.io/xplatform/#/lab/03/lab03.object.array?id=实验内容)

1. 教材p55 [习题](http://sigcc.gitee.io/eloquent-js-3e-zh/#/4?id=习题) 1,2

   习题1：

   ```js
   let arr=(start,end)=>{
       let re=[];
       for(let i=start;i<=end;i++){
           re.push(i);
       }
       return re;
   }
   
   console.log(arr(1,10))
   ```

   

   ![image-20210322134714518](\img\1.png)

   ```js
   let arr=(start,end)=>{
       let re=[];
       for(let i=start;i<=end;i++){
           re.push(i);
       }
       return re;
   }
   
   let sum=(arr)=>{
       let re=0;
       for(i=0;i<arr.length;i++){      
           re+=arr[i];
       }
       return re;
   }
   
   console.log(sum(arr(1,10)))
   ```

   ![image-20210322135135346](\img\2.png)

   附加任务：

   ```js
   let arr=(start,end,step)=>{
       let re=[];
       if(step==undefined)
       step=1;
   
       if(step<0)
       {
           for(let i=start;i>=end;i+=step){
               re.push(i);
           }
       }else{
           for(let i=start;i<=end;i+=step){
               re.push(i);
           }
       }
       
       return re;
   }
   
   let sum=(arr)=>{
       let re=0;
       for(i=0;i<arr.length;i++){      
           re+=arr[i];
       }
       return re;
   }
   
   
   ```

   

   ![](\img\3.png)

   ![image-20210322140144030](\img\4.png)

   习题2：

   ```js
   let reverseArray=(a)=>{
       let re=[];
       for(let i=a.length-1;i>=0;i--){
      
           re.push(a[i]);
       }
       return re;
   }
   
   
   
   let reverseArrayInplace=(a)=>{
       
       for(let i=a.length-1;i>=a.length/2;i--){
           let temp=a[i];
           a[i]=a[a.length-i-1];
           a[a.length-1-i]=temp;
       }
       
   }
   ```

   

   ![image-20210322142838305](\img\5.png)

   ![image-20210322142918659](\img\6.png)

   前者有更多的使用环境，前者是纯函数，不改变已经存在的各种变量，后者会改变已经定义的变量，对于需要保留原有数组的情况不适用。

   后者运行速度更快，后者需要进行循环的次数更少。

2. 阅读[Yet Another Scheme Tutorial中译版](http://deathking.github.io/yast-cn/) [SketchyLisp](http://bb.zucc.edu.cn/bbcswebdav/xid-509589_1) [SICP](http://bb.zucc.edu.cn/bbcswebdav/xid-509589_1)

   - 可下载[Racket](http://bb.zucc.edu.cn/bbcswebdav/xid-509589_1) 或 [BiwaScheme](https://www.biwascheme.org/doc/getting_started.html)

   - 理解 `Scheme`中表`(List)` 的概念

   - 完成教材p55,[习题](http://sigcc.gitee.io/eloquent-js-3e-zh/#/4?id=习题) 3

     ```js
     let arrToList=(a)=>{
         let list=null;
         let nowlist=null;
         for(let i=0;i<a.length;i++){
             if(i===0){
                 list={
                     value:a[i],
                     rest:null
                 }
                 nowlist=list
             }else{
                 nowlist.rest={
                     value:a[i],
                     rest:null
                 }
                 nowlist=nowlist.rest
             }
     
         }
         return list;
     }
     
     
     let re=arrToList([1,2,3,4])
     console.log(re)
     ```

     ![image-20210322144759838](\img\7.png)

     ```js
     let listToArr=(list)=>{
         let a=[]
         let l=list
         while(l!=null){
             a.push(l.value)
             l=l.rest
         }
         return a;
     }
     let list={
         value:1,
         rest:{
             value:2,
             rest:{
                 value:3,
                 rest:null
             }
         }
     }
     console.log(listToArr(list))
     ```

     

     ![image-20210322145454569](\img\8.png)

     ```js
     let prepend=(list,v)=>{
       
        return re={
            value:v,
            rest:list
        }
        
     }
     let list={
         value:1,
         rest:{
             value:2,
             rest:{
                 value:3,
                 rest:null
             }
         }
     }
     list = prepend(list,4)
     console.log(list)
     
     ```

     

     ![image-20210322145952487](\img\9.png)

     ```js
     let index=0
     let nth=(list,v)=>{
       if(list==null)
         return undefined;
       if(v!=list.value)
       {
           index++;
           return nth(list.rest,v)
       }else{
           return index
       }
     
        
     }
     let list={
         value:1,
         rest:{
             value:2,
             rest:{
                 value:3,
                 rest:null
             }
         }
     }
     index=0
     console.log(nth(list,200))
     ```

     ![image-20210322150436942](\img\10.png)

     ![image-20210322150504590](\img\11.png)

3. 理解比较**对象引用**与比较**对象内容**的区别，完成教材p55 [习题](http://sigcc.gitee.io/eloquent-js-3e-zh/#/4?id=习题) 4

   ```js
   let deepEqual=(a,b)=>{
      
         if(a===null||b===null){
           return a===b;
         }
         
      
         if(typeof(a) !== typeof(b)){
           return false;
         }
   
       
        
         if(typeof(a) == "object"){
       
           let  propsA = Object.getOwnPropertyNames(a),
             propsB = Object.getOwnPropertyNames(b);
           if(propsA.length != propsB.length){
             return false;
           }
           for(var i=0;i<propsA.length;i++){
             var propName=propsA[i];
          
             if(a[propName] !== b[propName]){
               return false;
             }
           }
           return true;
         }else if(typeof(a) == "array"){
           return a.toString()==b.toString()
         }else{
             return a===b;
         }
      
   
   }
   let a={
       t1:12,
       t2:"1212"
   
   }
   let b={
       t1:12,
       t2:"1212"
   
   }
   let c={}
   console.log(deepEqual(1,1))
   console.log(deepEqual("12121212",12121212))
   console.log(deepEqual(a,b))
   console.log(deepEqual("null",null))
   console.log(deepEqual([1,2,3],[1,2,3]))
   console.log(deepEqual(null,c))
   ```

   

   ![image-20210322153213515](\img\12.png)

4. 阅读第4章[松鼠人的记录](http://sigcc.gitee.io/eloquent-js-3e-zh/#/4?id=松鼠人的记录)，理解[代码](https://eloquentjavascript.net/code/#4)，编程实现如下功能

   - 统计所有的`Events`中 每类的总数，并总数排序。

     ```js
     var JOURNAL = [
       {"events":["carrot","exercise","weekend"],"squirrel":false},
       {"events":["bread","pudding","brushed teeth","weekend","touched tree"],"squirrel":false},
       {"events":["carrot","nachos","brushed teeth","cycling","weekend"],"squirrel":false},
       {"events":["brussel sprouts","ice cream","brushed teeth","computer","weekend"],"squirrel":false},
       {"events":["potatoes","candy","brushed teeth","exercise","weekend","dentist"],"squirrel":false},
       {"events":["brussel sprouts","pudding","brushed teeth","running","weekend"],"squirrel":false},
       {"events":["pizza","brushed teeth","computer","work","touched tree"],"squirrel":false},
       {"events":["bread","beer","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["cauliflower","brushed teeth","work"],"squirrel":false},
       {"events":["pizza","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["lasagna","nachos","brushed teeth","work"],"squirrel":false},
       {"events":["brushed teeth","weekend","touched tree"],"squirrel":false},
       {"events":["lettuce","brushed teeth","television","weekend"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","work"],"squirrel":false},
       {"events":["brushed teeth","computer","work"],"squirrel":false},
       {"events":["lettuce","nachos","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","brushed teeth","running","work"],"squirrel":false},
       {"events":["brushed teeth","work"],"squirrel":false},
       {"events":["cauliflower","reading","weekend"],"squirrel":false},
       {"events":["bread","brushed teeth","weekend"],"squirrel":false},
       {"events":["lasagna","brushed teeth","exercise","work"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","reading","work"],"squirrel":false},
       {"events":["carrot","ice cream","brushed teeth","television","work"],"squirrel":false},
       {"events":["spaghetti","nachos","work"],"squirrel":false},
       {"events":["cauliflower","ice cream","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["spaghetti","peanuts","computer","weekend"],"squirrel":true},
       {"events":["potatoes","ice cream","brushed teeth","computer","weekend"],"squirrel":false},
       {"events":["potatoes","ice cream","brushed teeth","work"],"squirrel":false},
       {"events":["peanuts","brushed teeth","running","work"],"squirrel":false},
       {"events":["potatoes","exercise","work"],"squirrel":false},
       {"events":["pizza","ice cream","computer","work"],"squirrel":false},
       {"events":["lasagna","ice cream","work"],"squirrel":false},
       {"events":["cauliflower","candy","reading","weekend"],"squirrel":false},
       {"events":["lasagna","nachos","brushed teeth","running","weekend"],"squirrel":false},
       {"events":["potatoes","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","work"],"squirrel":false},
       {"events":["pizza","beer","work","dentist"],"squirrel":false},
       {"events":["lasagna","pudding","cycling","work"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","reading","work"],"squirrel":false},
       {"events":["spaghetti","pudding","television","weekend"],"squirrel":false},
       {"events":["bread","brushed teeth","exercise","weekend"],"squirrel":false},
       {"events":["lasagna","peanuts","work"],"squirrel":true},
       {"events":["pizza","work"],"squirrel":false},
       {"events":["potatoes","exercise","work"],"squirrel":false},
       {"events":["brushed teeth","exercise","work"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","television","work"],"squirrel":false},
       {"events":["pizza","cycling","weekend"],"squirrel":false},
       {"events":["carrot","brushed teeth","weekend"],"squirrel":false},
       {"events":["carrot","beer","brushed teeth","work"],"squirrel":false},
       {"events":["pizza","peanuts","candy","work"],"squirrel":true},
       {"events":["carrot","peanuts","brushed teeth","reading","work"],"squirrel":false},
       {"events":["potatoes","peanuts","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","nachos","brushed teeth","exercise","work"],"squirrel":false},
       {"events":["pizza","peanuts","brushed teeth","television","weekend"],"squirrel":false},
       {"events":["lasagna","brushed teeth","cycling","weekend"],"squirrel":false},
       {"events":["cauliflower","peanuts","brushed teeth","computer","work","touched tree"],"squirrel":false},
       {"events":["lettuce","brushed teeth","television","work"],"squirrel":false},
       {"events":["potatoes","brushed teeth","computer","work"],"squirrel":false},
       {"events":["bread","candy","work"],"squirrel":false},
       {"events":["potatoes","nachos","work"],"squirrel":false},
       {"events":["carrot","pudding","brushed teeth","weekend"],"squirrel":false},
       {"events":["carrot","brushed teeth","exercise","weekend","touched tree"],"squirrel":false},
       {"events":["brussel sprouts","running","work"],"squirrel":false},
       {"events":["brushed teeth","work"],"squirrel":false},
       {"events":["lettuce","brushed teeth","running","work"],"squirrel":false},
       {"events":["candy","brushed teeth","work"],"squirrel":false},
       {"events":["brussel sprouts","brushed teeth","computer","work"],"squirrel":false},
       {"events":["bread","brushed teeth","weekend"],"squirrel":false},
       {"events":["cauliflower","brushed teeth","weekend"],"squirrel":false},
       {"events":["spaghetti","candy","television","work","touched tree"],"squirrel":false},
       {"events":["carrot","pudding","brushed teeth","work"],"squirrel":false},
       {"events":["lettuce","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","ice cream","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["pizza","brushed teeth","work"],"squirrel":false},
       {"events":["spaghetti","peanuts","exercise","weekend"],"squirrel":true},
       {"events":["bread","beer","computer","weekend","touched tree"],"squirrel":false},
       {"events":["brushed teeth","running","work"],"squirrel":false},
       {"events":["lettuce","peanuts","brushed teeth","work","touched tree"],"squirrel":false},
       {"events":["lasagna","brushed teeth","television","work"],"squirrel":false},
       {"events":["cauliflower","brushed teeth","running","work"],"squirrel":false},
       {"events":["carrot","brushed teeth","running","work"],"squirrel":false},
       {"events":["carrot","reading","weekend"],"squirrel":false},
       {"events":["carrot","peanuts","reading","weekend"],"squirrel":true},
       {"events":["potatoes","brushed teeth","running","work"],"squirrel":false},
       {"events":["lasagna","ice cream","work","touched tree"],"squirrel":false},
       {"events":["cauliflower","peanuts","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["pizza","brushed teeth","running","work"],"squirrel":false},
       {"events":["lettuce","brushed teeth","work"],"squirrel":false},
       {"events":["bread","brushed teeth","television","weekend"],"squirrel":false},
       {"events":["cauliflower","peanuts","brushed teeth","weekend"],"squirrel":false}
     ];
     
     function countEvents(journal) {
       let events = [];
       
       for (let entry of journal) {
         for (let event of entry.events) {
            let f=0;
            for(let e of events){
              if(event===e.name){
                 e.sum++;
                 f=1;
                 break;
              }
            }
            if(f===0){
             events.push({name:event,sum:1})
            }
            
         }
       }
     
       return events;
     }
     
     console.log(countEvents(JOURNAL))
     ```

     

     ![image-20210322160118325](\img\13.png)

   - 吃了`pizza` 但是没有变成 松鼠 的 当天做了哪些事情 `Events`

     ```js
     var JOURNAL = [
       {"events":["carrot","exercise","weekend"],"squirrel":false},
       {"events":["bread","pudding","brushed teeth","weekend","touched tree"],"squirrel":false},
       {"events":["carrot","nachos","brushed teeth","cycling","weekend"],"squirrel":false},
       {"events":["brussel sprouts","ice cream","brushed teeth","computer","weekend"],"squirrel":false},
       {"events":["potatoes","candy","brushed teeth","exercise","weekend","dentist"],"squirrel":false},
       {"events":["brussel sprouts","pudding","brushed teeth","running","weekend"],"squirrel":false},
       {"events":["pizza","brushed teeth","computer","work","touched tree"],"squirrel":false},
       {"events":["bread","beer","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["cauliflower","brushed teeth","work"],"squirrel":false},
       {"events":["pizza","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["lasagna","nachos","brushed teeth","work"],"squirrel":false},
       {"events":["brushed teeth","weekend","touched tree"],"squirrel":false},
       {"events":["lettuce","brushed teeth","television","weekend"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","work"],"squirrel":false},
       {"events":["brushed teeth","computer","work"],"squirrel":false},
       {"events":["lettuce","nachos","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","brushed teeth","running","work"],"squirrel":false},
       {"events":["brushed teeth","work"],"squirrel":false},
       {"events":["cauliflower","reading","weekend"],"squirrel":false},
       {"events":["bread","brushed teeth","weekend"],"squirrel":false},
       {"events":["lasagna","brushed teeth","exercise","work"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","reading","work"],"squirrel":false},
       {"events":["carrot","ice cream","brushed teeth","television","work"],"squirrel":false},
       {"events":["spaghetti","nachos","work"],"squirrel":false},
       {"events":["cauliflower","ice cream","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["spaghetti","peanuts","computer","weekend"],"squirrel":true},
       {"events":["potatoes","ice cream","brushed teeth","computer","weekend"],"squirrel":false},
       {"events":["potatoes","ice cream","brushed teeth","work"],"squirrel":false},
       {"events":["peanuts","brushed teeth","running","work"],"squirrel":false},
       {"events":["potatoes","exercise","work"],"squirrel":false},
       {"events":["pizza","ice cream","computer","work"],"squirrel":false},
       {"events":["lasagna","ice cream","work"],"squirrel":false},
       {"events":["cauliflower","candy","reading","weekend"],"squirrel":false},
       {"events":["lasagna","nachos","brushed teeth","running","weekend"],"squirrel":false},
       {"events":["potatoes","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","work"],"squirrel":false},
       {"events":["pizza","beer","work","dentist"],"squirrel":false},
       {"events":["lasagna","pudding","cycling","work"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","reading","work"],"squirrel":false},
       {"events":["spaghetti","pudding","television","weekend"],"squirrel":false},
       {"events":["bread","brushed teeth","exercise","weekend"],"squirrel":false},
       {"events":["lasagna","peanuts","work"],"squirrel":true},
       {"events":["pizza","work"],"squirrel":false},
       {"events":["potatoes","exercise","work"],"squirrel":false},
       {"events":["brushed teeth","exercise","work"],"squirrel":false},
       {"events":["spaghetti","brushed teeth","television","work"],"squirrel":false},
       {"events":["pizza","cycling","weekend"],"squirrel":false},
       {"events":["carrot","brushed teeth","weekend"],"squirrel":false},
       {"events":["carrot","beer","brushed teeth","work"],"squirrel":false},
       {"events":["pizza","peanuts","candy","work"],"squirrel":true},
       {"events":["carrot","peanuts","brushed teeth","reading","work"],"squirrel":false},
       {"events":["potatoes","peanuts","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","nachos","brushed teeth","exercise","work"],"squirrel":false},
       {"events":["pizza","peanuts","brushed teeth","television","weekend"],"squirrel":false},
       {"events":["lasagna","brushed teeth","cycling","weekend"],"squirrel":false},
       {"events":["cauliflower","peanuts","brushed teeth","computer","work","touched tree"],"squirrel":false},
       {"events":["lettuce","brushed teeth","television","work"],"squirrel":false},
       {"events":["potatoes","brushed teeth","computer","work"],"squirrel":false},
       {"events":["bread","candy","work"],"squirrel":false},
       {"events":["potatoes","nachos","work"],"squirrel":false},
       {"events":["carrot","pudding","brushed teeth","weekend"],"squirrel":false},
       {"events":["carrot","brushed teeth","exercise","weekend","touched tree"],"squirrel":false},
       {"events":["brussel sprouts","running","work"],"squirrel":false},
       {"events":["brushed teeth","work"],"squirrel":false},
       {"events":["lettuce","brushed teeth","running","work"],"squirrel":false},
       {"events":["candy","brushed teeth","work"],"squirrel":false},
       {"events":["brussel sprouts","brushed teeth","computer","work"],"squirrel":false},
       {"events":["bread","brushed teeth","weekend"],"squirrel":false},
       {"events":["cauliflower","brushed teeth","weekend"],"squirrel":false},
       {"events":["spaghetti","candy","television","work","touched tree"],"squirrel":false},
       {"events":["carrot","pudding","brushed teeth","work"],"squirrel":false},
       {"events":["lettuce","brushed teeth","work"],"squirrel":false},
       {"events":["carrot","ice cream","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["pizza","brushed teeth","work"],"squirrel":false},
       {"events":["spaghetti","peanuts","exercise","weekend"],"squirrel":true},
       {"events":["bread","beer","computer","weekend","touched tree"],"squirrel":false},
       {"events":["brushed teeth","running","work"],"squirrel":false},
       {"events":["lettuce","peanuts","brushed teeth","work","touched tree"],"squirrel":false},
       {"events":["lasagna","brushed teeth","television","work"],"squirrel":false},
       {"events":["cauliflower","brushed teeth","running","work"],"squirrel":false},
       {"events":["carrot","brushed teeth","running","work"],"squirrel":false},
       {"events":["carrot","reading","weekend"],"squirrel":false},
       {"events":["carrot","peanuts","reading","weekend"],"squirrel":true},
       {"events":["potatoes","brushed teeth","running","work"],"squirrel":false},
       {"events":["lasagna","ice cream","work","touched tree"],"squirrel":false},
       {"events":["cauliflower","peanuts","brushed teeth","cycling","work"],"squirrel":false},
       {"events":["pizza","brushed teeth","running","work"],"squirrel":false},
       {"events":["lettuce","brushed teeth","work"],"squirrel":false},
       {"events":["bread","brushed teeth","television","weekend"],"squirrel":false},
       {"events":["cauliflower","peanuts","brushed teeth","weekend"],"squirrel":false}
     ];
     
     Array.prototype.remove = function(val) {
       var index = this.indexOf(val);
       if (index > -1) {
       this.splice(index, 1);
       }
     };
     
     function findEvents(journal) {
       let events = [];
       
         for (let entry of journal) {
         {
             if((entry.events).includes("pizza")&&entry.squirrel===false){
           
               let temp=entry.events;
               temp.remove("pizza")
               events.push(temp);
             }
         
         }
     
       
       }
       return events;
     
     }
     let re=findEvents(JOURNAL)
     console.log(re)
     
     ```

     

     ![image-20210322161852661](\img\14.png)

   - 编写函数，遍历所有`Events` 根据统计 返回如下对象


```js
{
squirrelTrue: 
    { events1:number, events1:number... },
squirrelFalse:
     { events1:number, events1:number... }
}
```

```js
let journal = [];
var JOURNAL = [
  {"events":["carrot","exercise","weekend"],"squirrel":false},
  {"events":["bread","pudding","brushed teeth","weekend","touched tree"],"squirrel":false},
  {"events":["carrot","nachos","brushed teeth","cycling","weekend"],"squirrel":false},
  {"events":["brussel sprouts","ice cream","brushed teeth","computer","weekend"],"squirrel":false},
  {"events":["potatoes","candy","brushed teeth","exercise","weekend","dentist"],"squirrel":false},
  {"events":["brussel sprouts","pudding","brushed teeth","running","weekend"],"squirrel":false},
  {"events":["pizza","brushed teeth","computer","work","touched tree"],"squirrel":false},
  {"events":["bread","beer","brushed teeth","cycling","work"],"squirrel":false},
  {"events":["cauliflower","brushed teeth","work"],"squirrel":false},
  {"events":["pizza","brushed teeth","cycling","work"],"squirrel":false},
  {"events":["lasagna","nachos","brushed teeth","work"],"squirrel":false},
  {"events":["brushed teeth","weekend","touched tree"],"squirrel":false},
  {"events":["lettuce","brushed teeth","television","weekend"],"squirrel":false},
  {"events":["spaghetti","brushed teeth","work"],"squirrel":false},
  {"events":["brushed teeth","computer","work"],"squirrel":false},
  {"events":["lettuce","nachos","brushed teeth","work"],"squirrel":false},
  {"events":["carrot","brushed teeth","running","work"],"squirrel":false},
  {"events":["brushed teeth","work"],"squirrel":false},
  {"events":["cauliflower","reading","weekend"],"squirrel":false},
  {"events":["bread","brushed teeth","weekend"],"squirrel":false},
  {"events":["lasagna","brushed teeth","exercise","work"],"squirrel":false},
  {"events":["spaghetti","brushed teeth","reading","work"],"squirrel":false},
  {"events":["carrot","ice cream","brushed teeth","television","work"],"squirrel":false},
  {"events":["spaghetti","nachos","work"],"squirrel":false},
  {"events":["cauliflower","ice cream","brushed teeth","cycling","work"],"squirrel":false},
  {"events":["spaghetti","peanuts","computer","weekend"],"squirrel":true},
  {"events":["potatoes","ice cream","brushed teeth","computer","weekend"],"squirrel":false},
  {"events":["potatoes","ice cream","brushed teeth","work"],"squirrel":false},
  {"events":["peanuts","brushed teeth","running","work"],"squirrel":false},
  {"events":["potatoes","exercise","work"],"squirrel":false},
  {"events":["pizza","ice cream","computer","work"],"squirrel":false},
  {"events":["lasagna","ice cream","work"],"squirrel":false},
  {"events":["cauliflower","candy","reading","weekend"],"squirrel":false},
  {"events":["lasagna","nachos","brushed teeth","running","weekend"],"squirrel":false},
  {"events":["potatoes","brushed teeth","work"],"squirrel":false},
  {"events":["carrot","work"],"squirrel":false},
  {"events":["pizza","beer","work","dentist"],"squirrel":false},
  {"events":["lasagna","pudding","cycling","work"],"squirrel":false},
  {"events":["spaghetti","brushed teeth","reading","work"],"squirrel":false},
  {"events":["spaghetti","pudding","television","weekend"],"squirrel":false},
  {"events":["bread","brushed teeth","exercise","weekend"],"squirrel":false},
  {"events":["lasagna","peanuts","work"],"squirrel":true},
  {"events":["pizza","work"],"squirrel":false},
  {"events":["potatoes","exercise","work"],"squirrel":false},
  {"events":["brushed teeth","exercise","work"],"squirrel":false},
  {"events":["spaghetti","brushed teeth","television","work"],"squirrel":false},
  {"events":["pizza","cycling","weekend"],"squirrel":false},
  {"events":["carrot","brushed teeth","weekend"],"squirrel":false},
  {"events":["carrot","beer","brushed teeth","work"],"squirrel":false},
  {"events":["pizza","peanuts","candy","work"],"squirrel":true},
  {"events":["carrot","peanuts","brushed teeth","reading","work"],"squirrel":false},
  {"events":["potatoes","peanuts","brushed teeth","work"],"squirrel":false},
  {"events":["carrot","nachos","brushed teeth","exercise","work"],"squirrel":false},
  {"events":["pizza","peanuts","brushed teeth","television","weekend"],"squirrel":false},
  {"events":["lasagna","brushed teeth","cycling","weekend"],"squirrel":false},
  {"events":["cauliflower","peanuts","brushed teeth","computer","work","touched tree"],"squirrel":false},
  {"events":["lettuce","brushed teeth","television","work"],"squirrel":false},
  {"events":["potatoes","brushed teeth","computer","work"],"squirrel":false},
  {"events":["bread","candy","work"],"squirrel":false},
  {"events":["potatoes","nachos","work"],"squirrel":false},
  {"events":["carrot","pudding","brushed teeth","weekend"],"squirrel":false},
  {"events":["carrot","brushed teeth","exercise","weekend","touched tree"],"squirrel":false},
  {"events":["brussel sprouts","running","work"],"squirrel":false},
  {"events":["brushed teeth","work"],"squirrel":false},
  {"events":["lettuce","brushed teeth","running","work"],"squirrel":false},
  {"events":["candy","brushed teeth","work"],"squirrel":false},
  {"events":["brussel sprouts","brushed teeth","computer","work"],"squirrel":false},
  {"events":["bread","brushed teeth","weekend"],"squirrel":false},
  {"events":["cauliflower","brushed teeth","weekend"],"squirrel":false},
  {"events":["spaghetti","candy","television","work","touched tree"],"squirrel":false},
  {"events":["carrot","pudding","brushed teeth","work"],"squirrel":false},
  {"events":["lettuce","brushed teeth","work"],"squirrel":false},
  {"events":["carrot","ice cream","brushed teeth","cycling","work"],"squirrel":false},
  {"events":["pizza","brushed teeth","work"],"squirrel":false},
  {"events":["spaghetti","peanuts","exercise","weekend"],"squirrel":true},
  {"events":["bread","beer","computer","weekend","touched tree"],"squirrel":false},
  {"events":["brushed teeth","running","work"],"squirrel":false},
  {"events":["lettuce","peanuts","brushed teeth","work","touched tree"],"squirrel":false},
  {"events":["lasagna","brushed teeth","television","work"],"squirrel":false},
  {"events":["cauliflower","brushed teeth","running","work"],"squirrel":false},
  {"events":["carrot","brushed teeth","running","work"],"squirrel":false},
  {"events":["carrot","reading","weekend"],"squirrel":false},
  {"events":["carrot","peanuts","reading","weekend"],"squirrel":true},
  {"events":["potatoes","brushed teeth","running","work"],"squirrel":false},
  {"events":["lasagna","ice cream","work","touched tree"],"squirrel":false},
  {"events":["cauliflower","peanuts","brushed teeth","cycling","work"],"squirrel":false},
  {"events":["pizza","brushed teeth","running","work"],"squirrel":false},
  {"events":["lettuce","brushed teeth","work"],"squirrel":false},
  {"events":["bread","brushed teeth","television","weekend"],"squirrel":false},
  {"events":["cauliflower","peanuts","brushed teeth","weekend"],"squirrel":false}
];

function countEvents(journal) {
  let squirrelTrue = [];
  let squirrelFalse = [];
  
  for (let entry of journal) {
  
    if(entry.squirrel===false){
      for (let event of entry.events) {
        let f=0;
        squirrelFalse.forEach(function (o) {
          Object.keys(o).forEach(function (k) {
              if(k ===event ){
                o[k]++;
                f=1;
                
              }
          });
        });
        if(f===0){
          squirrelFalse.push({[event]:1})
        }
      }
    
    }else{
      for (let event of entry.events) {
        let f=0;
        squirrelTrue.forEach(function (o) {
          Object.keys(o).forEach(function (k) {
              if(k ===event ){
                o[k]++;
                f=1;
               
              }
          });
        });
        if(f===0){
        
          squirrelTrue.push({ [event] : 1})
        }
      }
     
    }
  }

  return {squirrelFalse,squirrelTrue};
}

let re=countEvents(JOURNAL)
console.log(re.toString())
```

![image-20210322185309268](\img\15.png)

1. 设计一个二叉搜索树的结构 `Tree {value:3 , left:Tree , right:Tree}` 给`Tree` 添加两个方法. `Tree#add( number)` 方法给树添加节点.`Tree#depth()`计算树的深度.

```js
//depth === 3 
{value:8 ,left:{value:6,left:null,
    right:{value:7,left:null,
        right:null}}
 right:null}  
```

![image-20210323102835027](\img\31.png)

```js
class Tree{
    value=null;
    left=null;
    right=null;

    add=(x)=>{
        if(this.value===null){
            this.value=x;
        }else{
            if(x<this.value){
                if(this.left===null){
                    this.left= new Tree();
                  
                }
                this.left.add(x)
            }else{
                if(this.right===null){
                    this.right= new Tree();
                   
                }
                this.right.add(x)
            }
        }
    }

    depth=()=>{
        if(this.value===null){
            return 0;
        }else{
            if(this.left===null&&this.right===null)
            {
                return 1;
            }else if(this.left===null){
                return this.right.depth()+1;
            }else if(this.right===null){
                return this.left.depth()+1
            }else{
                return (this.left.depth()+1)>(this.right.depth()+1)?  (this.left.depth()+1):(this.right.depth()+1)
            }
           
        }
    }

}


let mytree=new Tree();
mytree.add(3);
mytree.add(4);
mytree.add(5);
mytree.add(7);
mytree.add(1);

console.log(mytree)
console.log(mytree.depth());
```



1. 阅读[数据抽象](http://sigcc.gitee.io/slides-js/Functions.html#/6)这个小节，理解 对象与函数的结合使用

   - 函数`Seq` 返回的对象，封装了 `get/up/down` 等函数，请问这些闭包函数的环境是同一个吗？

     是同一个

   - 在`DevTools` 查看这些函数的环境

     ![image-20210322200916156](\img\16.png)

2. `Node` 中 在全局环境中 给出了 `os process path fs`等模块，请查看他们的属性

   ![image-20210322201428192](\img\17.png)

   ![image-20210322201522241](\img\18.png)

   ![image-20210322201557196](\img\19.png)

   ![image-20210322201625151](\img\20.png)

   

   - 写一个程序 列出 机器的 `cpu` 内存 当前路径 等信息，并保存到文件中

     ```js
     var os=require('os');
     
     var freemem=os.freemem()
     
     var tmpdir=os.tmpdir()
     
     var totalmem=os.totalmem()
     
     
     const fs = require("fs");
     
     fs.writeFile("./test1.txt", "空闲内存字节"+freemem+"    CPU路径"+tmpdir+"   总内存"+totalmem, error => {
       if (error) return console.log("写入文件失败,原因是" + error.message);
       console.log("写入成功");
     });
     
     
     ```

     

     ![image-20210322203233430](\img\21.png)

   - 文件名由参数 提供 `node prog.js filename.txt`

     ```js
     var options = process.argv.splice(2);
     var os=require('os');
     var freemem=os.freemem()
     var tmpdir=os.tmpdir()
     var totalmem=os.totalmem()
     
     
     const fs = require("fs");
     
     
     fs.writeFile(options.toString(), "空闲内存字节"+freemem+"    CPU路径"+tmpdir+"   总内存"+totalmem, error => {
       if (error) return console.log("写入文件失败,原因是" + error.message);
       console.log("写入成功");
     });
     
     ```

     ![image-20210322204130884](\img\22.png)

   - 到 devdocs.io 查看 `fs` 等模块读写文件 `process`访问命令行参数的方法

     ![image-20210322204346780](\img\23.png)

3. VS Code 使用示范

   - https://code.visualstudio.com/

   - VSC 插件

     - markdownlint
     - JavaScript Debugger
     - Prettier Code formatter
     - REST Client
     - VSCodeVim
     - code runner
     - Debugger for Chrome

   - Open folder 打开文件夹

   - Debug选项卡 `break`， `

   - step into`，`step out`，`add watch`

   - [VSCode launch.json中的各种替换变量的意思](https://blog.csdn.net/bat67/article/details/78302871)

   - 调试 `arrfun.js` 添加`watch`，查看 3个 `array` 对象中的 闭包函数及其环境 Scopes Chain

     ![image-20210322210400713](\img\24.png)

     ![image-20210322210429840](\img\25.png)

     ![image-20210322210457101](\img\26.png)

   - ```
     git clone --depth=1 https://gitee.com/sigcc/slides-js.git
     ```

     - 在VS Code 中调试理解代码工作原理
       
       ![image-20210322212507513](\img\27.png)
       
       ![image-20210322220054803](\img\29.png)
       
       ![image-20210322220148834](img\30.png)
       
       - OOP_files\lights.html
       - OOP_files\accountlight.html
       - OOP_files\buttonlight.html
       
     - 查看构造函数`TrafficLight`如何构造对象
     
        理解：首先获取红绿灯的图片的路径，并且初始化显示位置。之后获取不同交通灯亮灯的图片，初始化当前的显示值，定义  函数可以接受参数，用于显示对应的灯，使用show(0)函数初始化为红灯点亮，界面显示对应的图片，完成上述初始化之后，定义一个that对象，包含了调整红绿灯颜色的各种方法对象，使用**`Object.freeze()`** 方法可以冻结对象。一个被冻结的对象再也不能被修改，之后返回改对象，保证了只能调用其中的方法，不能对其本身进行改变，提升了安全性。
     
     - 界面如何显示红绿灯
     
     
      首先获得图片存放的位置，之后获得红黄绿三个灯的图片，之后使用document.body.append将图片放置在指定的位置并且设置其样式（长宽），初始化中将对应需要显示的图片透明度为1（显示），其余的透明度设置为0（透明）。从而调节不同红绿灯的显示。
     
     - `button` 如何与红绿灯交互
     
       同理，初始化一个Button对象，获得按钮的图片，之后再放置在指定的位置上，为其初始化一个that对象，绑定一个函数将指定的函数绑定至点击事件中，之后冻结对象并返回。在html中，将红绿灯的next函数绑定到点击事件中，使得点击按钮时，红绿灯跳转下一个颜色实现交互
     
     - `account` 如何与红绿灯交互
     
       ```js
       var Account = function (bal, yes, no) {
       	return {
       		balance: function () { console.log(bal);},
       		deposit: function (x) {bal = bal + x; yes();},
       		withdraw: function (x) {
       			if (bal < x) {no();}
       			else {bal = bal - x; yes();}
       			}
       		}
       	}
       ```
     
       通过一个函数Account，其接受三个参数，一个参数用于记录平衡点的数值，二三个参数则为函数（此处为亮起红灯和绿灯），之后基于**闭包**的特性，数据封装在内部，可以调用withdraw或者deposit函数传入参数x，之前传入的bal会和x进行一定的操作，满足一定的条件时执行对应的函数，达到切换红绿灯的效果

