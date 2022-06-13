<template>
	<view>
		<view class="head-icon1" style="margin-top: 5%;">
			<view class="icon1">
				<view class="icon2" style="	background-color: #fd8c04;">
					<image src="../../static/Carimage/shangdian-.png" mode=""></image>
				</view>
				<text style="margin-top: 5rpx;">旗舰店</text>
			</view>
			<view class="icon1">
				<view class="icon2" style="background-color: #ec5858;">
					<image src="../../static/Carimage/renminbi.png" mode=""></image>
				</view>
				<text style="margin-top: 5rpx;">购车返现</text>
			</view>
			<view class="icon1" @click="goMap()">
				<view class="icon2" style="background-color: #fecd1a;">
					<image src="../../static/Carimage/home.png" mode=""></image>
				</view>
				<text style="margin-top: 5rpx;">必看好店</text>
			</view>
			<view class="icon1">
				<view class="icon2" style="background-color: #bbe1fa;">
					<image src="../../static/Carimage/1.png" mode=""></image>
				</view>
				<text style="margin-top: 5rpx;">1成首付</text>
			</view>
			<view class="icon1">
				<view class="icon2" style="background-color: #6886c5;">
					<image src="../../static/Carimage/qianbao.png" mode=""></image>
				</view>
				<text style="margin-top: 5rpx;">分期购车</text>
			</view>
		</view>
		<view class="head-icon1" style="margin-top: 2%;">
			<view class="icon1" @click="Viewcar()">
				<view class="icon2">
					<image src="../../static/Carimage/car-full.png" mode=""></image>
				</view>
				<text style="">条件选车</text>
			</view>
			<view class="icon1">
				<view class="icon2">
					<image src="../../static/Carimage/paihangbang.png" mode=""></image>
				</view>
				<text style="">销量排行</text>
			</view>
			<view class="icon1">
				<view class="icon2">
					<image src="../../static/Carimage/icon-test.png" mode=""></image>
				</view>
				<text style="">7步买车</text>
			</view>
			<view class="icon1">
				<view class="icon2">
					<image src="../../static/Carimage/biaoqian.png" mode=""></image>
				</view>
				<text style="">快捷选车</text>
			</view>
			<view class="icon1">
				<view class="icon2">
					<image src="../../static/Carimage/jisuanqi.png" mode=""></image>
				</view>
				<text style="">购车计算</text>
			</view>
		</view>
		<view class="car-show" style="margin-top: 6%;">
			<view class="car-show1">
				<view class="car-show2">
					<h4>购车福利</h4>
					<view class="car-show3">
						
						<view class="car-show4" v-for="(item,index) in line1">
							<image :src="item.showimg" mode=""></image>
							<h5>{{item.shortName}}</h5>
							<text style="color: #fd8c04; ">{{index==0?"抽惊喜大礼":"领现金包"}}</text>
						</view>
						
					</view>
				</view>
				<view class="car-show2">
					<h4>新车上市</h4>
					<view class="car-show3">
						<view class="car-show4" v-for="(item,index) in line2">
							<image :src="item.showimg" mode=""></image>
							<h5>{{item.shortName}}</h5>
							<text style="color: #fd8c04; ">{{index==0?"全新车型":"全新款式"}}</text>
						</view>
					</view>
				</view>
			</view>
			<view class="car-line"></view>
			<view class="car-show1">
				<view class="car-show2">
					<h4>销量冠军</h4>
					<view class="car-show3">
						<view class="car-show4" v-for="(item,index) in line3">
							<image :src="item.showimg" mode=""></image>
							<h5>{{item.shortName}}</h5>
							<text style="color: #fd8c04; ">{{index==0?"年度销量王":"季度销量王"}}</text>
						</view>
					</view>
				</view>
				<view class="car-show2">
					<h4>活动车型</h4>
					<view class="car-show3">
						<view class="car-show4" v-for="(item,index) in line4">
							<image :src="item.showimg" mode=""></image>
							<h5>{{item.shortName}}</h5>
							<text style="color: #fd8c04; ">{{index==0?"3年免息":"0首付立享"}}</text>
						</view>
					</view>
				</view>
			</view>
		</view>
		<view class="uni-product-list">
			<view class="uni-product" v-for="(item,index) in productList" :key="index">
				<view class="image-view">
					<image v-if="renderImage" class="uni-product-image" :src="item.img"></image>
				</view>
				<h5 class="uni-product-title">{{item.name}}</h5>
				<view class="uni-product-price">
					<text class="uni-product-price-favour">{{item.money/10000}}万¥起</text>
					<h5 class="uni-product-price-original">奔驰/{{type[item.type-1]}}</h5>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import loadRefresh from '@/components/load-refresh/load-refresh.vue'
	export default {
		components: {
			loadRefresh
		},
		data() {
			return {
				title: 'product-list',
				productList: [],
				type: ["轿车", "SUV", "跑车", "MPV", "纯电动"],
				line1:[],
				line2:[],
				line3:[],
				line4:[],
				renderImage: false
			}
		},
		methods: {
			goMap(){
				uni.navigateTo({
					url: "../map/map"
				})
			},

			Viewcar() {
				uni.navigateTo({
					url: "../car/car"
				})
			}
		},
		onLoad() {

			uni.request({
				url: 'http://47.100.136.15:8087/car/list', //仅为示例，并非真实接口地址。
				data: {
					page: 0,
				},
				success: (res) => {

					
					this.line1=res.data.line1;
					this.line2=res.data.line2;
					this.line3=res.data.line3;
					this.line4=res.data.line4;
					this.productList = res.data.data;
				}
			});


			setTimeout(() => {
				this.renderImage = true;
			}, 300);


		},
		
		onReachBottom() {
			let that = this;
			this.page = this.page + 1

			uni.request({
				url: 'http://47.100.136.15:8087/car/list', //仅为示例，并非真实接口地址。
				data: {
					page: this.page,
				},
				success: (res) => {

					let morearr = res.data.data;

					if (morearr != null && morearr.length > 0) {
						that.productList.push(...morearr);

					}

					if (morearr == null || morearr.length < 4) {
						uni.showToast({
							title: '没有更多了',
							icon: 'none',
							duration: 1000
						});
					}
				}
			});


		}

	}
</script>

<style>
	view {
		font-size: 28upx;
	}

	.uni-product-list {
		display: flex;
		width: 100%;
		flex-wrap: wrap;
		flex-direction: row;
		background-color: #F8F8F8;
		margin-top: 5%;
		justify-content: start;

	}

	.uni-product {
		width: 42%;
		padding: 3%;
		margin: 2% 1% 0 1%;
		display: flex;
		flex-direction: column;
		background-color: #ffffff;
		align-items: center;

		box-shadow: #EEEEEE 0rpx 0rpx 2rpx 2rpx;
		border-radius: 15rpx;
	}

	.image-view {
		height: 180rpx;
		width: 280rpx;
	}

	.uni-product-image {
		height: 155rpx;
		width: 320rpx;
		margin-left: -10%;
	}

	.uni-product-title {
		width: 260rpx;
		word-break: break-all;
		display: -webkit-box;
		overflow: hidden;
		line-height: 1.5;
		text-overflow: ellipsis;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
	}

	.uni-product-price {
		width: 260rpx;
		margin-top: 5rpx;
		font-size: 28rpx;
		line-height: 1.5;
		position: relative;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}

	.uni-product-price-original {
		color: #fc8621;
	}

	.uni-product-price-favour {
		color: #888888;
	}

	.car-msg1 {
		width: 50%;
		height: 300rpx;
		border-radius: 15rpx;
		background-color: #eff8ff;
	}

	.car-msg {
		display: flex;
		flex-direction: row;
		justify-content: center;
	}

	.content {
		margin-top: 5%;
		width: 100%;
		height: 100%;
	}

	.car-line {
		width: 95%;
		height: 2rpx;
		background-color: #5eaaa8;
		opacity: 0.2;
	}

	.car-show4 image {
		margin-top: 5%;
		width: 150rpx;
		height: 100rpx;
	}

	.car-show4 {
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.car-show3 {
		width: 100%;
		height: 200rpx;
		display: flex;
		flex-direction: row;
	}

	.car-show2 h4 {
		margin-top: 5%;
		margin-left: 5%;
	}

	.car-show2 {
		width: 50%;
		height: 100%;
		display: flex;
		flex-direction: column;
	}

	.car-show1 {
		width: 100%;
		height: 50%;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}

	.car-show {
		width: 84%;
		height: 550rpx;
		margin-left: 5%;
		margin-top: 5%;
		box-shadow: #eeeded 0rpx 0rpx 6rpx 6rpx;
		border-radius: 15rpx;
		display: flex;
		padding: 3%;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.icon1 {
		width: 120rpx;
		height: 130rpx;
		margin-top: 10rpx;
		margin-left: 15rpx;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.icon2 {
		width: 95rpx;
		height: 95rpx;
		display: flex;
		border-radius: 25rpx;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.icon1 image {
		width: 60rpx;
		height: 60rpx;
	}

	.head-icon1 {
		width: 100%;
		height: 120rpx;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		padding: 10rpx 0;
	}
</style>
