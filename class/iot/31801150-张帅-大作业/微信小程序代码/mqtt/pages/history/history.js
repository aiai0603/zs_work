// pages/history/history.js
import * as echarts from '../../echarts-for-weixin-master/ec-canvas/echarts';
let chart = null;
let chart2 = null;
const app = getApp();

function initChart(canvas, width, height, dpr) {
  chart = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // new
  });
  canvas.setChart(chart);

  var option = {
    title: {
      text: '24小时温度情况',
      left: 'center'
    },
   
    color: ["#37A2DA"],
    
    grid: {
      containLabel: true
    },
    tooltip: {
      show: true,
      trigger: 'axis'
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: [],
      // show: false
    },
    yAxis: {
      x: 'center',
      type: 'value',
      splitLine: {
        lineStyle: {
          type: 'dashed'
        }
      }
      // show: false
    },
    series: [{
      name: 'A',
      type: 'line',
      smooth: true,
      data: []
    }]
  };

  chart.setOption(option);
  return chart;
}

function initChart2(canvas, width, height, dpr) {
  chart2 = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // new
  });
  canvas.setChart(chart2);

  var option = {
    title: {
      text: '24小时湿度情况',
      left: 'center'
    },
   
    color: ["#37A2DA"],
    
    grid: {
      containLabel: true
    },
    tooltip: {
      show: true,
      trigger: 'axis'
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: [],
      // show: false
    },
    yAxis: {
      x: 'center',
      type: 'value',
      splitLine: {
        lineStyle: {
          type: 'dashed'
        }
      }
      // show: false
    },
    series: [{
      name: 'A',
      type: 'line',
      smooth: true,
      data: []
    }]
  };

  chart2.setOption(option);
  return chart2;
}





Page({
  onShareAppMessage: function (res) {
    return {
      title: 'ECharts 可以在微信小程序中使用啦！',
      path: '/pages/index/index',
      success: function () { },
      fail: function () { }
    }
  },
  echartInit (e) {
    initChart(e.detail.canvas, e.detail.width, e.detail.height);
  },
  data: {
    ec: {
      onInit: initChart
    },
    ec2: {
      onInit: initChart2
    }
  },
  time(timestamp) {
    var time = new Date(timestamp);
    var y = time.getFullYear();
    var m = (time.getMonth() + 1) < 10 ? "0" + (time.getMonth() + 1) : (time.getMonth() + 1);//获取当前月份的日期，不足10补0
    var d = time.getDate() < 10 ? "0" + time.getDate() : time.getDate();//获取当前几号，不足10补0s
    return  time.toTimeString().substr(0, 5);
},


  onLoad: function (options) {
    let that=this;
    wx.request({
      url: 'http://localhost:8086/recover/list',
      data: {
          eid:options.id,
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        var rece=res.data.data;
        var date=[];
        var humi=[];
        var temp=[];
        for(var i=0;i<rece.length;i++){
            date.push(that.time(rece[i].sendTime));
            humi.push(rece[i].humi);
            temp.push(rece[i].temp);
        }

        var option = {
          title: {
            text: '24小时温度情况',
            left: 'center'
          },
         
          color: ["#37A2DA"],
          
          grid: {
            containLabel: true
          },
          tooltip: {
            show: true,
            trigger: 'axis'
          },
          xAxis: {
            type: 'category',
            boundaryGap: false,
            data: date,
            // show: false
          },
          yAxis: {
            x: 'center',
            type: 'value',
            splitLine: {
              lineStyle: {
                type: 'dashed'
              }
            }
            // show: false
          },
          series: [{
            name: 'A',
            type: 'line',
            smooth: true,
            data: temp
          }]
        };
      
        chart.setOption(option);

        var option2 = {
          title: {
            text: '24小时湿度情况',
            left: 'center'
          },
         
          color: ["#37A2DA"],
          
          grid: {
            containLabel: true
          },
          tooltip: {
            show: true,
            trigger: 'axis'
          },
          xAxis: {
            type: 'category',
            boundaryGap: false,
            data: date,
            // show: false
          },
          yAxis: {
            x: 'center',
            type: 'value',
            splitLine: {
              lineStyle: {
                type: 'dashed'
              }
            }
            // show: false
          },
          series: [{
            name: 'A',
            type: 'line',
            smooth: true,
            data: humi
          }]
        };
      
        chart2.setOption(option2);

      }
    })
  
  },

  onReady() {
  }
});
