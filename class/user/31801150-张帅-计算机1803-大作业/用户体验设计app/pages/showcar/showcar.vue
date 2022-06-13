<template>
	<view>
		<view class="under">
			<view class="underitem" style="background-color: #f0f0f0;" @click="Download()">
				下载资料
			</view>
			<view class="underitem" style="background-color: #cccccc;color: white;" @click="reportclick()">
				预约试驾
			</view>
			<view class="underitem" style="background-color: #007AFF;color: white;" @click="buy()">
				立即下单
			</view>
		</view>

		<view class="main-choose">
			　<view class="chooseitem" @tap="change2(0)" :class="{btna2:btnchoose== 0}">外饰</view>
			　<view class="chooseitem" @tap="change2(1)" :class="{btna2:btnchoose == 1}">内饰</view>
			　<view class="chooseitem" @tap="change2(2)" :class="{btna2:btnchoose == 2}">图片</view>　
		</view>
		<swiper :interval="3000" :duration="1000" :current="btnchoose" @change="changeTab"  style=" touch-action: none">
			<swiper-item>
				<view class="carback">
					<view class="end-cont" :class="{listCount:btnnum == 0}">

						<image src="../../static/img/red.png" mode="" class="carshow"></image>

						<view class="">
							长轴距A级车 中国红
						</view>
					</view>
					<view class="end-cont" :class="{listCount:btnnum == 1}">
						<image src="../../static/img/blue.png" mode="" class="carshow"></image>

						<view class="">
							长轴距A级车 夜空蓝
						</view>
					</view>
					<view class="end-cont" :class="{listCount:btnnum == 2}">
						<image src="../../static/img/black.png" mode="" class="carshow"></image>

						<view class="">
							长轴距A级车 魅影黑
						</view>
					</view>
					<view class="end-cont" :class="{listCount:btnnum == 3}">
						<image src="../../static/img/white.png" mode="" class="carshow"></image>

						<view class="">
							长轴距A级车 白
						</view>
					</view>
					<view class="main-title">
						　<view class="colotitem" @tap="change(0)" :class="{btna:btnnum == 0}" style="background-color: #FF0000;"></view>
						　<view class="colotitem" @tap="change(1)" :class="{btna:btnnum == 1}" style="background-color: #2C405A;"></view>
						　<view class="colotitem" @tap="change(2)" :class="{btna:btnnum == 2}" style="background-color: #222222;"></view>
						　<view class="colotitem" @tap="change(3)" :class="{btna:btnnum == 3}" style="background-color: white;"></view>
					</view>
				</view>
			</swiper-item>
			<swiper-item >
				<view class="carback">
					<view class="end-cont" :class="{listCount2:btnnum3 == 0}">

						<image src="../../static/img/inside2.jpg" mode="" class="insideshow"></image>

						<view>
							深色内饰
						</view>
					</view>
					<view class="end-cont" :class="{listCount2:btnnum3 == 1}">
						<image src="../../static/img/inside1.jpg" mode="" class="insideshow"></image>

						<view>
							浅色内饰
						</view>
					</view>

					<view class="main-title2">
						　<view class="colotitem" @tap="change3(0)" :class="{btna:btnnum3 == 0}" style="background-color: #ffffff;"></view>
						　<view class="colotitem" @tap="change3(1)" :class="{btna:btnnum3 == 1}" style="background-color: #2C405A;"></view>

					</view>
				</view>
			</swiper-item>
		
			<swiper-item>
				<view class="carphoto">
					<image class="czimg" v-for="(item,index) in cz" @tap="_previewImage(index)" :src="item" alt="" v-show="index!=8"></image>
					<div class="photomore">
						<div class="photoword">
							查看更多
						</div>
					</div>
				</view>
			</swiper-item>
			
		</swiper>
		<view class="title">

			<view style="margin-bottom: 10rpx">长轴距A级轿车</view>
			<h3 style="margin-bottom: 5rpx;">这才是新生代豪华轿车应有的样子</h3>
			<view style="margin-bottom: 30rpx;width: 100rpx;height:1rpx;border-bottom: #333333 2px solid;">

			</view>
			<view>颠覆标准</view>


		</view>
		<view class="indexback">
			<image src="../../static/img/cz1.jpg" mode=""></image>
			<view class="indexword">
				<view>北京奔驰</view>
				<view>21.18￥起/月供471</view>
			</view>
		</view>
		<view class="title">


			<h3 style="margin-bottom: 5rpx;">智能先锋</h3>
			<view style="margin-bottom: 30rpx;width: 100rpx;height:1rpx;border-bottom: #333333 2px solid;">

			</view>
			<view class="titleword">理念超前，与时俱进。 用智慧定义属于自己的未来，这才是新生代豪华轿车该有的样子</view>


		</view>
		<image src="../../static/img/a-1.jpg" alt="" style="width: 100%;height: 400rpx;"></image>
		<swiper :interval="3000" :duration="1000" class="swiper-box" indicator-dots="true">
			<swiper-item v-for="(item,index) in desp">
				<view class="despitem">
					<image :src="item.img" mode="" class="despimg"></image>
					<view class="desptitle">
						{{item.title}}
					</view>
					<view class="despword">
						{{item.passage}}
					</view>
				</view>
			</swiper-item>
		</swiper>

		<view class="title grey">


			<h3 style="margin-bottom: 5rpx;">颜值担当</h3>
			<view style="margin-bottom: 30rpx;width: 100rpx;height:1rpx;border-bottom: #333333 2px solid;">

			</view>
			<view class="titleword">前卫优雅，引领浪潮。 尽兴活出真我，这才是新生代豪华轿车该有的样子</view>


		</view>
		<image src="../../static/img/yz1.jpg" alt="" style="width: 100%;height: 450rpx;"></image>
		<swiper :interval="3000" :duration="1000" class="swiper-box grey bottom" indicator-dots="true">
			<swiper-item v-for="(item,index) in desp2">
				<view class="despitem">
					<image :src="item.img" mode="" class="despimg"></image>
					<view class="desptitle">
						{{item.title}}
					</view>
					<view class="despword">
						{{item.passage}}
					</view>
				</view>
			</swiper-item>
		</swiper>


		<uni-popup ref="popup" type="share">

			<view class="shareitem">
				<view class="share">
					<view>
						<image src="../../static/img/QQ.png" mode=""></image>
					</view>
					<view>
						<image src="../../static/img/wx.png" mode=""></image>
					</view>
					<view>
						<image src="../../static/img/dingding.png" mode=""></image>
					</view>

				</view>
				<button type="default" @click="quit">取消</button>
			</view>


		</uni-popup>

		<uni-popup ref="popup2">
			<view class="report">
				<h3 style="margin: 30rpx;">预约试驾</h3>
			
				<input placeholder="请输入2位以上真实姓名" @input="onInput1" :value="input.name"/>
				<view class="radiogroup">
					<label class="radio">
						<radio value="r1" :checked="input.sex===0"  @click="radio(0)"/>女士</label>
					<label class="radio">
						<radio value="r2" :checked="input.sex===1"  @click="radio(1)"/>男生</label>
				</view>
				<view class="tips" v-show="show1">请填写两位以上真实姓名</view>
				
			
				<input type="number" placeholder="请输入11位电话号码" @input="onInput2" :value="input.phone"/>
				<view class="tips" v-show="show2" maxlength="11">请填写11位手机号码</view>
				<view class="my-input">
					<view class="yt-list">
						<view class="yt-list-cell b-b">

							<text class="cell-tip" @click="toggleMaskLocation()">
								<text class="choose-text">{{input.address}}</text>
								<text class="iconfont icon-xiangxia"></text>
							</text>
						</view>
					</view>
					<gk-city :headtitle="headtitle" :provincedata="provincedata" :data="selfData" mode="cityPicker" ref="cityPicker"
					 @funcvalue="getpickerParentValue" :pickerSize="3"></gk-city>
				</view>
				<view class="buttonitems">
					<button type="default" @click="reportsubmit" :disabled="dis">提交</button>
					<button type="default" @click="quit2">取消</button>
				</view>
			</view>
		</uni-popup>
	</view>


</template>

<script>
	import provinceData from '@/common/city.data.js';
	export default {

		data() {
			return {
				dis:true,
				show1:false,
				show2:false,
				
				binhao:0,
				provincedata: [{
					text: '请选择',
					value: ''
				}],
				selfData: provinceData,
				headtitle: "请选择所在地",
				addressByPcrs: "请选择所在地",
				input:{
					userid:0,
					name:"",
					sex:0,
					phone:"",
					address:"请选择所在地",
					addressid:1,
					date:"-1",
					deleteflag:0
					
				},
				btnnum3: 0,
				btnnum: 0,
				btnchoose: 0,
				cz: ["../../static/img/cz1.jpg", "../../static/img/cz2.jpg", "../../static/img/cz3.jpg", "../../static/img/cz4.jpg",
					"../../static/img/cz5.jpg", "../../static/img/cz6.jpg", "../../static/img/cz7.jpg", "../../static/img/cz8.jpg",
					"../../static/img/cz9.jpg"
				],



				desp: [{
						img: "../../static/img/a-2.jpg",
						title: "我的未来，你好",
						passage: "这不是科幻电影，是能自主学习的MBUX。通过触摸屏、触控键、触摸板，或者仅仅一句“你好，奔驰”，你就能随时唤醒智能助手。"

					}, {
						img: "../../static/img/des2.jpg",
						title: "精彩，联袂上演",
						passage: "两块10.25英寸高清显示屏，打造科幻感十足的宽屏驾驶舱。左侧的数字仪表盘，三种显示风格由你随心定义，重要信息一览无余；右侧的媒体显示屏，能任你自由触控，乐享行车途中的无限精彩。"

					}, {
						img: "../../static/img/des3.jpg",
						title: "我的视界，大点更好",
						passage: "借助 Apple® CarPlay® 和百度Carlife®，手机上的应用也能被搬到你的爱车上来。没听完的音乐，在车上继续听；小屏幕的地图，放大看；有了智能手机互联系统，你的行车生活将变得更便捷、更有趣。"

					}, {
						img: "../../static/img/des4.jpg",
						title: "让我低头？不可能",
						passage: "在前方的风挡玻璃上，将关键信息尽收眼底， 使你能够专注于前方路况和交通状况，不用低头，自然高调。"

					}, {
						img: "../../static/img/des5.jpg",
						title: "放得下，蓄得上",
						passage: "随车安装的无线充电设备，支持所有符合Qi标准的手机。驾驶时间就是充电时间，随手一放，立马蓄上。"

					}, {
						img: "../../static/img/des6.jpg",
						title: "高手出招，一气呵成",
						passage: "找钥匙太麻烦？别担心。腾不出手？没关系。不用翻来找去，不必拿出钥匙， 长轴距A级轿车也能准确认出你，从此开启车门与后备箱，将变得更加轻松畅意。"

					}


				],


				desp2: [{
						img: "../../static/img/yz-2.jpg",
						title: "准备好成为全场焦点了吗？",
						passage: "前、后裙板精致优雅，侧身线条与迎宾踏板灵逸动人。颜值在线，气质出挑，你的每次登场，都能轻松成为焦点。"

					}, {
						img: "../../static/img/yz-3.jpg",
						title: "有颜，在先",
						passage: "在高级优雅的纯黑底色之下，点缀着如钻石般璀璨的星辰，与生俱来的灵动气质，走到哪里都是目光收割机！"

					}, {
						img: "../../static/img/yz-4.jpg",
						title: "灵光，一现",
						passage: "性感迷人的双眸，焕发出魅力十足的光芒，鹰眼般的LED大灯，节能不减性能，把每一刻，都变成你的高光时刻"

					}, {
						img: "../../static/img/yz-5.jpg",
						title: "美，有64种",
						passage: "64种色彩，在车内空间交汇出层次分明的美感。或热烈，或畅快，或静谧，或浪漫，不管什么样的车内气氛，全都由你来选。"

					}, {
						img: "../../static/img/yz-6.jpg",
						title: "声来，不同凡响。",
						passage: "这座移动音乐殿堂，由柏林之声为你倾情打造。精致的 Burmester 字样、高端的铝制饰条与前后排环绕立体音响，用不凡的细节带来声临其境的享受。"

					}


				]

			}
		},
		onNavigationBarButtonTap: function(e) {
			this.$refs.popup.open();
		},
		
		onLoad() {
			let id=uni.getStorageSync("name");
			this.input.userid=id;
		},

		methods: {
			
			onInput1(e){
				this.show1=(e.detail.value.length<2)	
				this.input.name=e.detail.value
				this.canSubmit()
			},
			
			onInput2(e){
				this.show2=(e.detail.value.length!=11)	
				this.input.phone=e.detail.value
				this.canSubmit()
			},
			
			
			canSubmit(){
				if(this.input.address!="请选择所在地"&&this.input.name.length!=0&&this.input.phone.length!=0&&!this.show1&&!this.show2)
				this.dis=false;
				else
				this.dis=true;
			},
			
			
			radio(e){
				this.input.sex=e;
				},
			toggleMaskLocation() {
				this.$refs["cityPicker"].show();
				
			},
			getpickerParentValue(data) {
				this.provincedata = data;
				this.input.address = data[0].text + " " + data[1].text + " " + data[2].text;
				this.canSubmit()
			},
			
			buy(){
				let id=uni.getStorageSync("name")
				if(id=="")
				uni.showToast({
					title: '请先登录！',
					icon: 'none',
					duration: 500
				});
				else
				{
					let id=1
				uni.navigateTo({
					url:"../count/count?id="+id
				})
				}
			},


			Download() {

				uni.showToast({
					icon: 'none',
					mask: true,
					title: '下载成功'
				});


			},
			reportclick: function() {
				let id=uni.getStorageSync("name")
				if(id=="")
				uni.showToast({
					title: '请先登录！',
					icon: 'none',
					duration: 500
				});
				else
				{
				this.$refs.popup2.open();
				}
			},

			reportsubmit() {
				this.$refs.popup2.close();
			
				let that = this;
				uni.request({
					url: 'http://47.100.136.15:8087/join/add', //仅为示例，并非真实接口地址。
					data: this.input,
					method: "POST",
					success: (res) => {
							uni.showToast({
								title: '提交成功,请关注你的短信',
								icon: 'none',
								duration: 1000
							});
					}
				});
				
				
			},


			quit2() {
				this.$refs.popup2.close()
			},



			quit() {
				this.$refs.popup.close()
			},
			change(e) {
				this.btnnum = e

			},

			change2(e) {
				this.btnchoose = e

			},
			change3(e) {
				this.btnnum3 = e

			},
			_previewImage(index) {

				uni.previewImage({
					urls: this.cz,
					current: this.cz[index]
				});
			},

			changeTab(e) {
				this.btnchoose = e.target.current

			},

		}
	}
</script>
<style lang="scss">
	/* 头条小程序组件内不能引入字体 */
	.yt-list {
		background: #fff;
	}

	.yt-list-cell-warnning {
		display: flex;
		padding: 10rpx 30rpx 10rpx 40rpx;
		color: red;
	}

	.yt-list-cell {
		display: flex;
		align-items: center;
		padding: 6px 12px 6px 17px;
		line-height: 70rpx;
		position: relative;

		&.cell-hover {
			background: #fafafa;
		}

		&.b-b:after {
			left: 30rpx;
			right: 30rpx;

		}

		.gray {
			flex: 1;
			font-size: 28rpx;
			margin-right: 10rpx;
			height: 25px;
			line-height: 20px;
			color: gray;
		}

		.cell-icon {
			height: 32rpx;
			width: 32rpx;
			font-size: 28rpx;
			color: #fff;
			text-align: center;
			line-height: 32rpx;
			background: #f85e52;
			border-radius: 4rpx;
			margin-right: 12rpx;

			&.hb {
				background: #ffaa0e;
			}

			&.lpk {
				background: #3ab54a;
			}

		}

		.cell-more {
			align-self: center;
			font-size: 28rpx;

			margin-left: 8rpx;
			margin-right: -10rpx;
		}

		.cell-tit {
			flex: 1;
			font-size: 14px;

			margin-right: 10rpx;
		}

		.money {


			font-weight: bold;
			margin-left: 10px;
		}

		.picker-class {
			display: inline-block;
		}

		.cell-tip {
			font-size: 14px;

			flex-direction: column;

		}

		&.desc-cell {
			.cell-tit {
				max-width: 90rpx;
			}
		}

		.desc {
			flex: 1;
			font-size: 14px;

		}
	}

	.b-b:after,
	.b-t:after {
		position: absolute;
		z-index: 3;
		bottom: 0;
		left: 0;
		right: 0;
		height: 0;
		content: '';
		-webkit-transform: scaleY(0.5);
		-ms-transform: scaleY(0.5);
		transform: scaleY(0.5);
		border-bottom: 1px solid #E4E7ED;
	}

	.red_color {
		color: red;
		display: inline-flex;
		padding-right: 6px;
	}
</style>


<style>
	
	.tips{
		align-self: flex-start;
		padding-left: 50rpx;
		font-size: 24rpx;
		margin-bottom: 20rpx;
		color: red;
		}
	
	h4{
		padding-left: 50rpx;
		align-self: flex-start;
	}
	.radiogroup{
		display: flex;
		flex-flow: row;
		justify-content:space-between;
		align-items: center;
		align-self: flex-start;
		width: 40%;
		padding: 10rpx 0 30rpx 50rpx;
	}
	
	.radio{
		font-size: 26rpx;
	}
	
	input {

		margin: 10rpx 50rpx;
		padding: 20rpx 0rpx 20rpx 0rpx;
		border-bottom: 1px solid #E4E7ED;
		width: 500rpx;
		font-size: 28rpx;
	}

	.my-input {

		font-size: 28rpx;
		width: 566rpx;

		margin-bottom: 30rpx;

	}

	textarea {
		margin: 20rpx;
		background-color: rgba(200, 200, 200, 0.1);
		padding: 20rpx;
		border-radius: 20rpx;
	}

	.buttonitems button {
		width: 40%;
		margin: 20rpx;
		font-size: 30rpx;

	}

	.buttonitems {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		width: 100%;

	}

	.report {
		padding: 20rpx 0;
		background-color: white;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}

	.bottom {
		padding-bottom: 100rpx;
	}

	.underitem {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		width: 25%;
		font-size: 26rpx;
		padding: 10rpx 0;


	}




	.under {
		background-color: white;
		position: fixed;
		bottom: 0;
		width: 100%;
		height: 80rpx;
		z-index: 1;
		display: flex;
		flex-flow: row;
		justify-content: space-around;
		align-items: center;
		box-shadow: #999999 5rpx 5rpx 5rpx 5rpx;


	}


	.grey {
		background-color: #F0F0F0;
	}

	.swiper-box {
		height: 1000rpx;

	}

	.despword {
		line-height: 50rpx;
		width: 90%;
		height: 100%;
		font-size: 28rpx;
		color: #999999;
	}

	.desptitle {
		margin: 10rpx 0;
		width: 90%;
		text-align: left;
	}

	.despimg {
		padding: 50rpx 0;
		width: 90%;

	}

	.despitem {
		width: 100%;
		margin-top: 50rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}

	.titleword {
		width: 70%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		text-align: center;
		font-size: 28rpx;
	}

	.shareitem {
		background-color: #fff;
		height: 350rpx;
	}

	.share {
		display: flex;
		flex-flow: row;
		justify-content: space-around;
		align-items: center;
		height: 70%;

	}

	.share image {

		width: 100rpx;
		height: 100rpx;
	}

	.title {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		padding: 50rpx 0;
		margin-top: 20rpx;
	}

	.indexword {
		display: flex;
		flex-flow: row;
		justify-content: space-around;
		align-items: center;
		color: white;
		padding: 20rpx 0;
	}

	.indexback {
		width: 100%;
		height: 620rpx;
		background-color: #333333;
		display: flex;
		flex-flow: column;
		justify-content: flex-end;

	}

	.indexback image {
		width: 100%;
	}


	.insideshow {
		width: 100%;
		height: 100%;
		margin-bottom: 10rpx;

	}

	.photomore {
		width: 32%;
		height: 32%;
		background: url(../../static/img/cz9.jpg);
		background-size: cover;
		border: 2rpx solid white;
		position: relative;


	}

	.photoword {
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		background-color: rgba(0, 0, 0, 0.6);
		z-index: 2;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		color: white;

		position: absolute;


	}


	.carphoto {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		width: 100%;
		flex-wrap: wrap;
		height: 100%;
		background-image: url(../../static/img/background.png);
		background-size: cover;

	}

	.czimg {
		width: 32%;
		height: 32%;
		border: 2rpx solid white;
	}

	.video {
		width: 95%;
		height: 90%
	}

	swiper {
		height: 600rpx;
	}

	.chooseitem {
		padding: 20rpx;
		width: 15%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;


	}

	.btna2 {
		font-weight: 800;
		border-bottom: #3F536E 2px solid;

	}

	.main-choose {
		background-color: #C0C0C0;
		display: flex;
		justify-content: center;


	}

	.carshow {
		margin: 50rpx 0;
		width: 80%;
		height: 80%;
	}

	.carback {

		background-image: url(../../static/img/background.png);
		background-size: cover;
		width: 100%;
		height: 100%;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;

	}

	.end-cont {
		display: none;

	}


	.listCount {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;
		color: #333333;
		font-weight: 800;
		height: 450rpx;

		justify-content: center;
		align-items: center;

	}


	.listCount2 {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;
		color: #333333;
		font-weight: 800;
		height: 500rpx;

		justify-content: center;
		align-items: center;

	}


	.main-title2 {
		display: flex;
		font-size: 32rpx;
		margin-top: 10rpx;
		justify-content: center;
		align-items: center;

	}



	.main-title {
		display: flex;
		font-size: 32rpx;
		margin-top: 40rpx;
		justify-content: center;
		align-items: center;

	}


	.colotitem {
		margin: 20rpx;
		width: 35rpx;
		height: 35rpx;
		border-radius: 35rpx;
		text-align: center;
		transform: 1s;

	}


	.btna {
		margin: 20rpx;
		width: 40rpx;
		height: 40rpx;
		border-radius: 40rpx;
		text-align: center;
		transform: 1s;
		box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 15rpx 15rpx;
	}






	uni-page-body,
	#app {

		width: 100%;


	}
</style>
