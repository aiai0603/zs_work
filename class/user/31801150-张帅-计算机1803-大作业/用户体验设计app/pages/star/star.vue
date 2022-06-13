<template>
	<view>
		<uni-list>
			<uni-list :border="true" v-for="(item,index) in save" v-show="save.length!=0">

				<uni-list-chat :title="item.name" :avatar="item.img"  :note="item.sign" badge-positon="left">
					<view class="chat-custom-right">

						<uni-icons type="star-filled" color="#999" size="26" @click="unstar(item)"></uni-icons>
						
					</view>

				</uni-list-chat>
				
			</uni-list>
		</uni-list>
		<view v-show="save.length==0" style="width: 100%;text-align: center;padding: 30rpx 0;">
			暂时没有关注
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
				save:[],
				

			}
		},
	
			onShow(){
				let id=uni.getStorageSync("name")
				let that=this;
			
				uni.request({
				    url: 'http://47.100.136.15:8087/author/save', //仅为示例，并非真实接口地址。
				    data: {
				       id:id
				    },
				    success: (res) => {
				     that.save=res.data.data;
					
				    }
				});
			},
		
		methods: {
			unstar(e) {
				let that=this;
				let id=uni.getStorageSync("name");
				uni.showModal({
					title: '提示',
					content: '您确定取消关注吗？',
					success: function(res) {
						if (res.confirm) {
							
								uni.request({
								    url: 'http://47.100.136.15:8087/save/unstar', //仅为示例，并非真实接口地址。
								    data: {
								       uid:id,
									   aid:e.id
								    },
								    success: (res) => {
								     uni.request({
								         url: 'http://47.100.136.15:8087/author/save', //仅为示例，并非真实接口地址。
								         data: {
								            id:id
								         },
								         success: (res) => {
								          that.save=res.data.data;
								     	
								         }
								     });
									
								    }
								});
								
						} else if (res.cancel) {
							
						}
					}
				});
			},
			
			star() {
					let that=this;
				uni.showModal({
					title: '提示',
					content: '您确定要关注吗？',
					success: function(res) {
						if (res.confirm) {
								that.star1=true
						} else if (res.cancel) {
							
						}
					}
				});
			}
		}
	}
</script>

<style>
	.chat-custom-right {
		flex: 1;

		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}

	.chat-custom-text {
		font-size: 12px;
		color: #999;
	}
</style>
