//index.js
//获取应用实例
const app = getApp()
var mqtt = require('../../utils/mqtt.js');

Page({
  data: {
    topic:"ZUCCZS/msg",
    msg:"Hello,ZS"
  },
  //事件处理函数
  TopicInput:function(e){
    this.setData({
      topic:e.detail.value
    })
  },

  MsgInput:function(e){
   
    this.setData({
      msg:e.detail.value
    })
  },

  //发送mqtt
  sendmqtt: function() {
   
    app.globalData.client.publish(this.data.topic, this.data.msg );
    console.log("发送成功！");
    
    
  },
  
  

  
})
