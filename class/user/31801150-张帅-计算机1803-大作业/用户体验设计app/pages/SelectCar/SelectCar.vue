<template>
	<view>
		<v-tabs-column
		  width="200rpx"
		  :tabs="tabs"
		  :is-tabbar="false"
		  position="left"
		  active-color="purple"
		  bg-color="#eff8ff"
		  active-bg-color="#f3f3f3"
		  bold="bold"
		  @change="changeTab"
		>
		  <view class="list1">
		  	  <h2>车身参数</h2>
			  <h4 style="margin-top: 8%;">车身结构</h4>
              <view class="car-body" style="height: 350rpx;">
              	  <view class="car-body1">
              	  	 <view :class="example" @click="choose">
              	  	 	<text>两厢</text>
              	  	 </view>
					 <view :class="caritem" @click="choose">
					 	<text>三厢</text>
					 </view>
					 <view :class="caritem" @click="choose">
					 	<text>四厢</text>
					 </view>
              	  </view>
				  <view class="car-body1">
				  	<view :class="caritem" @click="choose">
				  	 	<text>旅行车</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>硬顶跑车</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>硬顶敞篷</text>
				  	</view>
				  </view>
				  <view class="car-body1">
				  	<view :class="caritem" @click="choose">
				  	 	<text>软顶敞篷</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>跨界车</text>
				  	</view>
				  </view>
              </view>
			  <h4>车体结构</h4>
			  <view class="car-body" style="height: 130rpx;">
			  		<view class="car-body1">
			  			<view :class="caritem" @click="choose">
			  				<text>承载式</text>
			  			</view>
			  		    <view :class="caritem" @click="choose">
			  				<text>非承载式</text>
			  		    </view>
			        </view>
			</view>
			  <h4>座位数</h4>
              <view class="car-body" style="height: 250rpx;">
              	  <view class="car-body1">
              	  	 <view :class="caritem" @click="choose">
              	  	 	<text>2座</text>
              	  	 </view>
					 <view :class="caritem" @click="choose">
					 	<text>4座</text>
					 </view>
					 <view :class="caritem" @click="choose">
					 	<text>5座</text>
					 </view>
              	  </view>
				  <view class="car-body1">
				  	<view :class="caritem" @click="choose">
				  	 	<text>6座</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>7座</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>7座以上</text>
				  	</view>
				  </view>
              </view>
			  <h2>动力参数</h2>
			  <h4 style="margin-top: 8%;">变速箱类型</h4>
			    <view class="car-body" style="height: 130rpx;">
			    		<view class="car-body1">
			    			<view :class="caritem" @click="choose">
			    				<text>手动</text>
			    			</view>
			    		    <view :class="caritem" @click="choose">
			    				<text>自动</text>
			    		    </view>
			          </view>
			  </view>
			  <h4>能源</h4>
              <view class="car-body" style="height: 250rpx;">
              	  <view class="car-body1">
              	  	 <view :class="caritem" @click="choose">
              	  	 	<text>汽油</text>
              	  	 </view>
					 <view :class="caritem" @click="choose">
					 	<text>柴油</text>
					 </view>
					 <view :class="caritem" @click="choose">
					 	<text>油电混合</text>
					 </view>
              	  </view>
				  <view class="car-body1">
				  	<view :class="caritem" @click="choose">
				  	 	<text>新能源</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>轻混系统</text>
				  	</view>
				  </view>
              </view>
			  <h4>排量</h4>
              <view class="car-body" style="height: 350rpx;">
              	  <view class="car-body1">
              	  	 <view :class="caritem" @click="choose">
              	  	 	<text>1.0以下</text>
              	  	 </view>
					 <view :class="caritem" @click="choose">
					 	<text>1.0-1.6L</text>
					 </view>
					 <view :class="caritem" @click="choose">
					 	<text>1.7-2.0L</text>
					 </view>
              	  </view>
				  <view class="car-body1">
				  	<view :class="caritem" @click="choose">
				  	 	<text>2.1-2.5L</text>
				  	</view>
				  	<view :class="caritem" @click="choose">
				  		<text>2.6-3.0L</text>
				  	</view>
					<view :class="caritem" @click="choose">
						<text>3.1-4.0L</text>
					</view>
				  </view>
              	  <view class="car-body1">
              	  	 <view :class="caritem" @click="choose">
              	  	 	<text>4.0L</text>
              	  	 </view>
              	  </view>				  
              </view>	
			  <h2>底盘制动</h2>
			  <h4 style="margin-top: 8%;">驱动方式</h4>
			    <view class="car-body" style="height: 130rpx;">
			    		<view class="car-body1">
			    			<view :class="caritem" @click="choose">
			    				<text>前驱</text>
			    			</view>
			    		    <view :class="caritem" @click="choose">
			    				<text>后驱</text>
			    		    </view>
							<view :class="caritem" @click="choose">
								<text>四驱</text>
							</view>
			          </view>
			  </view>
			  <h4 style="margin-top: 8%;">驻车制动类型</h4>
			    <view class="car-body" style="height: 130rpx;">
			    		<view class="car-body1">
			    			<view :class="caritem" @click="choose">
			    				<text>手刹</text>
			    			</view>
			    		    <view :class="caritem" @click="choose">
			    				<text>脚刹</text>
			    		    </view>
							<view :class="caritem" @click="choose">
								<text>电子刹车</text>
							</view>
			          </view>
			  </view>
			<h2>安全配置</h2>
             <view class="car-body" style="height: 600rpx;">
               	<view class="car-body1">
               		<view :class="caritem" @click="choose">
               			<text>气囊</text>
               		</view>
               		<view :class="caritem" @click="choose" style="width: 250rpx;">
               			<text>胎压监测装置</text>
               		</view>
                </view>
               	<view class="car-body1">
               		<view :class="caritem" @click="choose" style="width: 250rpx;">
               			<text>ESP稳定系统</text>
               		</view>
               		<view :class="caritem" @click="choose" style="width: 200rpx;">
               			<text>并线辅助</text>
               		</view>
                </view>
               	<view class="car-body1">
               		<view :class="caritem" @click="choose" style="width: 300rpx;">
               			<text>车道保持辅助系统</text>
               		</view>
                </view>
               	<view class="car-body1">
               		<view :class="caritem" @click="choose" style="width: 300rpx;">
               			<text>车道偏离预警系统</text>
               		</view>
                </view>	
               	<view class="car-body1">
               		<view :class="caritem" @click="choose" style="width: 360rpx;">
               			<text>主动刹车/主动安全系统</text>
               		</view>
                </view>
               	<view class="car-body1">
               		<view :class="caritem" @click="choose" style="width: 300rpx;">
               			<text>ISOFIX儿童座椅接口</text>
               		</view>
               		<view :class="caritem" @click="choose" style="width: 200rpx;">
               			<text>夜视系统</text>
               		</view>
                </view>				
             </view>
       </view>
	</v-tabs-column>
	</view>
</template>

<script>
export default {
  data() {
    return {
      current: 0,
	  caritem:"car-body2",
	  example:"car-body2",
      tabs: ['车身参数', '动力参数', '底盘制动', '安全配置', '内部配置', '座椅配置', '多媒体配置',]
    }
  },
  methods: {
	  choose(){
		  if( this.example!="car-body6")
			this.example="car-body6";
		  else
		   this.example="car-body2";
	  },
    changeTab(index) {
      uni.showToast({
        title: '当前选中的是：' + this.tabs[index],
        icon: 'none'
      })
    }
  }
}
</script>

<style>
.car-body2{
	width: 150rpx;
	height: 80rpx;
	background-color: #eff8ff;
	margin-right: 20rpx;
	border-radius: 10rpx;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	font-size: 20rpx;
	box-shadow: #eeeded 1rpx 1rpx 2rpx 2rpx;
}
.car-body6{
	width: 150rpx;
	height: 80rpx;
	background-color: #93abd3;
	margin-right: 20rpx;
	border-radius: 10rpx;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	font-size: 20rpx;
	box-shadow: #eeeded 1rpx 1rpx 1rpx 1rpx;
}
.car-body1{
	width: 480rpx;
	display: flex;
	flex-direction: row;
	align-items: center;
	height: 105rpx;
}
.car-body{
	width: 100%;
	margin-top: 8%;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}
.list1{
	margin-left: 5%;
	padding: 20rpx;
}
</style>
