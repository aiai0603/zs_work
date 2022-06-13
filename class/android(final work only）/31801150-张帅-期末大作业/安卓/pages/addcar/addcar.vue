<template>
	<view class="main">
		<view class="item" style="flex-flow: column;justify-content: center;align-items: flex-start">
			<view class="maintitle">请填写奔驰车主信息</view>
			<view class="underline">填写信息默认同意"隐私协议"</view>
			
		</view>
		
		<view class="item">
			<view class="title">型号</view>
			<picker @change="bindPickerChange" :value="index" :range="array" >
			 
				<view class="pick">{{array[index]}}</view>
				
			
				
			</picker>
			
		</view>
		<view class="item">
			<view  class="title" >车牌</view>
			<input type="text" placeholder="例如:浙F2332E"  class="pick" @input="bindNumber">
		</view>
		<view class="item">
			<view  class="title">照片</view>
			
			<view v-if="imgList!=''">
				<image :src="imgList" mode="" class="choose"></image>
				
			</view>
			
			<view class="choose-input" @click="take" v-else>
				<image src="../../static/img/addphoto.png" mode="" class="choose"></image>
				
			</view>
			<view style="margin: 20rpx;color: #AAAAAA;" @click="take" v-if="imgList!=''">重新选择</view>
			
		</view>
		<button type="primary"  class="button" :disabled="add" @click="addcar">提交</button>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title: 'picker',
				index:0,
				imgList: "",
				allcar:[],
				array: ['长轴距A级轿车', 'A级掀背车'],
				add:true,
				number:""
			}
		},
		onShow() {
			let that=this
			uni.request({
			    url: 'http://47.100.136.15:8087/car/all', //仅为示例，并非真实接口地址。
			    data: {
			      
			    },
			    success: (res) => {
				
			     that.allcar=res.data.data;
				 
				that.array=[];
				 for(var i=0;i<that.allcar.length;i++){
					
					 that.array.push(that.allcar[i].name)
					 
				 }
				 
			    }
			});
		},
		methods: {
			addcar(){
				  let uid=uni.getStorageSync("name")
				var temp={
					userid:uid,
					carid:this.allcar[this.index].id,
					number:this.number,
					deleteflag:0
					
				}
				
				uni.request({
				    url: 'http://47.100.136.15:8087/owner/add', //仅为示例，并非真实接口地址。
				    data:temp,
					method:"POST",
				    success: (res) => {
					
					uni.navigateBack();
					uni.showToast({
						title: '提交成功，请等待审核',
						icon: 'none',
						duration: 1000
					});
					
					
				    }
				});
				
			},
				
			bindNumber(event){
				this.number=event.target.value;
				this.CanAdd()
			},
			
			CanAdd(){
					
				if(this.imgList!=""&&this.number!=""){
					
					this.add=false;
					
				}else{
					
					this.add=true;
				}
			},
			
			
			bindPickerChange: function(e) {
			          console.log('picker发送选择改变，携带值为', e.target.value)
			          this.index = e.target.value
								
									
			      },
			take(){
				let that=this
				/* 选中图片 */
				uni.chooseImage({
					sourceType: ['camera', 'album'],
					sizeType: ['original', 'compressed'],
					count: 1,
					success: (res) => {
							var tempFilePaths = res.tempFilePaths[0];
							that.imgList=tempFilePaths;
							this.CanAdd()
										
						}
					})
				}
		}
	}
</script>

<style>
	.choose{
		width: 300rpx;
		height: 300rpx;
		
		
	}
	
	.choose-input{
		width: 300rpx;
		height: 300rpx;
		border: #AAAAAA 1rpx solid;
		font-size: 200rpx;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		
	}
	
	
	.button {
		margin: 50rpx 10%;
		width: 90%;
		border-radius: 70rpx;
	}
		
	input{
		border-bottom: #AAAAAA 1rpx solid;
		padding: 10rpx;
		
	}
	.underline {
		font-size: 26rpx;
		font-weight: 100;
		margin-bottom: 50rpx;
		
	}
	.maintitle{
		font-size: 48rpx;
		font-size: rgba(0,0,0,0.6);
		margin: 50rpx 0 20rpx 0;
		
		
	}
	.pick{
		font-size: 36rpx;
		font-size: rgba(0,0,0,0.6);
		font-weight: 100;
	}
		
	.title{
		font-size: 40rpx;
		margin-right: 40rpx;
	
	}
	.main{
		display: flex;
		flex-flow:column;
		justify-content: center;
		align-items: center;
		
		}
	.item{
		margin:30rpx 0;
		width: 90%;
		display: flex;
		flex-flow: row;
		justify-content: start;
		align-items: center;
	}

</style>
