<template>
	<view class="main">
		<view class="title">登录AMG车友俱乐部</view>
		<view class="underline">登录AMG默认同意"隐私协议"</view>
		<input type="number" maxlength="11" placeholder="手机号" placeholder-class="cl" @input="phone">
		<view class="underline2">未注册手机号将直接注册</view>
		<input type="number" maxlength="4" placeholder="验证码" placeholder-class="cl" v-if="show" @input="signin">
		<view class="resent" v-if="show" @click="resentsign">没有收到验证码？点击再次发送</view>
		<button type="primary" :disabled="sign" class="button" @click="get">{{text}}</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				text: "获得验证码",
				sign: true,
				show: false,
				phonenumber:""
			}
		},
		methods: {
			phone: function(event) {
				if (event.target.value.length == 11) {
					this.sign = false
				} else {
					this.text = "获得验证码";
					this.sign = true;
					this.show = false;
				}
				
				this.phonenumber=event.target.value;
			},
			resentsign() {
				uni.showToast({
					title: '发送成功',
					icon: 'none',
					duration: 2000
				});
			},
			signin: function(event) {
				if (event.target.value.length == 4) {
					this.sign = false
				} else {
					this.sign = true
				}
			},
			get() {
				if (this.text == "获得验证码") {
					this.text = "登录/注册";
					this.show = true;
					this.sign = true
				} else {
					
					uni.request({
					    url: 'http://47.100.136.15:8087/user/login', //仅为示例，并非真实接口地址。
					    data: {
					       phone: this.phonenumber
					    },
					    success: (res) => {
					       uni.setStorageSync("name",res.data.data.id);
					       uni.navigateBack();
					       uni.showToast({
					       	title: '登录成功',
					       	icon: 'none',
					       	duration: 1000
					       });
					    }
					});
					
					
					
			
			

				}
			}
		}
	}
</script>

<style>
	.button {
		margin: 50rpx 10%;
		width: 80%;
		border-radius: 70rpx;
	}

	.cl {
		color: #dddddd;
	}

	.title {
		margin: 100rpx 0rpx 10rpx 10%;
		font-size: 46rpx;
		font-weight: 400;
	}

	.underline {
		font-size: 26rpx;
		font-weight: 100;
		margin: 10rpx 0rpx 100rpx 10%;
	}

	.underline2 {
		font-size: 26rpx;
		font-weight: 100;
		margin: 10rpx 0rpx 10rpx 10%;
	}

	.resent {
		font-size: 26rpx;
		font-weight: 100;
		margin: 10rpx 0rpx 10rpx 10%;
		color: #007AFF;
	}


	input {
		border-bottom: #EEEEEE 1rpx solid;
		font-size: 56rpx;
		padding: 10rpx 0rpx 10rpx 0rpx;
		width: 80%;
		margin: 10rpx 10%;
	}


	.main {

		display: flex;
		flex-flow: column;
		justify-content: center;

		align-items: flex-start;
	}
</style>
