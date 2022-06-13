<template>
  <div id="app" align="center">
    <el-main style="overflow: unset;">

      <div class="header">

        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item :to="{ path: '/car' }">车型天地</el-breadcrumb-item>
          <el-breadcrumb-item>{{carshow[id].name}}</el-breadcrumb-item>

        </el-breadcrumb>
      </div>
      <div class="pic">
        <img :src="carshow[id].big" alt="">
        <div class="b">
          <el-button type="primary">预约试驾</el-button>
          <el-button type="primary"><router-link to="/calculate">金融计算机</router-link></el-button>
        </div>
      </div>


      <div class="bg">
        <div class="dr">
          <el-menu class="el-menu-demo" mode="horizontal">

            <el-menu-item index="1"><a href="#cxtd">车型特点</a></el-menu-item>
            <el-menu-item index="2"><a href="#cspz">参数配置</a></el-menu-item>
            <el-menu-item index="3"><a href="#jcxs">精彩欣赏</a></el-menu-item>
            <el-menu-item index="4"><a href="#yysj">预约试驾</a></el-menu-item>
            <el-menu-item index="5"><a href="#mtxw">媒体新闻</a></el-menu-item>


          </el-menu>
        </div>
        <h1 id="cxtd">车型特点</h1>
        <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
        <div class="qz">发现车型之美</div>


        <el-card :body-style="{ padding: '0px' }">
          <img :src="carshow[id].src1" class="image">
          <div style="margin: 30px;">
            <span class="card-title">越周全&nbsp;悦舒享</span>
            <div class="bottom clearfix">
              加载诸多安全&便捷科技配置，为您和家人提供全方位安全呵护、人性化便捷体验，舒心畅享，轻松随行
            </div>
          </div>
        </el-card>

        <el-card :body-style="{ padding: '0px' }">
          <img :src="carshow[id].src2" class="image">
          <div style="margin: 30px;">
            <span class="card-title">越运动&nbsp;悦心动</span>
            <div class="bottom clearfix">
              全新运动造型，引领不凡时尚，一切为动感而来，让你第一眼就心动
            </div>
          </div>
        </el-card>

        <el-card :body-style="{ padding: '0px' }">
          <img :src="carshow[id].src3" class="image">
          <div style="margin: 30px;">
            <span class="card-title">越省心&nbsp;悦激情</span>
            <div class="bottom clearfix">
              高效动力带您感受的不只是驾驭的激情，更有领先同级油耗所带来的安心
            </div>
          </div>
        </el-card>

        <h1 id="cspz">参数配置</h1>
        <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
        <div class="qz">共3款车型可以选择</div>
        <div style="display: flex;flex-flow: row;align-items: center;justify-content: center;">

          <div class="show">

            <img :src="carshow[id].kun1">
            <div style="font-size: 32px;margin: 10px;">
              手动 ● 青春版</div>
            <div class="label1">
              1.4 GLS MT
            </div>
            <div class="label1">
              <span>厂家指导价：</span>
              <div>7.28万</div>
            </div>

            <hr style="width: 90%; height:2px;border:none;border-top:2px solid lightgray;" />
            <div class="label">
              <span>最高车速</span>
              <div>185</div>
            </div>
            <div class="label">
              <span>综合油耗</span>
              <div>5.0</div>
            </div>
            <div class="label">
              <span>发动机排量</span>
              <div>1,368</div>
            </div>
            <hr style=" width: 90%;height:2px;border:none;border-top:2px solid lightgray;" />
            <div class="b">
               <router-link to="/calculate">
              <el-button type="primary">金融计算机</el-button>
              </router-link>
              <el-button type="primary">详细配置</el-button>
            </div>


          </div>


          <div class="show">

            <img :src="carshow[id].kun1">
            <div style="font-size: 32px;margin: 10px;">
              手动 ● 炫酷版</div>
            <div class="label1">
              1.4 GLS MT
            </div>
            <div class="label1">
              <span>厂家指导价：</span>
              <div>7.78万</div>
            </div>

            <hr style="width: 90%; height:2px;border:none;border-top:2px solid lightgray;" />
            <div class="label">
              <span>最高车速</span>
              <div>185</div>
            </div>
            <div class="label">
              <span>综合油耗</span>
              <div>5.0</div>
            </div>
            <div class="label">
              <span>发动机排量</span>
              <div>1,368</div>
            </div>
            <hr style=" width: 90%;height:2px;border:none;border-top:2px solid lightgray;" />
            <div class="b">
              <router-link to="/calculate">
              <el-button type="primary">金融计算机</el-button>
              </router-link>
              <el-button type="primary">详细配置</el-button>
            </div>


          </div>



          <div class="show">

            <img :src="carshow[id].kun1">
            <div style="font-size: 32px;margin: 10px;">
              炫酷版</div>
            <div class="label1">
              1.4 GLS MT
            </div>
            <div class="label1">
              <span>厂家指导价：</span>
              <div>8.78万</div>
            </div>

            <hr style="width: 90%; height:2px;border:none;border-top:2px solid lightgray;" />
            <div class="label">
              <span>最高车速</span>
              <div>184</div>
            </div>
            <div class="label">
              <span>综合油耗</span>
              <div>4.9</div>
            </div>
            <div class="label">
              <span>发动机排量</span>
              <div>1,368</div>
            </div>
            <hr style=" width: 90%;height:2px;border:none;border-top:2px solid lightgray;" />
            <div class="b">
             <router-link to="/calculate">
             <el-button type="primary">金融计算机</el-button>
             </router-link>
              <el-button type="primary">详细配置</el-button>
            </div>


          </div>


        </div>

        <h1 id="jcxs">精彩欣赏</h1>
        <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
        <div class="qz">更多精彩照片</div>


        <div class="carshow">
          <el-carousel arrow="always" style="width: 80%;" :autoplay="false">
            <el-carousel-item v-for="item in carshow[id].path">
              <img :src="item">
            </el-carousel-item>
          </el-carousel>
        </div>


        <div class="yuyue">
          <h1 id="yysj">预约试驾</h1>
          <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
          <div class="qz">欢迎您在线申请试驾</div>




          <div class="yuyue-item">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">

              <el-form-item label="经销商" prop="jxs" required>
                <el-cascader v-model="ruleForm.jxs" :options="ruleForm.options" @change="handleChange" placeholder="请选择经销商"
                  style="width: 100%;"></el-cascader>
              </el-form-item>
              <el-form-item label="姓名" prop="name" required>
                <el-input v-model="ruleForm.name" placeholder="请输入姓名"></el-input>
              </el-form-item>
              <el-form-item>
                <el-radio v-model="ruleForm.radio" label="1">先生</el-radio>
                <el-radio v-model="ruleForm.radio" label="2">女士</el-radio>
              </el-form-item>

              <el-form-item label="试驾时间" prop="date1" required>


                <el-date-picker type="date" placeholder="选择日期" v-model="ruleForm.date1" style="width: 100%;"></el-date-picker>


              </el-form-item>
              <el-form-item label="手机号码" prop="phone" required>
                <el-input v-model="ruleForm.phone" placeholder="请输入手机号码"></el-input>
              </el-form-item>
              </el-form-item >

                    <el-checkbox v-model="ruleForm.checked" label="已接受《个人信息保护协议》"  prop="checked"></el-checkbox>

              </el-form-item>


              <div style="margin: 20px 0px;color: #666666">温馨提示：请确保试驾当天携带有效身份证件</div>


              <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')" :disabled="!ruleForm.checked">立即预约</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
              </el-form-item>
            </el-form>
            <img :src="carshow[id].sj" alt="" style="width: 50%;margin: 30px 0px 30px 50px;">
          </div>
        </div>


        <h1 id="mtxw">媒体新闻</h1>
        <hr style="width: 10%; height:2px;border:none;border-top:2px solid skyblue;" />
        <div class="qz">专业发声&nbsp;专业推荐</div>


          <div class="mtxw">
        <el-card :body-style="{ padding: '0px' }">
          <img :src="carshow[id].wx1" class="image">
          <div style="margin: 30px;">
            <span class="card-title">{{carshow[id]. wxword1}}</span>
            <div class="bottom clearfix">
              {{carshow[id]. wxtitle1}}
            </div>
          </div>

          <el-button type="text" class="button">详情内容</el-button>
        </el-card>
        <el-card :body-style="{ padding: '0px' }">
          <img :src="carshow[id].wx2" class="image">
          <div style="margin: 30px;">
            <span class="card-title">{{carshow[id]. wxword2}}</span>
            <div class="bottom clearfix">
              {{carshow[id]. wxtitle2}}
            </div>
          </div>

            <el-button type="text" class="button">详情内容</el-button>
        </el-card>
          </div>


      </div>




    </el-main>
  </div>



</template>

<script>
  import options_data from '../data.js'
  export default {
    name: 'App',


    data() {
      return {
        carshow:options_data.showcar,
        id:parseInt(this.$route.params.id),
        path: [require('../assets/more-1.jpg'), require('../assets/more-2.jpg'), require('../assets/more-3.jpg'),
          require(
            '../assets/more-4.jpg')
        ],
        currentDate: new Date(),
        ruleForm: {
          name: '',

          checked: false,
          date1: '',
          phone: '',
          jxs: [],
          options:options_data.options,

        rules: {
          name: [{
              required: true,
              message: '请输入姓名',
              trigger: 'blur'
            },
            {
              min: 2,
              max: 5,
              message: '长度在 2 到 5 个字符',
              trigger: 'blur'
            }
          ],

          date1: [{
            type: 'date',
            required: true,
            message: '请选择日期',
            trigger: 'blur'
          }],


          phone: [{
            min: 11,
            max: 11,
            required: true,
            message: '请输入11位手机号码',
            trigger: 'blur'
          }],

          jxs: [{

            required: true,
            message: '请选择经销商',
            trigger: 'blur'
          }],

          xy: [{
            type: 'array',
            required: true,
            message: '请同意协议',
            trigger: 'blur'
          }]

        },
      },
      }
    },



    methods: {
      handleChange(value) {
        console.log(value);
      },


      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
           this.$confirm('提交后无法更改, 是否继续?', '提示', {
             confirmButtonText: '确定',
             cancelButtonText: '取消',
             type: 'warning'
           }).then(() => {
             this.$message({
               type: 'success',
               message: '预约成功!'
             });
           }).catch(() => {
             this.$message({
               type: 'info',
               message: '已取消'
             });
           });
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    },



  };
</script>

}
}

}
</script>

<style scoped="scoped">
    a{
      text-decoration: none;

    }
    .el-button a{
      color:white
    }
     .button {
        padding: 0;
        float: right;
        margin-right: 20px;
        margin:10px 30px 20px 0px;
      }
  .yuyue-item {
    display: flex;
    flex-flow: row;
  }

  .el-form {
    width: 30%;
    margin: 30px 0px 30px 80px;

  }


  .yuyue {
    width: 90%;
    height: auto;
    background-color: #f2f2f2;
    padding: 10px 0px 100px 0px;

  }

  .carshow {
    margin-bottom: 50px;
  }

  .show {
    width: 26%;
    height: 600px;
    box-shadow: 5px 5px 20px lightgray;
    margin: 10px 0px 10px 40px;
    background-color: #f2f2f2;

  }

  .show:hover {
    background-color: white;
  }

  .label1 {
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
    margin: 10px;
    font-size: 18px;
    color: #666666;
  }

  .label {
    width: 60%;
    display: flex;
    flex-flow: row;
    justify-content: space-between;
    align-items: center;
    margin: 20px;
    font-size: 18px;
    color: #666666;
  }

  .label1 div {
    font-size: 26px;
    color: #00aad2;
    margin-bottom: 10px;
    font-weight: 1000;
  }

  .label div {
    color: #00aad2;
  }

  .clearfix {
    margin: 20px 0px 20px 0px;
    color: #666666;
  }

  .card-title {
    font-size: 28px;
  }
   .mtxw{
     display: flex;
     flex-flow: row;
     align-items: center;
     justify-content: center;

   }
  .mtxw .el-card {
    width: 36%;
    text-align: left;
    margin: 20px;
  }



  .el-card {
    width: 70%;
    text-align: left;
    margin-top: 40px;
  }

  .el-card img {
    width: 100%;
    height: 100%;
  }

  .header {
    width: 70%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: flex-start;

  }

  .pic {


    height: 750px;
    width: 100%;
    position: relative;
  }
  .pic img{
    right: 0px;
    top: 0px;
   width: 100%;
    height: 750px;
    position: absolute;
  }


  .pic .b {
    position: absolute;
    top: 155px;
   left: 140px;
  }

  .show .b .el-button {
    width: 140px;
    margin: 20px;
    font-size: 16px;
  }

  .pic .b .el-button {
    width: 140px;
    height: 44px;
    background-color: #002c5f;
    border: #002C5F;
    font-size: 16px;
  }

  .pic .b .el-button:hover {
    background-color: #00AAD2;
  }



  .qz {
    margin: 25px;
    font-size: 20px;
    color: #333333;
  }

  .bg {
    padding: 40px 0px;


  }

  .dr {
    width: 100%;
    position: sticky;
    top: 0px;
    z-index: 100;
  }

  h1 {
    font-size: 40px;
    font-weight: 400;
    color: #333333;
    margin-top: 100px;
  }

  .el-menu-demo {
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;

  }

  .el-menu-item {
    line-height: 60px;
    width: 15%;
    font-size: 16px;
    color: #333333;
  }



</style>
<style>
  .carshow .el-carousel__container {
    width: 1120px;
    height: 500px;
  }

  .carshow .el-carousel__item {
    width: 1120px;
    height: 500px;
  }

  .carshow .el-carousel {
    width: 1120px;
    height: 500px;
  }

  .yuyue-item .el-form-item__content {
    display: flex;
    flex-flow: row;
    align-items: flex-start;
  }
</style>
