<template>
	<view>
		<carousel2 :img-list="imglist" url-key="url" @selected="selectedBanner" />
		<view class="titleitem">
			<view class="title">
				版型
			</view>
			<view>{{cars[selectedId].name}}</view>
		</view>
		<view class="titleitem">
			<view class="title">
				心动价
			</view>
			<view>¥ {{cars[selectedId].money}} 起</view>
		</view>


		<view class="titleitem">
			<view class="title">
				首付金额占比
			</view>
			<slider value="50" step="10" min="10" max="100" @change="sliderChange" show-value />
		</view>
		<view class="titleitem">

			<view class="title">选择分期数量</view>
			<picker @change="bindPickerChange" :value="index" :range="array">
				<view class="uni-input">{{array[index]}}</view>
			</picker>

		</view>
		<view class="titleitem">
			<view class="title">
				首付
			</view>
			<view>¥ {{sf}} </view>
		</view>
		<view class="titleitem">
			<view class="title">
				月供
			</view>
			<view>¥ {{yg}} </view>
		</view>
		
		<view class="titleitem">
			<view class="xy">*提交订单视为同意"梅赛德斯奔驰购车协议"</view>
			
		</view>
		<view style="width:100%;height: 100%;display: flex;flex-flow: row;">
			<button type="default" style="width:40%;background-color: #007AFF;color: white;" @click="submit()">提交</button>
			<button type="default" style="width:40%" @click="quit()">取消</button>
		</view>
		
	</view>
</template>

<script>
	import carousel2 from '@/components/vear-carousel2/vear-carousel'
	export default {
		components: {
			carousel2
		},
		data() {

			return {
				selectedId:0,
				cars:[{},{},{},{},{},{},{},{}],
				imglist:[],
				title: 'picker',
				array: [6, 12, 24, 36],
				index: 0,
				rate:50
			}
		},
		onLoad(option) {
		
			uni.request({
			    url: 'http://47.100.136.15:8087/carkind/list', //仅为示例，并非真实接口地址。
			    data: {
			       id:option.id
			    },
				
			    success: (res) => {
					this.selectedId=0
			     this.cars=res.data.data;
				 for(var i=0;i<this.cars.length;i++)
				 {
				 	var imgtemp={
				 		url:this.cars[i].img,
				 		id:i,
				 	}
				 	
				 	this.imglist.push(imgtemp);
				 }
				
			    }
			});
			
		
			
		},
		 computed:{
		           sf(){
		              var num=this.cars[this.selectedId].money*this.rate/100;
					  num = num.toFixed(0);
		                return num;
		            },
					
					yg(){
					   var num=this.cars[this.selectedId].money*(100-this.rate)/(100*this.array[this.index]);
						num = num.toFixed(0);
					     return num;
					 }
		        },


		methods: {
			quit(){
				uni.navigateBack({
					
				});
			},
			
			submit(){
				  let uid=uni.getStorageSync("name")
				var temp={
					carid:this.cars[this.selectedId].carid,
					carkind:this.cars[this.selectedId].id,
					money:this.cars[this.selectedId].money,
					payfirst:this.sf,
					month:this.array[this.index],
					monthpay:this.yg,
					userid:uid,
					state:1
				}
				
				
				
				
				uni.request({
				    url: 'http://47.100.136.15:8087/buycar/add', //仅为示例，并非真实接口地址。
				    data:temp,
					method:"POST",
				    success: (res) => {
					
					uni.navigateBack();
					uni.showToast({
						title: '提交成功',
						icon: 'none',
						duration: 1000
					});
					
					
				    }
				});
				
			
				
			
			},
			
			
			selectedBanner(item, index) {
				this.selectedId = index
			},

			sliderChange(e) {
				this.rate=e.detail.value
			},
			bindPickerChange: function(e) {
			
				this.index = e.target.value
			},
			bindDateChange: function(e) {
				this.date = e.target.value
			},
			bindTimeChange: function(e) {
				this.time = e.target.value
			},
		}
	}
</script>

<style>
	.xy{
		font-size: 26rpx;
		color: #666666;
		}
	.titleitem {
		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: start;
		align-items: center;
		margin: 50rpx 0;
		padding-left: 5%;
	}

	.title {
		width: 30%;
	}

	slider {
		width: 50%;
	}

	picker {
		width: 30%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
</style>
