<template>
	<view>
		<view class="head">

			<wyb-drop-down
			 ref="dropDown"
			 min-height="450"
			 v-if="wxKey"
			 :key="key"
			 :options="options"
			 :autoHeight="false"
			 @change="onHeaderSelect" 
			 @select="onItemSelect">
				<view class="drop-down-content">
					<view v-if="page === 0" class="page-one">
                         <view style="display: flex;flex-direction: column;align-items: center;">
                         	
                         		<text class="drop1" @click="changetap(1)">销量高</text>
                         		<text class="drop1" @click="changetap(2)">价格高</text>
                         		<text class="drop1" @click="changetap(3)">价格低</text>
                         </view>
					</view>
					<view v-if="page === 1" class="page-one">
					    <view class="level">
					    	 <view class="level-type" @click="changeType(1)">
					    	 	 <image src="../../static/Carimage/Type1.png" mode=""></image>
					    		 <text>轿车</text>
					    		<text>28%人选择</text>
					    	 </view>
					    	<view class="level-type" @click="changeType(2)">
					    		<image src="../../static/Carimage/Type2.png" mode=""></image>
					    		<text>SUV</text>
                                <text>45%人选择</text>
					    	</view>
					    	<view class="level-type" @click="changeType(3)">
					    		<image src="../../static/Carimage/Type3.png" mode=""></image>
					    		<text>MPV</text>
					    		<text>12%人选择</text>
					    	</view>
					    </view>
					    <view class="level">
					    	 <view class="level-type" @click="changeType(4)">
					    	 	<image src="../../static/Carimage/Type4.png" mode=""></image>
					    		<text>纯电动</text>
					    		<text>5%人选择</text>
					    	  </view>
					    	  <view class="level-type" @click="changeType(5)">
					    		<image src="../../static/Carimage/Type6.png" mode=""></image>
					    		<text>跑车</text>
					    		<text>4%人选择</text>
					    	  </view>
					    	  <view class="level-type" @click="changeType(6)">
					    		<image src="../../static/Carimage/Type5.png" mode=""></image>
					    		<text>不限</text>
					    		<text>66%人选择</text>
					    	  </view>
					    </view> 
					</view>
					<view v-if="page === 2" class="page-three">
						<view class="price">
							   <view class="price-drop" @click="changeM(1)">
									<text>不限</text>
								</view>
							   <view class="price-drop"  @click="changeM(2)">
							   		<text>5-8万</text>
							   </view>
								<view class="price-drop"  @click="changeM(3)">
									<text>8-15万</text>
								</view>
						</view>
						<view class="price">
							   <view class="price-drop"  @click="changeM(4)">
									<text>15-20万</text>
								</view>
							   <view class="price-drop"  @click="changeM(5)">
							   		<text>20-30万</text>
							   </view>
								<view class="price-drop"  @click="changeM(6)">
									<text>30-50万</text>
								</view>
						</view>
						<view class="price">
							   <view class="price-drop"  @click="changeM(7)">
									<text>50万以上</text>
								</view>
							   <view class="price-drop" @click="openprice" >
							   		<text>自定义</text>
							   </view>
						</view>				
					</view>
					<view v-if="page === 3" class="page-three">
						<view class="price">
							   <view class="price-drop">
									<text>舒适性好</text>
								</view>
							   <view class="price-drop">
							   		<text>入门代步</text>
							   </view>
								<view class="price-drop">
									<text>撩妹利器</text>
								</view>
						</view>
						<view class="price">
							   <view class="price-drop">
									<text>硬派越野</text>
								</view>
							   <view class="price-drop">
							   		<text>安全性高</text>
							   </view>
								<view class="price-drop">
									<text>商务行政</text>
								</view>
						</view>
						<view class="price">
							   <view class="price-drop">
									<text>节能先锋</text>
								</view>
							   <view class="price-drop">
							   		<text>家用座驾</text>
							   </view>
								<view class="price-drop">
									<text>创业伙伴</text>
								</view>
						</view>
					</view>
				</view>
			</wyb-drop-down>
		</view>
		<scroll-view scroll-y="true" class="scroll-Y" @scrolltoupper="upper" @scrolltolower="lower"
                @scroll="scroll" style="margin-top: 10%;">
			<view class="carbody" v-for="(item,index) in cars">
				<image :src="item.img" style="height: 180rpx;width: 50%;"></image>
				<view class="carName">
					<h4>{{item.name}}</h4>
					<text>奔驰/{{type[item.type-1]}}</text>
					<text style="color: #FF0000;">¥{{item.money/10000}}万起</text>
				</view>
			</view>
			<view style="width: 100%;text-align: center;padding: 40rpx 0;">
				暂无更多
			</view>
		</scroll-view>
		<wyb-popup ref="popup" type="bottom" width="100" height="350" radius="6" :showCloseIcon="true">
		    <view class="popup-content">
		        <h3 style="margin-top: 5%;">自定义价格</h3>
		        <view class="popup-input">
		        	<input class="price-input" type="number" :value="lowerprice" @input="lowerread" placeholder="最低价格" style="margin-right: 20rpx;"/>
		        	<text>-</text>
		        	<input class="price-input" type="number" :value="highprice" @input="highread" placeholder="最高价格" style="margin-left: 20rpx;"/>
					万
		        </view>
				<button class="price-bt" type="default" @click="bindM">确定</button>
		    </view>
		</wyb-popup>
	</view>

</template>

<script>
import uniPopup from '@/components/uni-popup/uni-popup.vue'
import uniPopupMessage from '@/components/uni-popup/uni-popup-message.vue'
import uniPopupDialog from '@/components/uni-popup/uni-popup-dialog.vue'
import wybPopup from '@/components/wyb-popup/wyb-popup.vue'
import wybDropDown from '@/components/wyb-drop-down/wyb-drop-down.vue'
import wybModal from '@/components/wyb-modal/wyb-modal.vue'
export default {
	
  data() {
    return {
		sort:{
			kind:3,
			type:6,
			min:0,
			max:100000000
			
		},
		type: ["轿车", "SUV", "跑车", "MPV", "纯电动"],
	  lowerprice:null,
	  highprice:null,
	  page: 0,
	  key: 0,
	  wxKey: true,
	  options: [{
	  	header: '排序',
	  	custom: true
	  }, {
	  	header: '类别',
		custom:true
	  }, {
	  	header: '价格',
	  	custom: true
	  }, {
	  	header: '用途',
	  	custom: true
	  }],
	  defaultIndexList: [],
	  cars:[
		 
	  ]
    }
  },
  onNavigationBarButtonTap: function(e) {
  	uni.navigateTo({
  		url:"../SelectCar/SelectCar"
  	})
  },
    methods: {
		lowerread(e){
			this.lowerprice=e.target.value
			
			},
			highread(e){
					this.highprice=e.target.value
				},
		bindM(){
			this.sort.min=this.lowerprice*10000;
			this.sort.max=this.highprice*10000;
		
			this.getdate()
			 this.$refs.popup.close()
		},
       openprice(){
		   this.$refs.popup.show()
	   },
	   onHeaderSelect(e) {
	   	this.page = e.headerIndex
	   },
	   getdate(){
		   
		   uni.request({
		   	url: 'http://47.100.136.15:8087/car/listsort', //仅为示例，并非真实接口地址。
		   	data: {
		   		kind:this.sort.kind,
		   		type:this.sort.type,
		   		min:this.sort.min,
		   		max:this.sort.max
		   		
		   	},
		   	success: (res) => {
		   
		   		
		   		this.cars = res.data.data;
		   	}
		   });
		   
		   
		   },
	     
	   changetap(e){
		   this.sort.kind=e;
		   this.getdate();
		   
		},
		
		changeType(e){
				this.sort.type=e;
				this.getdate();
				   
		},
		
		changeM(e){
			if(e==1)
			{
					this.sort.min=0;
					this.sort.max=100000000;
			}
			else if(e==2)
			{
					this.sort.min=50000;
					this.sort.max=80000;
			}
			else if(e==3)
			{
					this.sort.min=80000;
					this.sort.max=150000;
			}
			else if(e==4)
			{
					this.sort.min=150000;
					this.sort.max=200000;
			}
			else if(e==5)
			{
					this.sort.min=200000;
					this.sort.max=300000;
			}
			else if(e==6)
			{
					this.sort.min=300000;
					this.sort.max=500000;
			}
			else if(e==7)
			{
					this.sort.min=500000;
					this.sort.max=100000000;
			}
			
				this.getdate();
				   
		}
				
				
    },
	components: {
			uniPopup,
			uniPopupMessage,
			uniPopupDialog,
			wybPopup,
			wybDropDown
	    },
		
		onLoad() {
			this.getdate()
		}
}
</script>

<style>
.drop-down-content{
	width: 100%;
	height: 400rpx;
}
.page-one{
	width: 100%;
	height: 100%;
}
.page-three{
	width: 100%;
	height: 100%;
}
.level-type image{
	width: 200rpx;
	height: 150rpx;
}	
.level-type{
	width: 30%;
	height: 200rpx;
	
	display: flex;
	flex-direction: column;
	align-items: center;
}
.level{
   height: 200rpx;
   font-size: 30rpx;
   
   display: flex;
   flex-direction: row;
   align-items: center;
   justify-content: center;
}
.price-bt{
	width: 80%;
	height: 80rpx;
	margin-top: 5%;
	color: #646566;
}
.price-input{
	border-radius: 30rpx;
	height: 70rpx;
	background-color: #EEEEEE;
}
.popup-input{
	width: 80%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin-top: 50rpx;
}
.popup-content{
	width: 100%;
	height: 350rpx;
	border-radius: 15px 15px 0 0;
	background-color: #ffffff;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.price{
	height: 120rpx;
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-left: 3%;
}
.price-drop{
	width: 28%;
	height: 40px;
	background-color: #eff8ff;
	margin-left: 12px;
	border-radius: 5px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}
.head{
	width: 100%;
	height: 10%;
}
.carbody{
	width: 100%;
	height: 10%;
	padding: 20rpx;
	display: flex;
	flex-direction: row;
	justify-content: start;
}
.carName{
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.drop1{
	width: 100%;
	height:120rpx;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
</style>
