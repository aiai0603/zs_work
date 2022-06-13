<template>
	<view>
		<view class="userSession" :style="{height: sHeight + 'px'}">
			<block v-for="(userContext, index) in userContextItem" :key="userContext.userId">
				<view class="item" :class="{'userMe':userContext.userId == ''}">
					<view class="Img">
						<image :src="userContext.Img" mode="scaleToFill"></image>
					</view>
					<view class="bubble">
						<template v-if="userContext.type == 'text'">
							<view class="textType">
								<text>{{userContext.context}}</text>
							</view>
						</template>
					</view>
				</view>
			</block>
		</view>
		
		<view class="userInput">
			<input type="text" v-model="text" placeholder="请输入您的问题" adjust-position="false"/>
			<view class="subText" @click="submit(text)">发送</view>
		</view>
	</view>
</template>

<script>
	import {v4} from 'uuid';
	import{
		MQTT_IP,
		MQTT_OPTIONS
	}from '@/utils/mqtt.js';
	var mqtt = require('mqtt/dist/mqtt.js')
	var client
	export default {
		data() {
			return {
				text: '',
				sHeight: 500,
				userContextItem: [{
					userId: 1,
					Img: "../../static/serviceutils/serviceCustomer.png",
					type: "text",
					context: "尊敬的用户，请问有什么疑问，客服小蜜将为你解答。",
				}]
			}
		},
		onLoad() {
			this.connect();
			uni.getSystemInfo({
				success:(res) => {
					let height = res.windowHeight - uni.upx2px(100);
					this.sHeight = height;
				}
			})
		},
		methods: {
			connect() {
				MQTT_OPTIONS.clientId = v4()
				var that = this
				client = mqtt.connect('wx://' + MQTT_IP, MQTT_OPTIONS)
				client.on('connect', function(){
					client.subscribe('serviceCustomer', {qos : 0}, (error) => {
						if(!error){
							console.log('订阅成功')
						}else{
							console.log('订阅失败')
						}
					});
				}).on('message',function(topic, payload){
					let answer = {
						userId: 1,
						Img: "../../static/serviceutils/serviceCustomer.png",
						type: "text",
						context: payload.toString(),
					}
				    that.userContextItem.push(answer);
			    })
			},
			submit(text) {
				if(text == null){
					uni.showToast({
						title: '请输入您的问题',
						icon: 'none'
					})
				}else{
					client.publish('Customer',text);
					let obj = {
						userId: "",
						Img: "../../static/serviceutils/customer.png",
						type: "text",
						context: text,
					};
					this.userContextItem.push(obj);
				}
				this.text = ''
			}
		}
	}
</script>

<style>
	page{
		background-color: #F8F8F8;
	}
	.userSession {
		width: 100%;
		height: auto;
		border-top: 1upx solid #EDEDED;
		overflow: auto;
	}
	.item {
		width: 80%;
		height: auto;
		display: flex;
		flex: 1;
		flex-flow: row;
		padding: 20upx;
		align-items: center;
	}
	.userMe {
		width: 95%;
		height: auto;
		display: flex;
		flex: 1;
		flex-wrap: wrap;
		padding: 20upx;
		justify-content: flex-start;
		flex-direction: row-reverse;
		text-align: right;
	}
	.Img {
		width: 70upx;
		height: 70upx;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-left: 15upx;
		margin-right: 15upx;
	}
	.Img>image {
		width: 65upx;
		height: 65upx;
		border-radius: 100%;
	}
	.bubble {
		display: flex;
		justify-content: center;
		flex-direction: column;
		width: auto;
		padding: 10upx;
		border-radius: 20rpx;
		box-shadow:0px 2px 4px 2px rgba(0, 0, 0, 0.20);
		font-size: 25rpx;
	}
	.userInput {
		height: 100upx;
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		padding: 0 10upx;
		background-color: #d9dce3;
		display: flex;
		justify-content: space-around;
		align-items: center;
		box-shadow: 0 0 5upx 0 #e3e3e3;
	}
	.userInput>input {
		height: 50upx;
		background: #F4F5F6;
		border-radius: 50upx;
		padding: 10upx 10upx;
		flex: 1;
		margin-right: 20upx;
		font-size: 28upx;
	}
	.userInput>view {
		width: 120upx;
		font-size: 24upx;
		color: #FFFFFF;
		height: 60upx;
		background-color: #1fbafc;
		border-radius: 20upx;
		text-align: center;
		line-height: 60upx;
	}
</style>
