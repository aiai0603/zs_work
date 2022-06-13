const app = getApp()  //全局变量
var mqtt = require('../../utils/mqtt.js');  //引入mqttjs

Page({
  /**
   * 页面的初始数据
   */
  data: {
      address:"wx://47.100.136.15",  
      port:8083,
      path:"/mqtt",
      username:"admin",
      password:null,
    
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
    let that=this

    wx.request({
      url: 'http://localhost:8086/admin/login',
      data: {
          username: this.data.username ,
          password: this.data.password
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
          if(res.data.port=="200")
          {
            const options = {
              connectTimeout: 4000, // 超时时间
              clientId: 'wx_' + parseInt(Math.random() * 100 + 800, 10),   
              port: that.data.port,  
              username: that.data.username,
              password: that.data.password,
              reconnect : false
          }
          
      
        //ip的拼接
         var  ipAddress = that.data.address+that.data.path;
         //mqtt连接
         app.globalData.client = mqtt.connect(ipAddress, options)
          //连接失败
          app.globalData.client.on('error', (error) => {
            wx.showToast({  
              title: 'MQTT连接错误',  
              icon: 'none',
              duration: 2000  
          })  
              
          })
      
           //连接成功
          app.globalData.client.on('connect', (e) => {
            wx.showToast({  
              title: '登录成功',  
              icon: 'success',
              duration: 2000  
          })  
            wx.setStorageSync('name', that.data.username)
            wx.setStorageSync('id',res.data.data.id)
              //跳转
              wx.switchTab({
                url: '../receive/receive',
              })
          })
          }else{
            wx.showToast({  
              title: res.data.msg,
              icon: 'none',
              duration: 2000  
          })  
          }
      }
    })


   
},

})