<template>
	<view>
		<view id="map">
			<map style="width: 100%; height:1000rpx;" :latitude="latitude" :longitude="longitude" :markers="covers"
			:polyline="polylines"></map>
		</view>
		
		
			
		<view class="card">

			                <view >
			                    <picker @change="bindPickerChange" :value="index" :range="array" >
			                        <view class="item">
									<view>{{array[index]}}</view>
									<view style="font-size: 20rpx;margin-left: 10rpx;color: #808080;">点击切换</view>
									</view>
									
			                    </picker>
								
			                </view>
							
							
							<view class="item">
								<image src="../../static/img/call.png" mode="" style="width: 40rpx;height: 40rpx;margin-right: 20rpx;"></image>
								
								<view>
									{{arrayTele[index]}}
								</view>
							</view>
							
							<view class="item">
								<image src="../../static/img/position.png" mode="" style="width: 40rpx;height: 40rpx;margin-right: 20rpx;"></image>
								<view>
									{{arrayAdd[index]}}
								</view>
							</view>
			          
			       <view @click="goAddress" class="button">
					   <image src="../../static/img/go.png" mode="" style="width: 60rpx;height: 60rpx;margin-right: 20rpx;"></image>
					   <view >去这里</view>
				   </view>
		</view>
		
		
	</view>
</template>

<script>
	export default {
		data() {
			 return {
			
			  title: 'picker',
			    array: ['杭州鹏龙之奔汽车服务有限公司', '杭州中之星汽车销售有限公司'],
				arrayTele: ['86538888', '28099999'],
				arrayAdd:['杭州市拱墅区祥符街道石祥路688号4幢','浙江省杭州市滨江区江陵路1780号'],
				arrayPos:[{
					latitude: 30.331424,			
					longitude: 120.119877,
				},{
					latitude: 30.213528,
					longitude: 120.225838,
					
				}],
			    index: 0,
			    current: 0,
			
			
			    latitude: 0,
			
			    longitude: 0,
			
			    covers: [
			
			      {
					title:"杭州鹏龙之奔汽车服务有限公司"  ,
					width:50,
					height:50,
			        latitude: 30.331424, //纬度，范围为-90~90，负数表示南纬
			
			        longitude: 120.119877,//经度，范围为-180~180，负数表示西经
					
					 iconPath: '../../static/img/position.png',
					 callout:{
						 content:"杭州鹏龙之奔汽车服务有限公司"
						 }
			
			      }, {
					title:"杭州中之星汽车销售有限公司"  ,
					width:50,
					height:50,
			        latitude: 30.213528, //纬度，范围为-90~90，负数表示南纬
			
			        longitude: 120.225838,//经度，范围为-180~180，负数表示西经
					
					 iconPath: '../../static/img/position.png',
					 callout:{
						 content:"杭州中之星汽车销售有限公司"
					}
			
			      }
			
			
			    ],
				polylines:[]
				
				
			
			  }
		},
		onShow() {
			this.latitude=this.arrayPos[this.index].latitude
			this.longitude=this.arrayPos[this.index].longitude
		},
		
		methods: {
			  bindPickerChange: function(e) {
			            console.log('picker发送选择改变，携带值为', e.target.value)
			            this.index = e.target.value
						
						this.latitude=this.arrayPos[this.index].latitude
						this.longitude=this.arrayPos[this.index].longitude
						
			        },
			goAddress(){
				let that=this
				let mylat=0;
				let mylong=0;
				uni.getLocation({
				    type: 'wgs84 ',
				    success: function (res) {
						
						
				        mylat=  res.latitude;
				        mylong=  res.longitude;
					
					
						that.latitude=mylat;
						that.longitude=mylong;
						
						
						
						var line=[
							{
								latitude: mylat,
								longitude: mylong
							}
						]
						line.push(that.arrayPos[that.index]);
						
				
						
						that.polylines = [{
							points:line,
							arrowLine: true,
							width:10,
							
						
							color: "FEAA34"
						}];
						
						
						
						
						
				    },
					
				});
				

				}
		}
	}
</script>

<style>
	.button{
		display: flex;
		flex-flow: row;
		margin-top:30rpx;
		justify-content: center;
		align-items: center;
		width: 94%;
		font-size: 40rpx;
		border: #1FBAFC 1px solid;
		padding: 20rpx;
		border-radius: 50rpx;
		}
.card{
	padding: 20rpx;
	}
		
	.item{
		display: flex;
		flex-flow: row;
		margin:10rpx 0;
		justify-content: start;
		align-items: center;
		font-size: 34rpx;
		
	}
</style>
