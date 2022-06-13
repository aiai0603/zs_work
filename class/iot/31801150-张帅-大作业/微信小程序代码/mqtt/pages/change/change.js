// pages/change/change.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    menuTapCurrent:0,
    ename:"",
    equip:[
    
    ]
  },
  enameInput(e){
    this.setData({
     ename:e.detail.value,
    })
  },

  sumbit(){
    let that=this
    let id=wx.getStorageSync("id");
    wx.request({
      url: 'http://localhost:8086/manager/add',
      data: {
          uid:id,
          eid:that.data.ename,
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        wx.showToast({  
          title: res.data.msg,  
          icon: 'none',
          duration: 2000  
      })  
        wx.request({
          url: 'http://localhost:8086/equip/list',
          data: {
              id:id
          },
          header: {
            'content-type': 'application/json' // 默认值
          },
          success: function(res) {
            that.setData({
              equip:res.data.data
            })
          }
        })
      }
    })
  },
  unmanager(e){
    let that=this
    let id=wx.getStorageSync("id");
    wx.request({
      url: 'http://localhost:8086/manager/unmanager',
      data: {
          uid:id,
          eid:e.currentTarget.dataset.eid,
        
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        wx.request({
          url: 'http://localhost:8086/equip/list',
          data: {
              id:id
          },
          header: {
            'content-type': 'application/json' // 默认值
          },
          success: function(res) {
            that.setData({
              equip:res.data.data
            })
          }
        })
      }
    })
  },
  onLoad(){
    let that=this
    let id=wx.getStorageSync("id");
    wx.request({
      url: 'http://localhost:8086/equip/list',
      data: {
          id:id
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        that.setData({
          equip:res.data.data
        })
      }
    })
  },
  menuTap:function(e){
    var current=e.currentTarget.dataset.current;//获取到绑定的数据
    //改变menuTapCurrent的值为当前选中的menu所绑定的数据
    this.setData({
    menuTapCurrent:current
    });
     
     
    },
  
})