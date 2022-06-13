const app = getApp()  //全局变量
var mqtt = require('../../utils/mqtt.js');  //引入mqttjs

Page({
  /**
   * 页面的初始数据
   */
  data: {
      address:"wxs://re0b1e3a.cn.emqx.cloud",  
      port:8084,
      path:"/mqtt",
      username:"zs",
      password:null,
      tips:''
  },


  AddressInput:function(e){
    this.setData({
      address:e.detail.value,
    })
  },

  PortInput:function(e){
    this.setData({
      port:e.detail.value,
    })
  },

  PathInput:function(e){
    this.setData({
      path:e.detail.value,
    })
  },


  NameInput:function(e){
    this.setData({
      username:e.detail.value,
    })
  },

  PswInput:function(e){
    this.setData({
      password:e.detail.value,
    })
  },

  connectmqtt: function() {
    const options = {
        connectTimeout: 4000, // 超时时间
        clientId: 'wx_' + parseInt(Math.random() * 100 + 800, 10),   
        port: this.data.port,  
        username: this.data.username,
        password: this.data.password,
        reconnect : false
    }
    
    let that = this;
  //ip的拼接
   var  ipAddress = this.data.address+this.data.path;
   //mqtt连接
   app.globalData.client = mqtt.connect(ipAddress, options)
    //连接失败
    app.globalData.client.on('error', (error) => {
        console.log('连接失败:', error)
        this.setData({
          tips:"连接失败"
        })
    })

     //连接成功
    app.globalData.client.on('connect', (e) => {
        console.log('成功连接服务器')
        this.setData({
          tips:"连接成功！"
        })
        //跳转
        wx.switchTab({
          url: '../sub/sub',
        })
    })
},

})