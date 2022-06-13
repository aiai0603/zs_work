

<template>
  <div id="app" align="center" v-cloak>
    <el-main>
    <div class="header">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>车型天地</el-breadcrumb-item>

      </el-breadcrumb>
    </div>
    <el-menu class="el-menu-demo" mode="horizontal" background-color="#002c5f" text-color="#fff" active-text-color="#fff">
      <div style="width: 200px;"></div>

      <el-menu-item v-for="(car,index) in carall"  @click.native="onTopClick(title[index])"> {{title[index]}} </el-menu-item>


    </el-menu>
    <div class="mu">

      <div class="all-car">



        <div class="title-car" v-for="(car,index) in carall">
          <div class="title1" :id='title[index]'>{{title[index]}} </div>
          <el-col :span="8" v-for="(car1,index1) in car" >
              <router-link :to="'/car/'+index1%2" >
              <el-card shadow="hover" @mouseover.native="change(car1)">
                <img :src="car1.path" class="image">
                <div style="padding: 10px;line-height: 25px;">
                  <div>{{car1.name}}</div>
                  <div>￥{{car1.p}} 起</div>
                </div>
              </el-card>
              </router-link>


          </el-col>
        </div>





      </div>
      <div class="show">

            <img :src="src">
            <div style="font-size: 32px;margin: 30px;">{{name}}</div>
            <hr style="width: 90%; height:2px;border:none;border-top:2px solid lightgray;" />
                <div class="label">
                  <span>长/宽/高：</span><div>{{size}}</div>
                </div >
                <div class="label">
                   <span>油耗/续航（纯电动）：</span> <div >{{you}}</div>
                </div>
                <div class="label">
                   <span>输出功率：</span> <div>{{power}}</div>
                </div>
            <hr style=" width: 90%;height:2px;border:none;border-top:2px solid lightgray;" />

                  <div class="label">
                    <span>厂家指导价：</span><div>{{price}}元起</div>
                  </div >

      </div>





    </div>
</el-main>
  </div>
</template>

<script>
  import cardata from '../data.js'
  export default {
    name: 'App',


    data() {
      return {
        activeIndex: '1',
        title: ['轿车', 'SUV', '新能源'],
        src:require('../assets/新一代悦纳.jpg'),
        name:'新一代悦纳',
        price:72800,
        size:'4,405 * 1,720 * 1,455',
        power:'73.3 / 6,000',
        you:'最低5.0',
        carall:cardata.carall,

      };


      },
      methods:{
          change(item){

            this.price=item.p;
            this.src=item.src;
            this.name=item.name;
            this.size=item.size;
            this.you=item.you;
            this.power=item.power;
          },
          onTopClick(str) {

            window.location.hash ='#'+str;

          }

    },



  }
</script>
<style scoped="scoped" >
  a{
    text-decoration: none;
  }
  .header {
    width: 70%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
  }
  [v-cloak] {
    display: none;
  }
  .title1 {
    width: 100%;
    text-align: left;
    font-size: 18px;
    margin: 20px;

  }
  .title-car {
    width: 100%;
    overflow: hidden;
  }
  .show {
    width: 30%;
    height: 600px;
    box-shadow:5px 5px 20px lightgray;
    margin: 10px 0px 10px 40px;

  }
  .label{
    display: flex;
    flex-flow: row;
    justify-content: space-between;
    margin: 30px ;
    font-size: 18px;
    color: #666666;
  }
  .label div{
   color:#00aad2;
  }
  .all-car {
    width: 90%;
    overflow-x: auto;
  }
  .mu {
    width: 85%;
    height: 625px;
    display: flex;
    flex-flow: row;
  }
  .image {
    width: 170px;
    height: 120px;
    display: block;
  }
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
  .el-col {
    width: 175px;
    margin: 10px;
    padding: 0px;

  }
 .el-card{
   border: 0px;

 }
  .el-menu-demo {
    display: flex;
    flex-flow: row;
  }


</style>
<style>
  .el-card__body {
    padding: 5px;
  }
</style>
