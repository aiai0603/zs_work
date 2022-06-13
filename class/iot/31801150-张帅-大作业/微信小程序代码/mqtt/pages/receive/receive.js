//index.js
//获取应用实例
const app = getApp()
var mqtt = require('../../utils/mqtt.js');


import * as echarts from '../../echarts-for-weixin-master/ec-canvas/echarts';
var  chart1 = null;
var  chart2 = null;


function initChart(canvas, width, height, dpr) {
   chart1 = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // new
  });
  canvas.setChart(chart1);

  var option = {
    backgroundColor: "#ffffff",
    color: ["#37A2DA", "#32C5E9", "#67E0E3"],
    series: [{
      radius: 70,
      min:-10,
      max:70,
      splitNumber: 8,   
      type: 'gauge',
      detail: {
        formatter: '{value}℃',
        offsetCenter : [0, '70%'],
        textStyle: {
        
          fontSize: 20,
       
      }
      },
      axisLine: {
        show: true,
        lineStyle: {
          width: 12,
          shadowBlur: 0,
          color: [
            [0.1, '#0081ff'],
            [0.9, '#39b54a'],
            [1, '#e54d42']
          ]
        }
      },
      pointer: {
      
        show: true,
        width: 4,
    },
    axisTick: {
      show: true,
  },
   //分隔线样式。
   splitLine: {
    length:20,
},
  //刻度标签。
  axisLabel: {
     
      show: true,
      textStyle: {
        
        fontSize: 10,
     
    }
  },
 
      data: [{
        value: 0,
      
      }]

    }]
  };

  chart1.setOption(option, true);

  return chart1;
}




function initChart2(canvas, width, height, dpr) {
  chart2 = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // new
  });
  canvas.setChart(chart2);

  var option = {
    backgroundColor: "#ffffff",
    color: ["#37A2DA", "#32C5E9", "#67E0E3"],
    series: [{
      radius: 70,
      
    
      type: 'gauge',
      detail: {
        formatter: '{value}%',
        offsetCenter : [0, '70%'],
        textStyle: {
        
          fontSize: 20,
       
      }
      },
      axisLine: {
        show: true,
        lineStyle: {
          width: 12,
          shadowBlur: 0,
          color: [
            [0.1, '#0081ff'],
            [0.9, '#39b54a'],
            [1, '#e54d42']
          ]
        }
      },
      pointer: {
      
        show: true,
        width: 4,
    },
    axisTick: {
      show: true,
  },
   //分隔线样式。
   splitLine: {
    length:20,
},
  //刻度标签。
  axisLabel: {
      show: true,
      textStyle: {
        
        fontSize: 10,
     
    }
  },
 
      data: [{
        value: 0,
      
      }]

    }]
  };

  chart2.setOption(option, true);

  return chart2;
}







Page({
  data: {
    menuTapCurrent:0,
    ec: {
      onInit: initChart // 3、将数据放入到里面
    },

    ec2: {
      onInit: initChart2 // 3、将数据放入到里面
    },


    warning:[],
    time:"",
    humidity:0,
    temperature:0,
    date:null,
    equip:[
     
    ]
  },

  echartInit (e) {
    initChart(e.detail.canvas, e.detail.width, e.detail.height);
  },

  changeSwitch(){

    let that = this;
    let flag;
    if(that.data.equip[that.data.menuTapCurrent].deleteflag==0)
    flag=1;
    else
    flag=0;


   
    wx.request({
      url: 'http://localhost:8086/equip/check',
      data: {
          id:that.data.equip[that.data.menuTapCurrent].id,
          check:flag
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        let topic="ZUCC-ZS/check/"+that.data.equip[that.data.menuTapCurrent].ename
        app.globalData.client.publish(topic ,String(flag) );
        that.getdata();

      }
    })
  },

  menuTap:function(e){
    let that=this;
    let topic="ZUCC-ZS/WX/"+that.data.equip[that.data.menuTapCurrent].ename;
    app.globalData.client.unsubscribe(topic);
    var current=e.currentTarget.dataset.current;//获取到绑定的数据
    //改变menuTapCurrent的值为当前选中的menu所绑定的数据
    this.setData({
      menuTapCurrent:current
    });
   
    wx.request({
      url: 'http://localhost:8086/warning/list',
      data: {
          eid:that.data.equip[that.data.menuTapCurrent].id
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        that.setData({
          warning:res.data.data
        })

        for(var i=0;i<that.data.warning.length;i++){
          let timetemp=that.time(that.data.warning[i].sendTime);
         
          that.setData({
            [`warning[${i}].sendTime`]:timetemp
          })


          that.setData({
            temperature:0,
            humidity:0,
          
         })
        }

        that.getdata()
      }
    })
  
     
     
    },
    history(e){
      wx.navigateTo({
        url: '../history/history?id='+ e.currentTarget.dataset.id,
      })
     ;

    },

    deal(e){
      let that = this;
      wx.request({
        url: 'http://localhost:8086/warning/deal',
        data: {
            id:e.currentTarget.dataset.id,
        },
        header: {
          'content-type': 'application/json' // 默认值
        },
        success: function(res) {
          that.getdata();
  
        }
      })
    },

    getdata(){

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

          wx.request({
            url: 'http://localhost:8086/warning/list',
            data: {
                eid:that.data.equip[that.data.menuTapCurrent].id
            },
            header: {
              'content-type': 'application/json' // 默认值
            },
            success: function(res) {
              let temp;
              temp=res.data.data;
            
              if(temp!=null){
              for(var i=0;i<temp.length;i++){
                temp[i].sendTime=that.time(temp[i].sendTime)
              }
            }

            that.setData({
              warning:temp
             
            })

            that.initSocket();
          }
          })
        }
      })
    },
  onLoad: function() {
  
   
    this.getdata();
   
    
  },

  time(timestamp) {
    var time = new Date(timestamp);
    var y = time.getFullYear();
    var m = (time.getMonth() + 1) < 10 ? "0" + (time.getMonth() + 1) : (time.getMonth() + 1);//获取当前月份的日期，不足10补0
    var d = time.getDate() < 10 ? "0" + time.getDate() : time.getDate();//获取当前几号，不足10补0s
    return y + "/" + m + "/" + d + " " + time.toTimeString().substr(0, 5);
},


settchart(){
  let that = this
    

  var option = {
    backgroundColor: "#ffffff",
    color: ["#37A2DA", "#32C5E9", "#67E0E3"],
    series: [{
      radius: 70,
      min:-10,
      max:70,
      splitNumber: 8,   
      type: 'gauge',
      detail: {
        formatter: '{value}℃',
        offsetCenter : [0, '70%'],
        textStyle: {
        
          fontSize: 20,
       
      }
      },
      axisLine: {
        show: true,
        lineStyle: {
          width: 12,
          shadowBlur: 0,
          color: [
            [(that.data.equip[that.data.menuTapCurrent].lowert+10)/80, '#0081ff'],
            [(that.data.equip[that.data.menuTapCurrent].hight+10)/80, '#39b54a'],
            [1, '#e54d42']
          ]
        }
      },
      pointer: {
      
        show: true,
        width: 4,
    },
    axisTick: {
      show: true,
  },
   //分隔线样式。
   splitLine: {
    length:20,
},
  //刻度标签。
  axisLabel: {
     
      show: true,
      textStyle: {
        
        fontSize: 10,
     
    }
  },
 
      data: [{
        value: that.data.temperature,
      
      }]

    }]
  };



  var option2 = {
    backgroundColor: "#ffffff",
    color: ["#37A2DA", "#32C5E9", "#67E0E3"],
    series: [{
      radius: 70,
      
    
      type: 'gauge',
      detail: {
        formatter: '{value}%',
        offsetCenter : [0, '70%'],
        textStyle: {
        
          fontSize: 20,
       
      }
      },
      axisLine: {
        show: true,
        lineStyle: {
          width: 12,
          shadowBlur: 0,
          color: [
            [that.data.equip[that.data.menuTapCurrent].lowerh/100, '#0081ff'],
            [that.data.equip[that.data.menuTapCurrent].highh/100, '#39b54a'],
            [1, '#e54d42']
          ]
        }
      },
      pointer: {
      
        show: true,
        width: 4,
    },
    axisTick: {
      show: true,
  },
   //分隔线样式。
   splitLine: {
    length:20,
},
  //刻度标签。
  axisLabel: {
      show: true,
      textStyle: {
        
        fontSize: 10,
     
    }
  },
 
      data: [{
        value: that.data.humidity,
      
      }]

    }]
  };

  chart2.setOption(option2, true);
  chart1.setOption(option, true);

},


  onShareAppMessage: function (res) {
    return {
      title: 'ECharts',
      path: '/pages/index/index',
      success: function () { },
      fail: function () { }
    }
  },
  //接收信息函数
  initSocket: function() {
  
   
    let that=this;
    that.settchart()
  
    let topic="ZUCC-ZS/WX/"+that.data.equip[that.data.menuTapCurrent].ename
    app.globalData.client.subscribe(topic);
    app.globalData.client.subscribe("ZUCC-ZS/update");
    app.globalData.client.on('message', function(topic, payload) {
    
      if(topic=="ZUCC-ZS/update")
      {
          that.getdata();
      }
    else{
      //赋值
      var receive=JSON.parse(payload);
       that.setData({
          temperature:receive.temperature,
          humidity:receive.humidity,
        
       })
       that.settchart()
      }
      })
    
    }


  
  
})

