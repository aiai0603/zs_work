<template>
  <div id="app" align="center" v-cloak>
    <el-main>
      <div class="header">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>售后服务</el-breadcrumb-item>

        </el-breadcrumb>
      </div>
      <div class="lunbos">
        <el-carousel indicator-position="outside">
          <el-carousel-item v-for="item in path">
            <img :src="item" class="lunbo">
          </el-carousel-item>
        </el-carousel>
      </div>
      <div class="black-col">
        <div class="black-row-b">
          <black :carprop="require('../assets/g-1.jpg')">
            <div>预约服务</div>
          </black>
          <black :carprop="require('../assets/g-2.jpg')">
            <div>保养项目</div>
          </black>
        </div>
        <div class="black-row">
          <black :carprop="require('../assets/g-3.jpg')">
            <div>质量保证</div>
          </black>
          <black :carprop="require('../assets/g-4.jpg')">
            <div>专业服务</div>
          </black>
          <black :carprop="require('../assets/g-5.jpg')">
            <div>爱车讲堂</div>
          </black>
        </div>
        <div class="black-row">
          <black :carprop="require('../assets/g-6.jpg')">
            <div>纯正配件</div>
          </black>
          <black :carprop="require('../assets/g-7.jpg')">
            <div>新能源车辆服务</div>
          </black>
          <black :carprop="require('../assets/g-8.jpg')">
            <div>信息查询</div>
          </black>
        </div>



      </div>
      <div>
        <div class="bg">
          <h1>服务理念</h1>
          <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
          <div class="qz">享你未想，北京现代智慧服务</div>

          <video src="../assets/movie_3.mp4" controls poster="../assets/v.jpg"></video>
          <h1>服务流程</h1>
          <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
          <div class="qz">北京现代非凡服务之旅</div>
          <img src="../assets/fwlc.png" alt="服务流程" style="margin: 50px;">

          <div class="qz" style="font-size: 20px; line-height: 60px;">
            <div style="color: #00AAD2;font-size: 28px;">北京现代非凡服务之旅</div>
            “北京现代非凡服务之旅”是一套超越期待、精细全面、极具特色的服务体验流程。
            <br>
            我们承诺：让我们的客户拥有近乎完美的服务体验；坚持贯彻并且不断完善这一“非凡服务之旅”！
          </div>
        </div>

      </div>
    </el-main>
  </div>
</template>

<script>
  import black from '../components/black.vue'
  export default {
    name: 'App',
    components: {
      black
    },
    data() {
      return {

        path: [require('../assets/s-1.jpg'), require('../assets/2.jpg'), require('../assets/s-2.jpg'), require(
          '../assets/s-3.jpg')],
      }
    }

  }
</script>
<style scoped>
  .qz {
    margin: 25px;
    font-size: 20px;
    color: #333333;
  }

  .bg {
    background: url(../assets/kv-bg.jpg) fixed center;
    background-size: cover;
    height: auto;
    padding: 40px 0px;
  }

  h1 {
    font-size: 40px;
    font-weight: 400;
    color: #333333;
  }

  .black-col {
    display: flex;
    flex-flow: column;
    justify-content: center;
    align-items: center;
    font-size: 28px;
    margin: 30px 0px;
  }

  .black-row,
  .black-row-b {
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
  }

  .black-row-b .blackp {
    width: 525px;
    height: 260px;
    margin: 5px;
  }

  .black-row .blackp {
    width: 347px;
    height: 195px;
    margin: 5px;
  }

  .header {
    width: 70%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
  }

  .el-carousel__indicators {
    height: 0px;
    margin: 0px;
  }

  .lunbo {
    width: 100%;
    height: 100%;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }


</style>
<style>
  .lunbos .el-carousel__container {
    height: 455px;
  }

  .lunbos .el-carousel__item {
    height: 450px;
  }

  .lunbos .el-carousel {
    height: 485px;
  }


  .black-col .blackp:hover .blackword {
    background-color: rgba(126, 177, 198, 0.7);
    transition: 0.2s;
  }
</style>
