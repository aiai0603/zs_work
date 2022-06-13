<template>
	<view>
		<view class="end-cont listCount" >
		<view class="list"  v-for="(item,index) in newsad">
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>
			
					<view class="listword">
			
						<view>{{item.title}}</view>
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">
			
					<view class="listword-2">
			
						<view>{{item.title}}</view>
			
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>
			
					</view>
			
				</view>
			
			
				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>
			
				</view>
			
			
			
				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
				
			</view>
			
			<view class="more" >
				暂无更多
			</view>
			
			
		
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
				
			}
		},
		onLoad(option) {
			if(option.kind==1)
			uni.setNavigationBarTitle({
			    title:'新闻资讯'
			})
			else if(option.kind==2)
			uni.setNavigationBarTitle({
			    title:'奔驰设计'
			})
			else if(option.kind==3)
			uni.setNavigationBarTitle({
			    title:'爱车课堂'
			})
			else if(option.kind==4)
			uni.setNavigationBarTitle({
			    title:'走进AMG'
			})	
			else if(option.kind==5)
			uni.setNavigationBarTitle({
			    title:'奔驰历史'
			})
			else if(option.kind==6)
			uni.setNavigationBarTitle({
			    title:'奔驰理念'
			})
	
			let that = this;
			
			
			uni.request({
				url: 'http://47.100.136.15:8087/passage/more', //仅为示例，并非真实接口地址。
				data: {
					kind:option.kind
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
	
	.nomore {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		height: 100rpx;
		border-bottom: #C0C0C0 1rpx solid;
	
	
	}
	
	.video {
		width: 98%;
		margin: 20rpx 0;
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
