<template>
  <div id="app" align="center" v-cloak>
    <el-main>
      <div class="header">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>品牌专区</el-breadcrumb-item>

        </el-breadcrumb>
      </div>
      <div class="lunbos">
        <el-carousel indicator-position="outside">
          <el-carousel-item v-for="item in path">
            <img :src="item" class="lunbo">
          </el-carousel-item>
        </el-carousel>
      </div>
      <div class="black-col-1">
        <div class="black-row-1">
          <black :carprop="require('../assets/br-3.jpg')">
            <div>关于企业</div>
            <div class="hid">北京现代竭力为您的美好生活创造一片蓝天</div>
          </black>
          <black :carprop="require('../assets/br-2.jpg')">
            <div>品牌理念</div>
            <div class="hid">北京现代贯彻以人为本的理念<br>将您与我们相处的事件品质化</div>
          </black>
        </div>
        <div class="black-row-2">
          <black :carprop="require('../assets/br-1.jpg')">
            <div>品牌技术实力</div>
            <div class="hid">属于北京现代的一切高科技<br>也可以属于您</div>
          </black>
        </div>
      </div>





      <div>
        <div class="bg">
          <h1>品牌新闻</h1>
          <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
          <div class="qz">这里有最新的品牌资讯和专业的媒体测评</div>


          <el-carousel :autoplay="false" arrow="always" style="width: 80%;">
            <el-carousel-item v-for="(newes,item) in news" :key="item">
              <news :imgprop="newes.img">
                <div slot="header" class="news-head">{{newes.title}}</div>
                <div class="news-word">{{newes.pass}}</div>
              </news>
            </el-carousel-item>
          </el-carousel>
              <el-button type="primary" style="margin: 20px;">查看更多</el-button>



          <div class="line-show" >
              <black :carprop="require('../assets/newline-1.jpg')">
                  <div>工厂参观</div>
                  <div class="hid">走进北京现代工厂，开启工艺探寻之旅</div>
              </black>
               <black :carprop="require('../assets/newline-2.jpg')">
                  <div>安全环保</div>
                  <div class="hid">北京现代谨守安全生产承诺<br>践行环保生产责任</div>
               </black>
                <black :carprop="require('../assets/newline-3.jpg')">
                    <div>人才招聘</div>
                    <div class="hid">这里有最新的北京现代人才招聘信息<br>和招聘流程</div>
                </black>
                 <black :carprop="require('../assets/newline-4.jpg')">
                    <div>企业社会责任</div>
                    <div class="hid">履行社会责任，弘扬互助美德<br>打造爱心文化</div>
           </black>

          </div>
        </div>

      </div>
    </el-main>
  </div>
</template>

<script>
  import black from '../components/black.vue'
  import news from '../components/news.vue'
  import news_data from '../data.js'
  export default {
    name: 'App',
    components: {
      black,
      news
    },
    data() {
      return {

        path: [require('../assets/pc-1.jpg'), require('../assets/pc-2.jpg'), require('../assets/pc-3.jpg'), require(
          '../assets/pc-4.jpg')],

        news:news_data.news,
      }
    }

  }
</script>
<style scoped>
  .news-head {
    font-size: 20px;
    color: #333333;

    padding: 30px 50px 26px 20px;
  }

  .news-word {
    font-size: 16px;
    color: #666666;
    margin: 5px;
    line-height: 30px;
    overflow: hidden;
    margin: 10px 10px 60px 10px;
    padding: 0px 50px 20px 20px;
  }

  .xinwen {
    height: 100%;
  }

  .hid {
    opacity: 0;
    height: 0px;
    margin: 0px;
    transition: 0.2s;
    font-size: 16px;
    font-weight: 400;

  }
  .line-show .blackp{
    width: 330px;
    height: 220px;
    margin: 15px;
  }

  .blackp:hover .hid {
    opacity: 1;
    height: 50px;
    margin-top: 30px;
    transition: 0.5s;
  }
 .qz {
    margin: 25px;
    font-size: 20px;
    color: #333333;
  }
  .header {
    width: 70%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
  }

  .line-show {
   display: flex;
   flex-flow: row;
   justify-content: center;
   align-items: center;
   margin-top: 50px;
   background-color:#f2f2f2;
   padding:50px 20px;
    font-size: 28px;
  }

  .bg {

    height: auto;
    padding: 40px 0px;
  }

  h1 {
    font-size: 40px;
    font-weight: 400;
    color: #333333;
  }

  .black-col-1 {
    display: flex;
    flex-flow: row;
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

  .black-row-1 .blackp {
    width: 640px;
    height: 315px;
    margin: 35px 25px;
  }

  .black-row-2 .blackp {
    width: 475px;
    height: 665px;
    margin: 10px;
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
    height: 445px;
  }

  .lunbos .el-carousel__item {
    height: 450px;
  }

  .lunbos .el-carousel {
    height: 475px;
  }


  .bg .el-carousel__container {
    height: 380px;
  }

  .bg .el-carousel__item {
    height: 385px;
  }

  .bg .el-carousel {
    height: 385px;
  }
</style>
