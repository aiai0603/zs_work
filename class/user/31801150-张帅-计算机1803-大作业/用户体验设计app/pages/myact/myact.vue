<template>
	<view>
		<uni-list>
			<uni-list :border="true" v-for="(item,index) in save" v-show="save.length!=0">



				<uni-list-chat :title="item.name" avatar="../../static/img/activity.png" :note="item.date=='-1'?'请查看通知':item.date  "
				 badge-positon="left">
					<view class="chat-custom-right">

						<uni-icons type="close" color="black" size="18" @click="unstar(item)"></uni-icons>
					</view>

				</uni-list-chat>


			</uni-list>
		</uni-list>
		<view v-show="save.length==0" style="width: 100%;text-align: center;padding: 30rpx 0;">
			暂时没有活动
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				save: [],
			}
		},

		onShow() {
			let id = uni.getStorageSync("name")
			let that = this;

			uni.request({
				url: 'http://47.100.136.15:8087/join/list', //仅为示例，并非真实接口地址。
				data: {
					id: id
				},
				success: (res) => {
					that.save = res.data.data;

				}
			});
		},

		methods: {
		
			unstar(e) {
				console.log(e)
				let that = this;
				let id = uni.getStorageSync("name")
				uni.showModal({
					title: '提示',
					content: '您确定取消活动吗？',
					success: function(res) {
						if (res.confirm) {

							uni.request({
								url: 'http://47.100.136.15:8087/join/unjoin', //仅为示例，并非真实接口地址。
								data: e,
								method: "POST",
								success: (res) => {
									uni.request({
										url: 'http://47.100.136.15:8087/join/list', //仅为示例，并非真实接口地址。
										data: {
											id: id
										},
										success: (res) => {
											that.save = res.data.data;
											console.log(that.save)
										}
									});


								}
							});

						} else if (res.cancel) {

						}
					}
				});
			},


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
