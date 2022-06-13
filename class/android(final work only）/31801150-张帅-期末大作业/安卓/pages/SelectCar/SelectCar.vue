<template>
	<view class="page-body" :style="'height:'+height+'px'">
		<scroll-view class="nav-left" scroll-y :style="'height:'+height+'px'" :scroll-top="scrollLeftTop" scroll-with-animation>
			<view class="nav-left-item" @click="categoryClickMain(index)" :key="index" :class="index==categoryActive?'active':''"
				v-for="(item,index) in classifyData">
				{{item.name}}
			</view>
		</scroll-view>
		<scroll-view class="nav-right" scroll-y :scroll-top="scrollTop" @scroll="scroll" :style="'height:'+height+'px'" scroll-with-animation>
			<view class="box1"  v-for="(item,index) in classifyData" :key="index">
                  <view class="title">{{item.name}}</view>
				  <view class="box">
					<view  class="nav-right-item" v-for="(type,i) in item.foods" :key="i">
						<view class="index-title">{{type.typeTitle}}</view>
						<view :class="example" v-for="(car,indexson) in type.type" :key="indexson" @click="cart(car.name)">
							<view>{{car.name}}</view>
						</view>
					</view>
				  </view>  
			</view>
		</scroll-view>
	</view>
</template>

<script>
	import classifyData from '../../common/classify.data.js';
	export default {
		data() {
			return {
				example:"nav-item-index",
				name: "wkiwi",
				height: 0,
				categoryActive: 0,
				scrollTop: 0,
				scrollLeftTop: 0,
				// scrollHeight: 0,
				classifyData:classifyData,
				arr:[0,0,0,0,0,0,0],//初始值，后边计算会根据手机适配覆盖
				leftItemHeight: 51,//49行会计算出新值进行覆盖
				navLeftHeight:0,//左边scroll-view 内层nav的总高度
				diff: 0,//左边scroll-view 内层nav的总高度与视口之差
				tabBarHeight:0,//如果此页面为Tab页面，自己改变高度值,,一般tab高度为51
			}
		},
		onLoad: function () {
			this.height = uni.getSystemInfoSync().windowHeight - this.tabBarHeight;
		},
		onReady() {
			this.getHeightList();
		},
		methods: {
			getHeightList(){
				let _this = this;
				let selectorQuery=uni.createSelectorQuery();
				selectorQuery.selectAll('.nav-left-item').boundingClientRect(function(rects) {
					_this.leftItemHeight  =  rects[0].height;
					_this.navLeftHeight = _this.leftItemHeight * classifyData.length;
					_this.diff =  _this.navLeftHeight - _this.height;
				});
				selectorQuery.selectAll('.box').boundingClientRect(function(rects) {
					let arr = [0];
					let top = 0;
					rects.forEach(function(rect){
	// 					rect.id      // 节点的ID
	// 					rect.dataset // 节点的dataset
	// 					rect.left    // 节点的左边界坐标
	// 					rect.right   // 节点的右边界坐标
	// 					rect.top     // 节点的上边界坐标
	// 					rect.bottom  // 节点的下边界坐标
	// 					rect.width   // 节点的宽度
	// 					rect.height  // 节点的高度
						top += rect.height;
						arr.push(top)
						})
						console.log(arr)
						_this.arr = arr
					}).exec()
			},
			scroll(e) {
				let _this = this
				if(this.timeoutId){
					clearTimeout(this.timeoutId);
				}
				this.timeoutId = setTimeout(function(){ //节流
					_this.scrollHeight = e.detail.scrollTop + 1 + _this.height/2;
					//+1不要删除，解决最后一项某种情况下翻到底部，左边按钮并不会切换至最后一个
					//若想使切换参考线为屏幕顶部请删除 _this.height/2
					for (let i = 0; i < _this.arr.length;i++) {
						let height1 = _this.arr[i];
						let height2 = _this.arr[i+1];
						if (!height2 || (_this.scrollHeight >= height1 && _this.scrollHeight < height2)) {
							_this.categoryActive = i;
							(_this.diff>0) && (_this.scrollLeftTop = Math.round((_this.categoryActive * _this.diff)/(classifyData.length-1)));
							return false;
						}
					}
					_this.categoryActive = 0;
					_this.timeoutId = undefined;
				}, 10)
			},
			categoryClickMain(index) {
				this.categoryActive = index;
				this.scrollTop == this.arr[index] ? this.scrollTop = this.scrollTop+1 : this.scrollTop = this.arr[index]//防止两次相等造成点击不触发滚动时间
			},
			cart: function (text) {
				uni.showToast({
					title: text,
					icon: "none",
				})
			}
		},
		components: {
		}
	}
</script>

<style>
	.index-title{
		font-size: 30rpx;
		font-weight: bold;
		height: 70rpx;
		padding-top: 15rpx;
	}
	.box1{
		padding-top: 20rpx;
	}
	.title{
		margin-left: 30rpx;
		font-size: 40rpx;
		font-weight: bold;
	}
	.page-body {
		display: flex;
		background: #fff;
		overflow: hidden;
	}

	.nav {
		display: flex;
		width: 100%;
	}

	.nav-left {
		width: 25%;
		background: #fafafa;
	}

	.nav-left-item {
		height: 100upx;
		border-right: solid 1px #f1f1f1;
		border-bottom: solid 1px #f1f1f1;
		font-size: 30upx;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.nav-left-item:last-child{
		border-bottom: none;
	}
	.nav-right {
		width: 75%;
	}
	.box {
        padding-left: 30rpx;
		padding-top: 30rpx;
		display: block;
		overflow: hidden;
		border-bottom: 20upx solid #f3f3f3;
		display: flex;
		flex-direction: column;		
		/*min-height: 100vh;*/
		/*若您的子分类过少想使得每个子分类占满屏请放开上边注视 */
	}
	.box:last-child {
		border: none;
		min-height:100vh;
	}
	.nav-item-index1{
		box-shadow: #eeeded 1rpx 1rpx 2rpx 2rpx;		
		min-width: 120rpx;
		height: 80rpx;
		border-radius: 10rpx;
		float: left;
		margin: 15rpx;
		text-align: center;
		font-size: 23rpx;
		background-color: #93abd3;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding: 10rpx;
	}
	.nav-item-index{
		box-shadow: #eeeded 1rpx 1rpx 2rpx 2rpx;		
		min-width: 120rpx;
		height: 80rpx;
		border-radius: 10rpx;
		float: left;
		margin: 15rpx;
		text-align: center;
		font-size: 23rpx;
		background-color: #eff8ff;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding: 10rpx;
	}
	.nav-right-item {
		width: 100%;
		height: auto;
	}
	.active {
		color: #000000;
		font-weight: bold;
		background: #fff;
		border-right: 0;
	}
	::-webkit-scrollbar {/*取消小程序的默认导航条样式*/
   width: 0;
   height: 0;
   color: transparent;
}
</style>
