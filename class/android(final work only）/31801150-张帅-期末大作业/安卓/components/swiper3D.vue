<template>
	<view style="width: 100%;">
		<view class="swiperbox" @touchstart="start" @touchend="end">
			<view class="swiperitem" :animation="item.aData[0]" v-for="(item, index) in imgList" :key="index" :style="{ zIndex: index == currentIndex ? 4 : item.issecond ? 3 : item.ishide ? 1 : 2 }"
			 @tap="toPage(item)">
				<image :src="item.src" mode=""></image>
				<view class="title">
					{{item.title}}
				</view>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		props: {
			imgList: {
				type: Array,
				default () {
					return []
				}
			},
			currentIndexParameter: {
				type: Number,
				default: 1
			}, //默认放在中间的图片
			movewidthParameter: {
				type: Number,
				default: 0.4
			}, //图片位移
			haveUrl: {
				type: Boolean,
				default: true
			}, //是否进行页面的跳转
			openTypeParameter: {
				type: String,
				default: "navigate"
			},
		},
		data() {
			return {
				startData: {
					clientX: ''
				}, //确定左滑右滑
				movewidth: 0,
				currentIndex: 1
			};
		},
		created: function() {
			var that = this
			uni.getSystemInfo({
				success: function(res) {
					that.movewidth = res.windowWidth * that.movewidthParameter; //设置图片位移
					that.currentIndex = that.currentIndexParameter
					for (var i = 0; i < that.imgList.length; i++) {
						//设置显示图层和隐藏多余图片
						var animation = uni.createAnimation({
							duration: 1000,
							timingFunction: 'ease'
						});
						that.imgList[i].aData = [{}, animation]; //item.aData[0] 动画控制代表元素 item.aData[1] 动画声明代表动画
						that.imgList[i].ishide = true;
						that.imgList[i].issecond = false;
						if (i == 0) {
							that.toleftA(0, that.imgList[0].aData[1]);
						} else if (i == 2) {
							that.torightA(2, that.imgList[2].aData[1]);
							that.imgList[2].issecond = true;
						} else if (i == 1) {
							that.tomidA(1, that.imgList[1].aData[1]);
						} else {
							that.tohide(i, that.imgList[i].aData[1]);
						}
					}
				}
			});


		},
		methods: {
			toPage(item) {
				if (this.haveUrl && item.url && this.openTypeParameter == 'navigate') {
					uni.navigateTo({
						url: item.url
					})
				} else if (this.haveUrl && item.url && this.openTypeParameter == 'switchTab') {
					uni.switchTab({
						url: item.url
					})
				}
			},
			start(e) {
				this.startData.clientX = e.changedTouches[0].clientX;
			},
			end(e) {
				//thisIndex 移动前当前选中 leftIndex 移动前左边 rightIndex 移动前右边  showindex 移动前需要去左边显示的index
				var thisIndex = this.currentIndex;
				const subX = e.changedTouches[0].clientX - this.startData.clientX;
				let leftIndex = thisIndex == 0 ? this.imgList.length - 1 : thisIndex - 1;
				let rightIndex = thisIndex == this.imgList.length - 1 ? 0 : thisIndex + 1;
				if (subX > 20) {
					// console.log('右滑');
					let showindex = leftIndex == 0 ? this.imgList.length - 1 : leftIndex - 1;
					this.currentIndex = leftIndex;
					this.imgList[rightIndex].issecond = false;
					this.imgList[rightIndex].ishide = true;
					this.imgList[thisIndex].issecond = true;
					this.imgList[showindex].ishide = false;
					this.tohide(rightIndex, this.imgList[leftIndex].aData[1]);
					this.torightA(thisIndex, this.imgList[thisIndex].aData[1]);
					this.tomidA(leftIndex, this.imgList[leftIndex].aData[1]); //移动到中间显示
					this.toleftA(showindex, this.imgList[showindex].aData[1]);
				} else if (subX < -20) {
					// console.log('左滑');
					let showindex = rightIndex == this.imgList.length - 1 ? 0 : rightIndex + 1;
					this.currentIndex = rightIndex;
					this.imgList[thisIndex].issecond = true;
					this.imgList[showindex].ishide = false;
					this.imgList[leftIndex].issecond = false;
					this.imgList[leftIndex].ishide = true;
					this.tohide(leftIndex, this.imgList[leftIndex].aData[1]);
					this.toleftA(thisIndex, this.imgList[thisIndex].aData[1]);
					this.tomidA(rightIndex, this.imgList[rightIndex].aData[1]);
					this.torightA(showindex, this.imgList[leftIndex].aData[1]);
				}
			},
			tomidA: function(index, animation) {
				animation
					.rotateY(0)
					.scale(1)
					.translateX(0)
					.opacity(1)
					.step();
				this.imgList[index].aData[0] = animation.export();
			},
			toleftA: function(index, animation) {
				animation
					.rotateY(30)
					.scale(0.9)
					.translateX(-this.movewidth)
					.opacity(1)
					.step();
				this.imgList[index].aData[0] = animation.export();
			},
			torightA: function(index, animation) {
				animation
					.rotateY(-30)
					.scale(0.9)
					.translateX(this.movewidth)
					.opacity(1)
					.step();
				this.imgList[index].aData[0] = animation.export();
			},
			tohide: function(index, animation) {
				animation
					.opacity(0)
					.step();
				this.imgList[index].aData[0] = animation.export();
			}
		}
	};
</script>
<style>
	.title {
		width: 100%;
		height: 80RPX;
		text-align:center;
		display: flex;
		justify-content: center;
		align-items: center;
		
		font-weight: 800;
		background-color: #F0F0F0;
		margin: 0rpx;

	}

	.app-warp {
		width: 100%;
		height: 180rpx;
		position: relative;
		text-align: center;

	}

	.app-warp .logo {
		width: 58rpx;
		height: 58rpx;
		margin: 0 auto;
		position: relative;
		top: 80rpx;
	}

	.swiperbox {
		position: relative;
		width: 100%;
		height: 500rpx;

	}

	.swiperitem {
		position: absolute;
		top: 0;
		left: 50%;
		margin-left: -300rpx;
		width: 600rpx;
		height: 100%;
		background-color: #F0F0F0;
		z-index: 3;
		box-shadow: #c0c0c0 0px 5rpx 5rpx 5rpx;
	}

	.swiperitem image {
		width: 100%;
		height: 80%;
		
	}

	.name {

		position: relative;
		top: 160rpx;
		color: #98e9f0;
		text-shadow: 0px 0px 16rpx #98e9f0, 0px 0px 80rpx #98e9f0, 0px 0px 140rpx #98e9f0, 0px 0px 300rpx #98e9f0;
	}
</style>
