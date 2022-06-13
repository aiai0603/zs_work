<template>
  <div id="app">
    <el-main >

        <el-carousel indicator-position="outside">
          <el-carousel-item v-for="item in path">
            <img :src="item">
          </el-carousel-item>
        </el-carousel>



      <el-tabs type="border-card">
        <el-tab-pane label="所有车型">

          <el-col :span="8" v-for="(car2,index2) in carall1" class="new-card">
              <router-link :to="'/car/'+index2%2" >
            <el-card shadow="hover"  @click="handleRouter">
              <img :src="car2.path" class="image">
              <div style="padding: 0px;">
                <div>{{car2.name}}</div>
              </div>
            </el-card>
              </router-link>
          </el-col>


        </el-tab-pane>
        <el-tab-pane :label="title[index]" v-for="(car,index) in carall">

          <el-col :span="8" v-for="(car1,index1) in car" class="new-card">
            <router-link :to="'/car/'+index1%2" >
            <el-card shadow="hover" >
              <img :src="car1.path" class="image">
              <div style="padding: 0px;">
                <div>{{car1.name}}</div>
              </div>
            </el-card>
            </router-link>
          </el-col>


        </el-tab-pane>

       </el-tabs>
<div id="kv">
      <div class="showrow">
        <black :carprop="imgpc[0]">
            <div>预约试驾</div>
        </black>
        <router-link to="/calculate">
        <black :carprop="imgpc[1]">
            <div>金融服务</div>
        </black>
       </router-link>


      </div>
      <div class="showrow">
        <black :carprop="imgpc[2]">
            <div>品牌新闻</div>
        </black>
        <black :carprop="imgpc[3]">
            <div>蓝缤会员</div>
        </black>


      </div>
</div>




    </el-main>

  </div>
</template>

<script>
  import black from '../components/black.vue'
  import datacar from '../data.js'
  export default {
    name: 'App',
    components:{black},

    data() {
      return {
         title: ['轿车', 'SUV', '新能源'],
         imgpc:[require('../assets/img1-pc.jpg'), require('../assets/img2-pc.jpg'), require('../assets/img3-pc.jpg'), require(
          '../assets/img4-pc.jpg')],
        activeIndex: '1',
        path: [require('../assets/1.jpg'), require('../assets/2.jpg'), require('../assets/3.jpg'), require(
          '../assets/4.jpg')],
          carall: datacar.carall,
          carall1: datacar.carall1,
        currentDate: new Date()
      };

    },


  }
</script>


<style scoped="scoped">

  .blackp{
    height: 240px;
    width: 600px;
    margin: 15px;
  }

  .showrow{
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
    white-space: normal;
    width: 100%;
    font-size: 36px;


  }
  .firsttd {
    font-size: 20px;
  }

  .el-dropdown {

    margin: 0px 0px 0px 20px;
    width: 80px;
    height: 40px;

  }

  .el-dropdown-link {

    cursor: pointer;
    color: white;
  }

  .el-icon-arrow-down {
    font-size: 12px;
  }

  .el-footer .el-link {
    width: 100px;
    color: white;

  }

  .el-footer {
    color: lightgrey;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-flow: column;
    background-color: #333333;

  }

  .el-footer td {
    width: 200px;


  }

  .el-footer tr {
    width: 1000px;
    text-align: left;
    height: 40px;


  }

  .sp {
    position: absolute;
    top: 100px;
  }

  .el-card {
    position: relative;
    width: 680px;
    height: 300px;
  }

  .el-col {
    margin: 40px 20px 10px 20px;
    width: 680px;
    height: 300px;
    display: flex;
    flex-flow: center;
    margin: 5px;
  }


  .el-tabs__header {
    height: 38px;
    line-height: 40px;
  }

  .el-tabs__nav {
    height: 40px;
    line-height: 40px;
  }
  .el-tabs{
     height: 290px;
  }
  .el-tab-pane{
    display: flex;
    justify-content: row;
    height: 240px;
    overflow-y: hidden;
    overflow-x: scroll;
    white-space: nowrap;
  }

  .el-carousel__indicators {
    height: 0px;
    margin: 0px;
  }



  #lunbo {
    width: 100%;
    height: 100%;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }

  .el-header {
    background-color: white;
    color: #333;
    text-align: left;
    line-height: 60px;
  }

  .el-menu-demo {
    width: 100%;

  }

  #title {
    width: 160px;
    height: 30px;
    margin: 0px 500px 10px 100px;
  }

  .el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
  }

  .el-main {
    background-color: #E9EEF3;
    color: #333;
    text-align: center;

  }

  body>.el-container {
    margin-bottom: 40px;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }
  .new-card{
    width: 260px;
    height: 195px;
    margin: 5px;

  }
  .new-card .image {
    width: 240px;
    height: 160px;
    display: block;
  }
  .new-card .el-card{
    width: 280px;
    height: 200px;
    padding: 5px;
    border: 0px;
  }
  #kv{
    background: url(../assets/kv-bg.jpg);
    background-size: cover;
    padding: 20px;
    margin-top: 10px;
  }


</style>
<style>
  .router-link,a {
    text-decoration: none;
  }
  .new-card .el-card__body{
    padding: 5px;
  }
  .el-carousel__container {
    height: 545px;

  }

  .el-carousel {
    height: 585px;
  }

  .el-carousel__item {
    height: 551px;
  }
.el-tabs--border-card>.el-tabs__content{
  padding: 5px;
}







</style>
