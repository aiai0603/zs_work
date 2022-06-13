//index.js
//获取应用实例
const app = getApp()
var mqtt = require('../../utils/mqtt.js');

var rex = /^[0-9]+$/;//正则表达式

Page({
  data: {
   
      value:{
        valueR:null,
        valueG:null,
        valueB:null
      },
      topic:"CJP/LED"
    
    
   
  },

  TopicInput:function(e){
   
    this.setData({
     topic:e.detail.value
    })
  },

  RInput:function(e){
    if(!rex.test(e.detail.value)||e.detail.value<0||e.detail.value>255)
    this.setData({
      'value.valueR':null
    })
    else
    this.setData({
      'value.valueR':parseInt(e.detail.value)
    })
  },

  GInput:function(e){
    if(!rex.test(e.detail.value)||e.detail.value<0||e.detail.value>255)
    this.setData({
      'value.valueG':null
    })
    else
    this.setData({
      'value.valueG':parseInt(e.detail.value)
    })
  },

  BInput:function(e){
    if(!rex.test(e.detail.value)||e.detail.value<0||e.detail.value>255)
    this.setData({
      'value.valueB':null
    })
    else
    this.setData({
      'value.valueB':parseInt(e.detail.value)
    })
  },



  //发送mqtt
  sendmqtt: function() {
    var message= JSON.stringify(this.data.value);
    app.globalData.client.publish(this.data.topic, message );
    console.log("发送成功！");

  },

})
