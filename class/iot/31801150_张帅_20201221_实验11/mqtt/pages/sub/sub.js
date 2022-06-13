//index.js
//获取应用实例
const app = getApp()
var mqtt = require('../../utils/mqtt.js');

Page({
  data: {
    button_type:'primary',
    sub_text:'订阅',
    sub_state:false,
    topic:'ZUCCZS/msg',
    msg:''
  },
  TopicInput:function(e){
    this.setData({
     topic:e.detail.value
    })
  },
  //接收信息函数
  mqttsub: function() {
    var that=this;
    if(this.data.sub_state == true){
      app.globalData.client.unsubscribe(this.data.topic)
      that.setData({
        button_type:'primary',
        sub_text:'订阅',
        sub_state:false
      })
      return;
    }
    app.globalData.client.subscribe(this.data.topic);
    that.setData({
      button_type:'warn',
      sub_text:'取消订阅',
      sub_state:true
    })
    app.globalData.client.on('message', function(topic, payload) {
      that.setData({
        msg:payload+ '<br>' + that.data.msg 
      })
    })
    }
})

