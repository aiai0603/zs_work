<template>
  <div id="app" align="center" v-cloak>
    <el-main>
      <div class="header">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>金融计算机</el-breadcrumb-item>
        </el-breadcrumb>
      </div>

      <div class="bg">
        <h1>金融计算机</h1>
        <div class="qz">根据您提交的信息，为您提供贷款方案</div>
      </div>
      <div class="line-show-car">
        <div class="showcar">
          <img :src="options[kindindex].car[carindex].src" alt="car-big">
          <div>{{options[kindindex].car[carindex].label}}&nbsp;&nbsp;{{options[kindindex].car[carindex].mode[modeindex].label}}</div>
          <div>官方指导价￥<span>{{options[kindindex].car[carindex].mode[modeindex].sum/10000}}</span>
            万&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月供 ￥<span>{{yuegong}}</span></div>
        </div>

        <div class="choose">
          <div class="qz" style="text-align: left;margin: 10px;">选择你心仪的座驾</div>

          <el-select v-model="kind" placeholder="请选择车型种类" @change="selectkind">
            <el-option v-for="item in options" :kind="item.label" :value="item.id" :key="item.id" :label="item.label">
            </el-option>
          </el-select>
          <el-select v-model="carname" placeholder="请选择车型" @change="selectcar">
            <el-option v-for="item in options[kindindex].car" :value="item.id" :key="item.id" :car="item.label" :label="item.label">
            </el-option>
          </el-select>
          <el-select v-model="mode" placeholder="请选择配置" @change="selectmode">
            <el-option v-for="item in options[kindindex].car[carindex].mode" :key="item.id" :mode="item.label" :value="item.id"
              :label="item.label">
            </el-option>
          </el-select>

        </div>

      </div>
      <div class="choose-table">
        <div>
          <span>贷款期限（月）</span>
          <el-select v-model="monthchoose" placeholder="请选择期限" style="width: 20%;">
            <el-option v-for="item in month" :key="item" :label="item" :value="item">
            </el-option>
          </el-select>
        </div>
        <div>
          <span>首付(比例)</span> <span style="margin-right: 20px;">{{shoufu}}
            ¥</span>
        </div>
        <div>
          <el-slider v-model="moneyper" style="width: 80%;" :format-tooltip="formatTooltip" :step="10"></el-slider>
          <span style="margin-right: 15px;">{{(moneyper/100*60+20)}}%</span>
        </div>
        <div>
          <span>月供</span> <span style="margin-right: 20px;">{{yuegong}}
            ￥</span>
        </div>
        <div>

          <span>经销商查询</span>
          <el-cascader v-model="jxs" :options="options2" placeholder="请选择经销商" style="width: 40%;"></el-cascader>
        </div>
        <el-divider></el-divider>
        <div> 免责声明</div>
        <div style="font-size: 14px;text-align: left;line-height: 25px;">

          1) 本网站提供的金融计算器为金融贷款方案的辅助计算工具，其金融计算器计算结果仅供参考，不具有任何法律约束力。
          有关汽车贷款产品的详细内容与计算结果，可能因主机厂汽车产品政策、金融服务公司金融政策、国家补贴政策而发生变化（包含但不限于汽车价格或利率波动）。详情请咨询当地授权经销商。 2)
          本网站中提及的所有价格均为官方指导价格。官方指导价格仅供参考，不具有任何法律约束力。 3)
          本站提供的金融计算器及计算器计算结果仅适用于北京现代汽车金融有限公司提供的汽车金融产品。向客户提供的任何汽车产品的全部条款、条件及其他相关事项，均已北京现代汽车金融有限公司与该客户正式签署的汽车贷款和抵押合同及其他相关配套文件的条款为准。
          4) 更多详情请咨询北京现代汽车金融有限公司或联系当地授权经销商。
        </div>
        <el-divider></el-divider>
        <div style="width: 30%;margin: 50px 0px;">
          <el-button type="primary" style="width: 40%">预约试驾</el-button>
          <el-button type="primary" style="width: 40%">火速订购</el-button>
        </div>
      </div>
      <div class="lb">
        <el-carousel indicator-position="outside">
          <el-carousel-item v-for="item in path">
            <img :src="item" class="lunbo">
          </el-carousel-item>
        </el-carousel>
      </div>











    </el-main>
  </div>
</template>

<script>
  import dataall from '../data.js'
  export default {
    name: 'App',


    data() {
      return {
        month: [12, 24, 36, 48],
        path: [require('../assets/lb1.jpg'), require('../assets/lb2.jpg'), require('../assets/lb3.jpg')],

        monthchoose: 12,
        activeIndex: '1',
        moneyper: 0,
        kind: '',
        kindindex: 0,
        carname: '',
        carindex: 0,
        mode: '',
        modeindex: 0,
        jxs: [],

        options2: dataall.options,


        options: dataall.options2,


      }









    },
    methods: {
      selectkind: function(val) {

        this.kindindex = val;

      },
      selectcar: function(val) {

        this.carindex = val;

      },
      selectmode: function(val) {

        this.modeindex = val;

      },
      formatTooltip(val) {
        return val / 100 * 60 + 20;
      }

    },

    computed:{
          shoufu(){
            return Math.floor(this.options[this.kindindex].car[this.carindex].mode[this.modeindex].sum*(this.moneyper/100*60+20)/100*100)/100;
          },
          yuegong(){
             return Math.floor(this.options[this.kindindex].car[this.carindex].mode[this.modeindex].sum*(1-(this.moneyper/100*60+20)/100)/this.monthchoose*100)/100;
          }

    }



  }
</script>
<style scoped="scoped">
  .choose-table {
    background-color: #f2f2f2;
    display: flex;
    flex-flow: column;
    align-items: center;
    padding: 20px;
  }

  .choose-table div {
    font-size: 20px;
    width: 70%;
    line-height: 40px;
    display: flex;
    flex-flow: row;
    justify-content: space-between;
    align-items: center;
    margin: 10px;
  }
  .lunbo {
    width: 100%;
    height: 100%;
  }
  .showcar div {
    margin: 30px;
    font-size: 20px;
    color: #333333;
    margin: 20px 0px;
  }

  .showcar span {
    margin-left: 5px;
    font-size: 32px;
    color: #428bca;

  }

  .line-show-car {
    display: flex;
    flex-flow: row;
    align-items: center;
    justify-content: center;
    margin: 50px 0px;
  }

  .choose {
    display: flex;
    flex-flow: column;
    width: 20%;
    margin: 30px;

  }

  .choose .el-select {
    width: 100%;
    margin: 10px;
  }

  .bg {
    background: url('../assets/page-top-bg.jpg');
    height: 290px;
    display: flex;
    flex-flow: column;
    align-items: center;
    justify-content: center;
  }

  .header {
    width: 70%;
    height: 50px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
  }

  .qz {

    font-size: 20px;
    color: #333333;
  }

  h1 {
    font-size: 40px;
    font-weight: 400;
    color: #333333;
  }
</style>
<style>
  .lb .el-carousel__container {
    height: 445px;
  }

  .lb .el-carousel__item {
    height: 450px;
  }

  .lb .el-carousel {
    height: 475px;
  }
</style>
