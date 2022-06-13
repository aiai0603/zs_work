// pages/mine/mine.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let name=wx.getStorageSync("name");

      this.setData({
        name:name
      })
  },

  quit:function(){
    wx.clearStorage();
    wx.redirectTo({
      url: '../connect/connect',
    })
    
  }

  

})