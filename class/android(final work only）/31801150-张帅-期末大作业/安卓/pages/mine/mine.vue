<template>
	<view>
		<view class="header">
			<view class="admin">
				<image src="../../static/img/benz1.png" class="admin-img"></image>
			</view>
			<view>
				<view style="color: #ffffff;" @click="login" >{{loginmsg===''?'点击登录':loginmsg }}</view>
				
			</view>
		</view>
		<swiper class="image-container" circular autoplay @change="swiperChange">
			<swiper-item :class="currentIndex == index ? 'swiper-item' : 'swiper-item-side'" v-for="(item, index) in imgList"
			 :key="item[urlKey]">
				<image @click="clickImg(item)" :class="currentIndex == index ? 'item-img' : 'item-img-side'" :src="item[urlKey]"
				 lazy-load :style="dontFirstAnimation ? 'animation: none;' : ''" mode="aspectFill"></image>
			</swiper-item>
		</swiper>

		<view class="item">
			<view class="item-title">
				个人信息
			</view>
			<view class="item-icons" >
				<view class="item-iconitem" @click="toStar">
					<image src="../../static/img/star.png" class="item-icon"></image>
					<view class="">
						我的关注
					</view>
				</view>
				<view class="item-iconitem" @click="toLike">
					<image src="../../static/img/like.png" class="item-icon"></image>
					<view class="">
						我的点赞
					</view>
				</view>
				<view class="item-iconitem" @click="toAct">
					<image src="../../static/img/activity.png" class="item-icon"></image>
					<view class="">
						我的活动
					</view>
				</view>
				<view class="item-iconitem" @click="buycar">
					<image src="../../static/img/gift.png" class="item-icon"></image>
					<view class="">
						我的订单
					</view>
				</view>
			</view>
		</view>


		<view class="item">
			<view class="item-title">
				我的Benz
			</view>
			<view class="item-icons">
				<view class="item-iconitem" @click="toAdd">
					<image src="../../static/img/add.png" class="item-icon"></image>
					<view class="">
						我的爱车
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/img/safe.png" class="item-icon"></image>
					<view class="">
						爱车保险
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/img/baoyang.png" class="item-icon"></image>
					<view class="">
						预约保养
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/img/repair.png" class="item-icon"></image>
					<view class="">
						爱车报修
					</view>
				</view>
			</view>
		</view>


		<view class="item">
			<view class="item-title">
				基础设置
			</view>
			<view class="item-icons">
				<view class="item-iconitem">
					<image src="../../static/img/feedback.png" class="item-icon"></image>
					<view class="">
						信息反馈
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/img/setting.png" class="item-icon"></image>
					<view class="">
						我的设置
					</view>
				</view>

			</view>
		</view>

		<view class="loginout" @click="loginOut" v-show="loginmsg!=''">
			退出登录
		</view>





	</view>
</template>

<script>
	
	export default {
		data() {
			return {
				currentIndex: 0,
				dontFirstAnimation: true,
				themeColor: '#33CCCC',
				urlKey: "url",
				imgList: [{
						url: '../../static/img/AD1.jpg',
						id: 1
					}, {
						url: '../../static/img/ad2.jpg',
						id: 2
					},

				],
				bindCarMsg:false,
				loginmsg: null
			}
		},

		onShow() {
			let that=this;
			this.loginmsg = uni.getStorageSync("name");
			if(this.loginmsg!="")
			{
				uni.request({
				    url: 'http://47.100.136.15:8087/owner/find', //仅为示例，并非真实接口地址。
				    data: {
				      id: that.loginmsg
				    },
				    success: (res) => {
						console.log(res.data)
						if(res.data.port=="200")
							that.bindCarMsg=true;
						else
							that.bindCarMsg=false;
				    }
				});
			}
			
				
			
				this.$forceUpdate()
		},

		
		
	

		methods: {
			toStar(){
				if(this.loginmsg=='')
				{
					uni.showToast({
						title: '请先登录！',
						icon: 'none',
						duration: 500
					});
				}else{
				uni.navigateTo({
					url:"../star/star"
				})
				}
			},
			
			toAdd(){
				if(this.loginmsg=='')
				{
					uni.showToast({
						title: '请先登录！',
						icon: 'none',
						duration: 500
					});
				}else{
					if(this.bindCarMsg==false)
					{
						uni.navigateTo({
							url:"../addcar/addcar"
						})
					}
					else{
						uni.showToast({
							title: '您已经提交信息，请等待审核',
							icon: 'none',
							duration: 2000
						});
					}
				}
			},
			
			
			buycar(){
				if(this.loginmsg=='')
				{
					uni.showToast({
						title: '请先登录！',
						icon: 'none',
						duration: 500
					});
				}else{
				uni.navigateTo({
					url:"../buycar/buycar"
				})
				}
			},
			
			toAct(){
				if(this.loginmsg=='')
				{
					uni.showToast({
						title: '请先登录！',
						icon: 'none',
						duration: 500
					});
				}else{
				uni.navigateTo({
					url:"../myact/myact"
				})
				}
			},
			
			toLike(){
				if(this.loginmsg=='')
				{
					uni.showToast({
						title: '请先登录！',
						icon: 'none',
						duration: 500
					});
				}else{
				uni.navigateTo({
					url:"../like/like"
				})
				}
			},
			
			
			login() {
				if(this.loginmsg=='')
				uni.navigateTo({
					url: "../login/login"
				})
			},
			swiperChange(e) {
				this.dontFirstAnimation = false
				this.currentIndex = e.detail.current
			},
			clickImg(item) {
				this.$emit('selected', item, this.currentIndex)
			},
			loginOut() {
				let that=this;
				if (this.loginmsg!='') {
					uni.showModal({
						title: '提示',
						content: '您确定要退出吗？',
						success: function(res) {
							if (res.confirm) {
								uni.removeStorageSync('name');
								uni.navigateTo({
									url:"../search/search"
								})
							} else if (res.cancel) {
								console.log('用户点击取消');
							}
						}
					});
				}
			}

		}
	}
</script>

<style>
	page {
		background-color: #f7f7f7;
	}

	.loginout {
		color: #ff0000;
		background-color: #ffffff;
		font-size: 36rpx;
		padding: 20rpx 0;
		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		margin-bottom: 50rpx
	}

	.item-title {
		width: 25%;

		font-size: 28rpx;
		font-weight: 800;

	}


	.item-iconitem {
		width: 25%;
		height: 130rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}

	.item-icons {

		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: start;
		align-items: center
	}

	.item-icon {

		width: 50rpx;
		height: 50rpx;
		margin: 10rpx;
	}

	.item {
		background-color: #ffffff;
		border-radius: 10rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: flex-start;
		font-size: 24rpx;
		padding: 20rpx;
		box-shadow: #eeeeee 0rpx 0rpx 2rpx 2rpx;
		margin: 30rpx 0;
	}

	.header {
		width: 100%;
		height: 400rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		background-image: url(../../static/img/bg.jpg);
		background-size: cover;
	}

	.admin {
		background-color: #ffffff;
		border-radius: 70rpx;
		width: 150rpx;
		height: 150rpx;
		margin: 30rpx;
		box-shadow: #eeeeee 0rpx 0rpx 3rpx 3rpx;
	}

	.admin-img {
		width: 150rpx;
		height: 150rpx;

	}

	uni-page-body,
	#app {

		width: 100%;


	}

	.image-container {
		margin-top: 30rpx;
		width: 100%;
		height: 250rpx;
		background-color: #ffffff;

	}

	.item-img {
		width: 95%;
		height: 90%;
		border-radius: 5rpx;
		animation: to-big .3s;
	}

	.swiper-item {
		width: 95%;
		height: 90%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.item-img-side {
		width: 95%;
		height: 90%;
		border-radius: 5rpx;
		animation: to-mini .3s;
	}

	.swiper-item-side {
		width: 95%;
		height: 90%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	@keyframes to-mini {
		from {
			height: 90%;
		}

		to {
			height: 90%;
		}
	}

	@keyframes to-big {
		from {
			height: 90%;
		}

		to {
			height: 90%;
		}
	}
</style>
