<template>
	<view>
		<view class="under">
			<view class="underitem" @click="dzclick">
				<image :src="!like?'../../static/img/like3.png':'../../static/img/like2.png'" mode=""></image>{{!like?"点赞":page.like}}
			</view>
			<view class="underitem" @click="reportclick">
				<image src="../../static/img/report.png" mode=""></image>举报
			</view>
			<view class="underitem">
				<image src="../../static/img/car.png" mode="" @click="tocar()"></image>看车
			</view>
		</view>
		<view>
			<view class="title">{{page.title}}</view>
			<view class="undertitle">
				<view>发布时间：{{page.date}}</view>
				<view>阅读：{{page.see}}</view>
			</view>
		</view>


		<uni-list-chat :title="author.name" :avatar="author.img" time="2020-02-02 20:20" :note="author.sign" badge-positon="left">
			<view>

				<uni-icons type="star-filled" color="#999" size="26" @click="star" v-if="star1"></uni-icons>
				<uni-icons type="star-filled" color="yellow" size="26" @click="star" v-if="!star1"></uni-icons>
			</view>

		</uni-list-chat>


		<mp-html :content="page.inside" />


		
		<view class="rate" v-if="starcount==0">
			<view>您觉得本篇内容如何？</view>
			<uni-rate :margin="5"  v-model="starcount"  @change="rate"/>
		</view>
		<view class="rate"  v-if="starcount!=0">
			
			<view>您的评分是 {{starcount}} 分</view>
		
		</view>
		<view class="rate" v-if="starcount!=0">
			
			<view>再次评分本篇：</view>
			<uni-rate :margin="5"  v-model="starcount"  @change="rate"/>
		</view>
		
		
		<view class="carbk" >
			<view class="car" @click="tocar()" v-if="car!=null">
				<view class="cartitle">
					相关车型

				</view>
				<view class="listCar">

					<view class="list">
						<view class="caritem">

							<image :src="car.img" class="carimg"></image>
							<view class="carword">

								<view>{{car.name}}</view>
								<view class="caricon">
									<view style="background-color: #FFA200" v-show="car.newCar==1">热销</view>
									<view v-show="car.sale==1" style="background-color: #007AFF">新品</view>
								</view>
								<view>¥{{car.money/10000}}万起</view>
							</view>
						</view>

					</view>


				</view>
			</view>
		</view>


		<uni-popup ref="popup" type="share">

			<view class="shareitem">
				<view class="share">
					<view>
						<image src="../../static/img/QQ.png" mode=""></image>
					</view>
					<view>
						<image src="../../static/img/wx.png" mode=""></image>
					</view>
					<view>
						<image src="../../static/img/dingding.png" mode=""></image>
					</view>

				</view>
				<button type="default" @click="quit">取消</button>
			</view>


		</uni-popup>


		<uni-popup ref="popup2">
			<view class="report">
				<textarea placeholder="请描述你举报的理由,不超过50个字" maxlength="50" />
				<view class="buttonitems">
					<button type="default" @click="reportsubmit">提交</button>
					<button type="default" @click="quit2">取消</button>
				</view>
			</view>
		</uni-popup>
		
		
	</view>
</template>

<script>
	import uniPopup from '@/components/uni-popup/uni-popup.vue'
	import uniPopupMessage from '@/components/uni-popup/uni-popup-message.vue'
	import uniPopupDialog from '@/components/uni-popup/uni-popup-dialog.vue'
	import mpHtml from '@/components/mp-html/mp-html'
	
	export default {
		components: {
			uniPopup,
			uniPopupMessage,
			uniPopupDialog,
			 mpHtml
		},
		data() {
			return {
				
				starcount:0,
				pid:"",
				star1: "",
				like:"",
				car:[],
				author:[],
				page:{},
				
			}
		},
		onNavigationBarButtonTap: function(e) {
			this.$refs.popup.open();
		},
		
	
		onLoad(option) {
			let id=uni.getStorageSync("name")
			let that=this
			this.pid=option.id
			uni.request({
			    url: 'http://47.100.136.15:8087/passage/page', //仅为示例，并非真实接口地址。
			    data: {
			       id:option.id,
				  
			    },
			    success: (res) => {
					
			     that.page=res.data.data;
				 that.author=res.data.author;
				
				 that.car=res.data.car;
				
				 
				
			    }
			});
			
			
			
		
			if(id!="")
			{
			uni.request({
			    url: 'http://47.100.136.15:8087/passage/pageperson', //仅为示例，并非真实接口地址。
			    data: {
			       id:option.id,
				   uid:id
			    },
			    success: (res) => {
					if(res.data.save==null)
					that.star1=false;
					else
					that.star1=true;
					
				
					if(res.data.like==null)
					that.like=false;
					else
					that.like=true;
					
				
					if(res.data.star!=null)
					that.starcount = res.data.star.starNumber
				
			
			    }
			});
			
			
			}
			
			
		},
	
		
		
		methods: {
			  
			  rate(e) {
				 
				  let id=uni.getStorageSync("name")
				  if(id=="")
				  uni.showToast({
				  	title: '请先登录以记录你的评价！',
				  	icon: 'none',
				  	duration: 500
				  });
				  else
				  {
				  	uni.request({
				  	    url: 'http://47.100.136.15:8087/star/rate', //仅为示例，并非真实接口地址。
				  	    data: {
				  	       pid:this.pid,
				  		   uid:id,
						   rate:e.value
				  	    },
				  	    success: (res) => {

				  	    }
				  	});
				  
				  }
			          
			  },

			tocar: function() {
				uni.navigateTo({
						url:"../showcar/showcar"
					})
			},
		
			reportclick: function() {
				let id=uni.getStorageSync("name")
				if(id=="")
				uni.showToast({
					title: '请先登录！',
					icon: 'none',
					duration: 500
				});
				else
				this.$refs.popup2.open();
			},
			
			reportsubmit(){
				this.$refs.popup2.close();
				uni.showToast({
					title: '提交成功',
					icon: 'none',
					duration: 500
				});
			},
			
			
			quit() {
				this.$refs.popup.close()
				this.starcount=1;
			},
			quit2() {
				this.$refs.popup2.close()
			},
			
			
			dzclick(){
				let id=uni.getStorageSync("name")
				if(id=="")
				uni.showToast({
					title: '请先登录！',
					icon: 'none',
					duration: 500
				});
				else
				{
					
					if(this.like)
					{
					uni.request({
					    url: 'http://47.100.136.15:8087/like/unlike', //仅为示例，并非真实接口地址。
					    data: {
					       pid:this.pid,
						   uid:id
					    },
					    success: (res) => {
							this.like=!this.like
							this.page.like=this.page.like-1

					    }
					});
					}
					else
					{
					uni.request({
					    url: 'http://47.100.136.15:8087/like/add', //仅为示例，并非真实接口地址。
					    data: {
					       pid:this.pid,
						   uid:id
					    },
					    success: (res) => {
							this.like=!this.like
							this.page.like=this.page.like+1
					    }
					});
					}
				}
				
			},
			star() {
				
				let id=uni.getStorageSync("name")
				if(id=="")
				{
				uni.showToast({
					title: '请先登录！',
					icon: 'none',
					duration: 500
				});
				}
				else
				{
					let that = this;
				
					if(this.star1==true)
					{
						
						uni.showModal({
							title: '提示',
							content: '您确定要取消关注吗？',
							success: function(res) {
								if (res.confirm) {
									uni.request({
									    url: 'http://47.100.136.15:8087/save/unstar', //仅为示例，并非真实接口地址。
									    data: {
									       aid:that.page.author,
										   uid:id
									    },
									    success: (res) => {
											that.star1 = false
									
									    }
									});
									
								} else if (res.cancel) {
						
								}
							}
						});
					}else{
						uni.showModal({
							title: '提示',
							content: '您确定要关注吗？',
							success: function(res) {
								if (res.confirm) {
									uni.request({
									    url: 'http://47.100.136.15:8087/save/star', //仅为示例，并非真实接口地址。
									    data: {
									       aid:that.page.author,
										   uid:id
									    },
									    success: (res) => {
											that.star1 = true
											
									    }
									});
									
								} else if (res.cancel) {
						
								}
							}
						});
					}
					
				}
			}

		}
	}
</script>

<style >
	textarea{
		margin: 20rpx;
		background-color: rgba(200,200,200,0.1);
		padding: 20rpx;
		border-radius: 20rpx;
	}
	.buttonitems button{
		width: 40%;
		margin: 20rpx;
		font-size: 30rpx;
		
	}
	.buttonitems{
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		
	}
	.report{
		padding: 20rpx 0;
		background-color: white;
	}
	.underitem {
		display: flex;
		flex-flow: row;
		justify-content:center;
		align-items: center;
		width: 30%;

	}

	.underitem image {
		margin-right: 10rpx;
		width: 37rpx;
		height: 35rpx;

	}


	.under {
		background-color: white;
		position: fixed;
		bottom: 0;
		width: 100%;
		height: 80rpx;
		z-index: 1;
		display: flex;
		flex-flow: row;
		justify-content:space-around;
		align-items: center;
		box-shadow: #999999 5rpx 5rpx 5rpx 5rpx;


	}

	.carbk {
		padding: 20rpx 0 20rpx 0;
		background-color: #F0F0F0;
	}

	.car {
		background-color: white;
		padding: 50rpx 3%;
		border-radius: 30rpx;

		margin-bottom: 80rpx;

	}

	.cartitle {
		font-size: 32rpx;
		margin-bottom: 20rpx;
		font-weight: 800;
	}

	.caricon {
		display: flex;
		flex-flow: row;
		font-size: 30rpx;
	}

	.caricon view {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		font-size: 24rpx;
		padding: 5rpx 20rpx;
		border-radius: 20rpx;
		color: white;
		margin-left: 5rpx;

	}

	.carword {
		width: 35%;
		display: flex;
		flex-flow: column;
		justify-content: space-around;
		align-items: flex-end;

	}

	.carimg {
		width: 57%;
		height: 200rpx;
	}

	.caritem {
		display: flex;
		flex-flow: row;
		padding: 30rpx 0;
		background-color: rgba(100, 100, 100, 0.1);
	}


	.actunder {
		width: 94%;
		font-size: 24rpx;
		color: #808080;
		padding-bottom: 20rpx;
		border-bottom: #808080 1px solid;
	}

	.actitem {
		width: 100%;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: start;
		font-size: 40rpx;
		font-weight: 800;

	}

	.actimg {
		width: 94%;
		height: 320rpx;
	}

	.actitem view {
		margin: 20rpx 0;

	}

	.rate {
		flex-wrap: wrap;
		margin: 30rpx 0 50rpx;
		font-size: 30rpx;
		display: flex;
		flex-flow: row;
		align-items: center;
		padding-left: 5%;

	}

	.pageimg {
		width: 90%;
		margin: 0rpx 30rpx;
		box-shadow: #999999 0rpx 0rpx 5rpx 5rpx;
	}

	.text {
		padding: 30rpx 30rpx;
		line-height: 50rpx;
	}

	.undertitle {
		font-size: 26rpx;
		font-weight: 100;
		color: #808080;
		display: flex;
		flex-flow: row;
		justify-content: space-around;
		align-items: center;
		margin-bottom: 20rpx;
	}

	.title {
		font-weight: 800;
		font-size: 46rpx;
		padding: 5%;
	}

	.shareitem {
		background-color: #fff;
		height: 350rpx;
	}

	.share {
		display: flex;
		flex-flow: row;
		justify-content: space-around;
		align-items: center;
		height: 70%;

	}

	.share image {

		width: 100rpx;
		height: 100rpx;
	}
</style>
