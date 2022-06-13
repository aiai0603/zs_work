<template>
  <div id="app" v-cloak>
    <el-container>
      <el-header>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
          <el-menu-item ><router-link to="/"><img id="title" src="./assets/title.jpg" alt="北京现代"></img></router-link></el-menu-item>
          <el-menu-item index="1"> <router-link to="/car" >车型天地</router-link></el-menu-item>
          <el-menu-item index="2"><router-link to="/brand" >品牌专区</router-link></el-menu-item>
          <el-menu-item index="3"><router-link to="/server" >售后服务</router-link></el-menu-item>
          <el-menu-item @click="showitem()"> <i class="el-icon-search" > 搜索</i></el-menu-item>

        </el-menu>





      </el-header>

      <div id="search" >
          <el-input v-model="input" placeholder="请输入内容"></el-input><el-button type="primary" icon="el-icon-search">搜索</el-button>
      </div>


      <router-view />

      <el-footer style="height: 360px;">

        <tr class="firsttd">
          <td>经销商专区</td>
          <td>人才招聘</td>
          <td>下载专区</td>
          <td>联系我们</td>
          <td> 微博关注</td>
        </tr>
        <tr>
          <td>经销商招募</td>
          <td><a href="http://pr.beijing-hyundai.com.cn/Social_Recruitment.html">社会招聘</a></td>
          <td>app下载</td>
          <td>
            <el-button type="primary">在线客服</el-button>
          </td>
          <td class="firsttd">微信关注</td>
        </tr>
        <tr>
          <td>
            <el-button type="primary">经销商登录</el-button>
          </td>
          <td><a href="http://pr.beijing-hyundai.com.cn/Social_Recruitment.html">校园招聘</a></td>
          <td></td>
          <td>4008-123</td>
          <td class="firsttd">天猫关注</td>
        </tr>
        <tr>
          <td></td>
          <td><a href="http://pr.beijing-hyundai.com.cn/Social_Recruitment.html">招聘帮助</a></td>
          <td></td>
          <td></td>
        </tr>
        <div style="display: flex;flex-flow: row;justify-content: center;align-items: flex-end; height: 160px; width: 70%;margin-right: 80px;">
                     <img src="./assets/logo-white.png" alt="北京现代" id="title1" >
          <div>
            <div style="line-height: 60px;">

              <el-link href="https://element.eleme.io" target="_blank" :underline="false">我要加盟</el-link> | <el-link
                :underline="false" href="https://element.eleme.io" target="_blank">联系我们</el-link> | <el-link :underline="false"
                href="https://element.eleme.io" target="_blank">隐私条款</el-link> | <el-link href="https://element.eleme.io"
                target="_blank" :underline="false">网站地图</el-link> | <el-link href="https://element.eleme.io" target="_blank"
                :underline="false">联系我们</el-link>|<el-dropdown>
                <span class="el-dropdown-link">
                  友情链接<i class="el-icon-arrow-down el-icon--right"></i>
                </span>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item>北汽集团</el-dropdown-item>
                  <el-dropdown-item>现代汽车</el-dropdown-item>
                  <el-dropdown-item>二手车</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </div>
            <div>北京市顺义区林河工业开发区顺通路18号 京ICP备05030295号 京公网安备110401000066号
              <br>Copyright © 2002-2020 BEIJING HYUNDAI MOTOR COMPANY Corporation,All Rights Reserved</div>
          </div>
        </div>



      </el-footer>
    </el-container>


  </div>
</template>
<script>
  export default {
    name: 'App',
    input:'',
    data() {
      return {
        activeIndex: '0',

      };
    },
   methods:{
      showitem(){
        if( document.getElementById('search').style.display!='none')
        document.getElementById('search').style.display='none';
        else
         document.getElementById('search').style.display='flex';

      }
    }


  }
</script>


<style scoped>
  .icon{
    width: 38px;
    height: 30px;

  }
  #search{
    width: 100%;
    height: 100px;

    flex-flow: row;
    align-items: center;
    justify-content: center;
    background-color: #f2f2f2;
    display: none;
  }
  #search .el-input{
    width: 40%;
    margin: 10px;
  }
  a{
    text-decoration: none;
    color: white;
  }
  [v-cloak]{
    display: none;
  }
  .router-link,a {
    text-decoration: none;
  }
  #title1{
    width: 160px;
    height: 30px;
    margin: 0px 70px 30px 0px;
  }
  .firsttd {
    font-size: 20px;
  }

  .el-menu-item{
    font-size: 16px;
    font-weight: 400;
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
    line-height: 160px;
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
</style>
