<template>
	<view>
		<view class="item">
			<view class="item-title">
				我的Benz
			</view>
			<view class="item-icons">
				<view class="item-iconitem" @click="toAdd()">
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
				服务中心
			</view>
			<view class="item-icons">
				<view class="item-iconitem">
					<image src="../../static/serviceutils/rank.png" class="item-icon"></image>
					<view class="">
						销量排行
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/choice.png" class="item-icon"></image>
					<view class="">
						快捷选车
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/sell.png" class="item-icon"></image>
					<view class="">
						我要卖车
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/wrong.png" class="item-icon"></image>
					<view class="">
						违章查询
					</view>
				</view>
			</view>
			<view class="item-icons">
				<view class="item-iconitem">
					<image src="../../static/serviceutils/jisuan.png" class="item-icon"></image>
					<view class="">
						购车计算
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/price.png" class="item-icon"></image>
					<view class="">
						爱车估值
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/zijia.png" class="item-icon"></image>
					<view class="">
						自驾短租
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/fadan.png" class="item-icon"></image>
					<view class="">
						罚单缴纳
					</view>
				</view>
			</view>
			<view class="item-icons">
				<view class="item-iconitem">
					<image src="../../static/serviceutils/shoucang.png" class="item-icon"></image>
					<view class="">
						车型收藏
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/paizhao.png" class="item-icon"></image>
					<view class="">
						拍照识车
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/baike.png" class="item-icon"></image>
					<view class="">
						购车百科
					</view>
				</view>
				<view class="item-iconitem">
					<image src="../../static/serviceutils/duibi.png" class="item-icon"></image>
					<view class="">
						车型对比
					</view>
				</view>
			</view>
			
			<view v-if="more" class="more">
				<view class="moreService" @click="isMore">
					<text style="font-size: 24rpx;">更多服务</text>
					<image src="../../static/serviceutils/more.png" class="more-icon"></image>
				</view>
			</view>
			<view v-else class="item-more">
				<view class="item-icons">
					<view class="item-iconitem">
						<image src="../../static/serviceutils/haoche.png" class="item-icon"></image>
						<view class="">
							豪车试驾
						</view>
					</view>
					<view class="item-iconitem">
						<image src="../../static/serviceutils/jiayou.png" class="item-icon"></image>
						<view class="">
							加油优惠
						</view>
					</view>
					<view class="item-iconitem">
						<image src="../../static/serviceutils/yaohao.png" class="item-icon"></image>
						<view class="">
							摇号查询
						</view>
					</view>
					<view class="item-iconitem">
						<image src="../../static/serviceutils/fenqi.png" class="item-icon"></image>
						<view class="">
							汽车分期
						</view>
					</view>
				</view>
				<view class="moreService" @click="takeBack">
					<text class="text">收起</text>
					<image src="../../static/serviceutils/takeback.png" class="more-icon"></image>
				</view>
			</view>
		</view>
		
		<swiper class="image-container" circular autoplay >
			<swiper-item :class="currentIndex == index ? 'swiper-item' : 'swiper-item-side'" v-for="(item, index) in imgList"
			 :key="item[urlKey]">
				<image  :class="currentIndex == index ? 'item-img' : 'item-img-side'" :src="item[urlKey]"
				 lazy-load :style="dontFirstAnimation ? 'animation: none;' : ''" mode="aspectFill"></image>
			</swiper-item>
		</swiper>
		
		<movable-area class="movableArea">
			<movable-view class="movableView" direction="all" x="600rpx" y="900rpx">
				<view class="open" :animation="animOpen" @click="isOpen">
					<image src="../../static/serviceutils/chat.png" class="icon"></image>
				</view>
				<view class="customer-service" :animation="animService" @click="chat">
					<image src="../../static/serviceutils/kefu.png" class="icon"></image>
				</view>
				<view class="request" :animation="animReq">
					<image src="../../static/serviceutils/request.png" class="icon"></image>
				</view>
				<!--<image src="../../static/serviceutils/chat.png" mode="widthFix" @click="open"></image>-->
			</movable-view>
		</movable-area>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				animOpen: {},
				animService: {},
				animReq: {},
				flag: true,
				more: true,
				bindCarMsg:false,
				currentIndex: 0,
				loginmsg:"",
				dontFirstAnimation: true,
				urlKey: "url",
				imgList: [{
						url: '../../static/serviceutils/img1.jpg',
						id: 1
					}, {
						url: '../../static/serviceutils/img2.jpg',
						id: 2
					}, {
						url: '../../static/serviceutils/img3.jpg',
						id: 3
					}
				
				],
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
			pop() {
				var animationOpen = uni.createAnimation({
					 duration: 400,
					 timingFunction: 'ease-out'
				})
				var animationService = uni.createAnimation({
					duration: 400,
					timingFunction: 'ease-out'
				})
				var animationReq = uni.createAnimation({
					duration: 400,
					timingFunction: 'ease-out'
				})
				
				animationOpen.rotateZ(180).step();
				animationReq.translate(0, -60).rotateZ(180).opacity(1).step();
				animationService.translate(0, -120).rotateZ(180).opacity(1).step();
				
				this.animOpen = animationOpen.export();
				this.animReq = animationReq.export();
				this.animService = animationService.export();
			},
			back() {
				var animationOpen = uni.createAnimation({
					 duration: 400,
					 timingFunction: 'ease-out'
				})
				var animationService = uni.createAnimation({
					duration: 400,
					timingFunction: 'ease-out'
				})
				var animationReq = uni.createAnimation({
					duration: 400,
					timingFunction: 'ease-out'
				})
				
				animationOpen.rotateZ(0).step();
				animationReq.translate(0, 0).rotateZ(0).opacity(0).step();
				animationService.translate(0, 0).rotateZ(0).opacity(0).step();
				
				this.animOpen = animationOpen.export();
				this.animReq = animationReq.export();
				this.animService = animationService.export();
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
			chat() {
				if(this.loginmsg=='')
				{
					uni.showToast({
						title: '请先登录！',
						icon: 'none',
						duration: 500
					});
				}else{
				uni.navigateTo({
					url: '../chat/chat'
				})
				}
			},
			isOpen() {
				if(this.flag){
					this.pop()
					this.flag = false
				}else{
					this.back()
					this.flag = true
				}
			},
			isMore() {
				this.more = false
			},
			takeBack() {
				this.more = true
			}
		}
	}
</script>

<style>
	page {
		background-color: #f7f7f7;
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
	.more {
		display: flex;
		flex-flow: row;
		font-size: 10rpx;
		font-weight: 600;
		width: 97%;
		justify-content: center;
		align-items: center;
	}
	.moreService {
		height: 50rpx;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	.more-icon {
		width: 25rpx;
		height: 25rpx;
		margin-left: 10rpx;
	}
	.image-container {
		margin-top: 30rpx;
		width: 100%;
		height: 250rpx;
		background-color: #ffffff;
	
	}
	.item-more {
		width: 100%;
		display: flex;
		flex-flow: column;
		justify-content: start;
		align-items: center
	}
	.text {
		font-weight: 600;
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
	
	.movableArea {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 95%;
	    pointer-events: none;
	}
    .movableView {
	    pointer-events: auto;
		display: flex;
		justify-content: center;
		height: 500rpx;
		width: 120rpx;
	}
	.open {
		background-color: #3B4144;
		border-radius: 50%;
		width: 100rpx;
		height: 100rpx;
		position: absolute;
		z-index: 100;
		display: flex;
		justify-content: center;
		align-items: center;
		bottom: 10%;
	}
	.customer-service {
		background-color: #3B4144;
		width: 100rpx;
		height: 100rpx;
		border-radius: 50%;
		position: absolute;
		display: flex;
		justify-content: center;
		align-items: center;
		bottom: 10%
	}
	.request {
		background-color: #3B4144;
		width: 100rpx;
		height: 100rpx;
		border-radius: 50%;
		position: absolute;
		display: flex;
		justify-content: center;
		align-items: center;
		bottom: 10%;
	}
	.icon {
		width: 50rpx;
		height: 50rpx;
	}
	
	
	
</style>
