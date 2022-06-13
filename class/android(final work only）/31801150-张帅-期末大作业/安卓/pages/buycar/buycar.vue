<template>
	<view>
		<view class="end-cont listCount" >
		<view class="list"  v-for="(item,index) in newsad">
				<view class="listitem" >
					<image class="listimg" :src="item.img"></image>
			
					<view class="listword">
			
						<view>{{item.carname}}</view>
						<view  style="color:#555555;font-size: 30rpx;">{{item.kinname}}</view>
						<view style="color: #F0AD4E;">总价:¥{{item.money}}</view>
					</view>
			
				</view>
				<view class="state">
					<view>	首付  {{item.payfirst}} ¥ </view>
				
					<view>	月租  {{item.monthpay}} ¥  </view>
					<view>	状态  {{state[item.state]}}</view>
				
				</view>

		</view>
		<view class="more" >
			暂无更多
		</view>
		
		
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				newsad: [
				],
				state:["错误", "处理中","等待到店","备货","完成","取消"]
				
			}
		},
		onShow() {
			let id=uni.getStorageSync("name")
			
			let that=this;

			uni.request({
				url: 'http://47.100.136.15:8087/buycar/list', //仅为示例，并非真实接口地址。
				data: {
					id:id
				},
				success: (res) => {
					
					that.newsad = res.data.data;
				}
			});
		},
		methods: {
			topage(e){
				uni.navigateTo({
					url:"../page/page?id="+e
				})
			},
		}
	}
</script>

<style>
	.state{
		width: 94%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		flex-wrap: wrap;
		padding: 20rpx 0;
		border-bottom: #D3D3D3 1px solid;
		
	
	}
	.state view{
		font-size: 28rpx;
		color: #555555;
		display: flex;
		flex-flow: row;
		justify-content: start;
		align-items: center;
		width: 30%;
	}
	
	.nomore {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		height: 100rpx;
		border-bottom: #C0C0C0 1rpx solid;
	
	
	}
	
	
	
	.listlogoitem {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	
	}
	
	.listmore {
		font-size: 26rpx;
		color: #999999;
	}
	
	.listtopic {
		font-weight: 800;
		font-size: 36rpx;
	}
	
	.listlogo {
		width: 10rpx;
		height: 40rpx;
		background-color: #666666;
		margin-right: 10rpx;
	}
	
	.listtitle {
		padding-top: 50rpx;
		display: flex;
		flex-flow: row;
		justify-content: space-between;
		align-items: center;
		width: 93%;
		border-top: #c0c0c0 1rpx solid;
	}
	
	.listCount {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin-top: 10rpx;
	
		padding: 0rpx 3%;
	
	
	}
	
	.listCar {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;
	
	
	}
	
	.listword {
		width: 60%;
		margin-left: 3%;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;
	
	}
	
	.listimg-2 {
		margin: 20rpx 0;
		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: flex-start;
		align-items: center;
	}
	
	.listimg-2 image {
		width: 32%;
		margin-right: 1%;
	
		height: 150rpx;
	
	}
	
	.listword-2 {
		width: 100%;
		margin-bottom: 20rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;
	
	}
	
	.listpage-2 {
		width: 100%;
		margin-top: 20rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;
		font-size: 28rpx;
		color: #666666;
		line-height: 40rpx;
	}
	
	
	.listunder {
		width: 93%;
		color: #808080;
		font-size: 24rpx;
		display: flex;
		flex-flow: row;
		justify-content: space-between;
		padding-bottom: 20rpx;
		border-bottom: #C0C0C0 1rpx solid;
	
	}
	
	.listimg {
		width: 40%;
		height: 170rpx;
	}
	
	.listitem {
		width: 95%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		margin-bottom: 20rpx;
	}
	
	.list {
		margin-top: 30rpx;
		width: 100%;
	
	
	}
	


.more {
		display: flex;
		flex-flow: row;
		width: 97%;
		justify-content: center;
		align-items: center;
		height: 100rpx;
	}



	.listword {
		width: 60%;
		margin-left: 3%;
		display: flex;
		line-height: 60rpx;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;

	}

	.listunder {
		width: 93%;
		color: #808080;
		font-size: 24rpx;
		display: flex;
		flex-flow: row;
		justify-content: space-between;
		padding-bottom: 20rpx;
		border-bottom: #C0C0C0 1rpx solid;

	}

	.listimg {
		width: 50%;
		height: 170rpx;
	}

	.listitem {
		width: 95%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		margin-bottom: 20rpx;
	}

	.list {
		margin-top: 30rpx;
		width: 100%;


	}
	
	.listCount {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;
		padding: 0rpx 3%;
	
	}
	
	
	.listCar {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;
	
	
	}


</style>
