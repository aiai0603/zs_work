<template>
	<view>
		<view class="title">
			<view class="back" v-show="!search" @click="back"></view>
			<input class="title-input" :class="{short:search==false}" placeholder="活动 | 无畏共联盟" @click="searchNav" />

			<icon type="search" size="18" colo />

		</view>
		<view style="height: 100rpx">

		</view>
		<view v-show="search">
			<view>
				<topicon class="topicon" :iconWidth="70" :iconHeight="70" :startPostion="3" :marginBottom="40" :marginTop="60"
				 :marginLeft="5" :marginRight="20" @tapIcon="tapIcon"></topicon>
			</view>

			<carousel :img-list="imgList" url-key="url" @selected="selectedBanner" />


			<view class="main-title">
				　<view @tap="change2(0)" :class="{btna2:btnnum2 == 0}">奔驰新闻</view>
				　<view @tap="change2(1)" :class="{btna2:btnnum2 == 1}">热点车型</view>
				　<view @tap="change2(2)" :class="{btna2:btnnum2 == 2}">品牌活动</view>
				　
			</view>
			<view class="end-cont" :class="{listCount:btnnum2 == 0}" @touchstart="start" @touchend="end">

				<view class="list" v-for="(item,index) in newsad" @click="topage(item.id)">
					<view class="listitem">

						<image :src="item.img1" class="listimg"></image>
						<view class="listword">
							<view>{{item.title}}</view>
						</view>
						

					</view>
					<view class="listunder">
						<view>
							{{item.see}}人看过 {{item.like}}人点赞
						</view>
						<view @click.stop="close(index)">
							×
						</view>
					</view>
				</view>
				<view class="more" @click="more" v-show="!loadingStatus">
					点击加载更多
				</view>
				<dengLoading :loadModal="loadingStatus"></dengLoading>


			</view>



			<view class="end-cont" :class="{listCount:btnnum2 == 1}"  @touchstart="start" @touchend="end">
				<view class="car-title">
					　<view @tap="changeCar(0)" :class="{btna2:btncar == 0}">轿车</view>
					　<view @tap="changeCar(1)" :class="{btna2:btncar == 1}">SUV</view>
					　<view @tap="changeCar(2)" :class="{btna2:btncar == 2}">跑车</view>
					  <view @tap="changeCar(3)" :class="{btna2:btncar == 3}">MPV</view>
					　<view @tap="changeCar(4)" :class="{btna2:btncar == 4}">纯电动</view>

					　
				</view>
				<view class="end-cont listCar">

					<view class="list" v-for="(item,index) in car" v-show="item.type == btncar+1  ">
						<view class="caritem" @click="toCar">

							<image :src="item.img" class="carimg"></image>
							<view class="carword">

								<view>{{item.name}}</view>
								<view class="caricon">
									<view style="background-color: #FFA200" v-show="item.sale==1">热销</view>
									<view v-show="item.newCar==1" style="background-color: #007AFF">新品</view>
								</view>
								<view>¥{{item.money/10000}}万起</view>
							</view>
						</view>

					</view>

				</view>

				<view class="more">
					暂无更多
				</view>


			</view>




			<view class="end-cont" :class="{listCount:btnnum2 == 2}"   @touchstart="start" @touchend="end">
				　 <view class="list" v-for="(item,index) in activity">
					<view class="actitem">

						<image :src="item.img" class="actimg"></image>
						<view> {{item.name}}</view>
					</view>
					<view class="actunder">
						<view>
							活动时间：{{item.date==0?"无限期":item.date+"-"+item.dateend}} 名额限制：{{item.allpeople==-1?"无限制":item.nowpeople+"/"+item.allpeople}}
						</view>

					</view>
				</view>
				<view class="more">
					暂无更多活动
				</view>
			</view>



		</view>
		<view v-show="!search">
			<view>

				<view class="end-title">
					　<view @tap="change(0)" :class="{btna:btnnum == 0}">搜索发现</view>
					　<view @tap="change(1)" :class="{btna:btnnum == 1}">热搜榜</view>
					　
				</view>
				<view class="end-cont" :class="{dis:btnnum == 0}">
					<view class="newsitem">

						<view class="news" v-for="(item,index) in news" :key="index">
							{{item.msg}}
							<view v-show="item.new" class="new"> 新 </view>
							<view v-show="item.hot" class="hot"> 热 </view>
						</view>

					</view>

				</view>

				<view class="end-cont" :class="{dis:btnnum == 1}">
					　　<view class="newsitem">

						<view class="news" v-for="(item,index) in rank" :key="index">
							<view style="margin-right: 20rpx;" :class="{rank:index<3}">{{index+1}}</view> {{item.msg}}
						</view>

					</view>
				</view>

			</view>
			<image src="require(../../static/img/lb4.jpg)" mode="" class="imgad"></image>
		</view>





	</view>
</template>

<script>
	import carousel from '@/components/vear-carousel/vear-carousel'
	import topicon from '@/components/gwh-backTopIcon/gwh-backTopIcon.vue'
	import dengLoading from  '@/components/loading.vue'

	export default {
		components: {
			carousel,
			topicon,
			dengLoading

		},
		data() {
			return {
				startData: {
					clientX: 0,
					clientY: 0
				},
				newsad: [

				],
				

				activity: [

				],

				loadingStatus:false,

				car: [
					
				],


				animationData: {},
				page:0,
				search: true,
				btnnum: 0,
				btnnum2: 0,
				btncar: 0,
				news: [{
					msg: "无畏共联盟",
					new: 0,
					hot: 0,
				}, {
					msg: "奔驰冰雪对决",
					new: 1,
					hot: 0,
				}, {
					msg: "征战F1",
					new: 0,
					hot: 0,
				}, {
					msg: "无畏共联盟",
					new: 0,
					hot: 0,
				}, {
					msg: "跨年特惠",
					new: 0,
					hot: 1,
				}, {
					msg: "新车上市",
					new: 0,
					hot: 1,
				}, ],
				rank: [{
					msg: "新车上市",

				}, {
					msg: "奔驰冰雪对决",

				}, {
					msg: "征战F1",

				}, {
					msg: "无畏共联盟",

				}, {
					msg: "跨年特惠",
				}, {
					msg: "asap艺术展"
				}],
				themeColor: '#33CCCC',
				imgList: [{
					url: '../../static/img/lb1.jpg',
					id: 1
				}, {
					url: '../../static/img/lb2.jpg',
					id: 2
				}, {
					url: '../../static/img/lb3.jpg',
					id: 3
				}, {
					url: '../../static/img/lb4.jpg',
					id: 4
				}]

			}
		},
		onLoad(){
			let that=this;
			uni.request({
			    url: 'http://47.100.136.15:8087/passage/index', //仅为示例，并非真实接口地址。
			    data: {
			       page:0
			    },
			    success: (res) => {
			     that.newsad=res.data.data;
				 that.page=0
			    }
			});
			
			
		
			uni.request({
			    url: 'http://47.100.136.15:8087/act/list', //仅为示例，并非真实接口地址。
			    data: {
			      
			    },
			    success: (res) => {
			     that.activity=res.data.data;
				 
			    }
			});
			
			uni.request({
			    url: 'http://47.100.136.15:8087/car/all', //仅为示例，并非真实接口地址。
			    data: {
			      
			    },
			    success: (res) => {
				
			     that.car=res.data.data;
				 
			    }
			});
			
			
		},
		onReachBottom() {
			this.more();
		},
		onPullDownRefresh() {
			var that=this
			
			if (this.btnnum2 == 0) {
				uni.request({
				    url: 'http://47.100.136.15:8087/passage/index', //仅为示例，并非真实接口地址。
				    data: {
				       page:0
				    },
				    success: (res) => {
				     that.newsad=res.data.data;
					 that.page=1;
					
				    }
				});
			}

			uni.stopPullDownRefresh();
		},


		methods: {
			toCar(){
				uni.navigateTo({
					url:"../showcar/showcar"
				})
			},
			topage(e){
				uni.navigateTo({
					url:"../page/page?id="+e
				})
			},

			start(e) {

				this.startData.clientX = e.changedTouches[0].clientX;

				this.startData.clientY = e.changedTouches[0].clientY;
			},
			end(e) {
				// console.log(e)
				const subX = e.changedTouches[0].clientX - this.startData.clientX;
				const subY = e.changedTouches[0].clientY - this.startData.clientY;
				if (subY > 50 || subY < -50) {

				} else {
					if (subX > 100) {
						
						    
						if (this.btnnum2 != 0) {
							this.btnnum2 -= 1;
						}
					} else if (subX < -100) {
							
						if (this.btnnum2 != 2) {
							this.btnnum2 += 1;
						}
					} else {

					}
				}
			},


			more() {
				let that=this;
				this.loadingStatus=true;
				if (this.btnnum2 == 0) {
					uni.request({
					    url: 'http://47.100.136.15:8087/passage/index', //仅为示例，并非真实接口地址。
					    data: {
					       page:this.page+1
					    },
					    success: (res) => {
					     let morearr=res.data.data;
						  that.loadingStatus=false;
						if(morearr!=null&&morearr.length>0)
						{
							that.newsad.push(...morearr);
							that.page=that.page+1;
						}
						
						 if(morearr==null||morearr.length<4)
						 {
							 uni.showToast({
							 	title: '没有更多了',
							 	icon: 'none',
							 	duration: 1000
							 });
						 }
					    }
					});
				
				}
				
			},

			close(e) {
				let that = this;
				uni.showModal({
					title: '提示',
					content: '不再为您推荐类似内容',
					success: function(res) {
						if (res.confirm) {
							that.newsad.splice(e, 1);
						} else if (res.cancel) {
							console.log('用户点击取消');
						}
					}
				});

			},
			tapIcon(e) {
				uni.pageScrollTo({
					scrollTop: 0,
					duration: 300
				});
			},

			selectedBanner(item, index) {

			},
			change(e) {
				this.btnnum = e

			},

			changeCar(e) {
				this.btncar = e

			},

			change2(e) {
				this.btnnum2 = e

			},

			back() {

				this.search = true
			},
			searchNav() {

				this.search = false

			}
		}
	}
</script>

<style>
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

	.topicon>>>.icon {
		border: #4CD964 2upx solid;
	}

	.topicon {
		background-image: url(../../static/img/back.png);
		background-size: cover;
	}

	.more {
		display: flex;
		flex-flow: row;
		width: 97%;
		justify-content: center;
		align-items: center;
		height: 100rpx;
	}



	.listword {
		width: 60%;
		margin-left: 3%;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;

	}

	.listunder {
		width: 93%;
		color: #808080;
		font-size: 24rpx;
		display: flex;
		flex-flow: row;
		justify-content: space-between;
		padding-bottom: 20rpx;
		border-bottom: #C0C0C0 1rpx solid;

	}

	.listimg {
		width: 40%;
		height: 170rpx;
	}

	.listitem {
		width: 95%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		margin-bottom: 20rpx;
	}

	.list {
		margin-top: 30rpx;
		width: 100%;


	}


	.chat-custom-right {
		flex: 1;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		justify-content: space-between;
		align-items: flex-end;
	}

	.chat-custom-text {
		font-size: 12px;
		color: #999;
	}

	.btna2 {
		font-weight: 800;
		background-color: #f0f0f0;

	}

	.main-title {
		display: flex;
		font-size: 32rpx;
		box-shadow: #C0C0C0 0px 0px 1px 1px
	}

	.main-title view {
		padding: 20rpx 0;
		flex-grow: 1;
		text-align: center;
		transform: 1s;
	}

	.car-title {
		display: flex;
		font-size: 26rpx;
		margin-top: 20rpx;

	}

	.car-title view {
		padding: 10rpx 30rpx;
		margin: 10rpx;
		text-align: center;
		transform: 1s;
		border-radius: 30rpx;
		box-shadow: #C0C0C0 0px 0px 1px 1px;
	}

	.back {
		width: 6%;
		height: 45rpx;
		margin-right: 10rpx;
		background-image: url(../../static/img/goback.png);
		background-size: cover;
	}

	.title {
		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		padding: 10px 0;
		position: fixed;
		width: 100%;
		left: 0;
		right: 0;
		/* #ifdef H5 /
		top: 44px;//适配网页
		/ #endif /
		/ #ifndef H5 /
		top: 0;//适配其他平台
		/ #endif */
		z-index: 1;
		background-color: white;
	}

	.title-input {
		width: 80%;
		background-color: #eeeeee;
		padding: 15rpx;
		font-size: 24rpx;
		margin-right: 20rpx;
	}

	.rank {
		color: #FFA200;
		font-weight: 800;
	}

	.imgad {
		width: 100%;
		height: 300rpx;
		margin-top: 30rpx;
	}

	.new {
		color: white;
		background-color: #007AFF;
		font-size: 24rpx;
		display: flex;
		width: 40rpx;
		height: 40rpx;
		flex-flow: row;
		flex-wrap: wrap;
		justify-content: center;
		align-items: center;
		margin-left: 20rpx;

	}

	.hot {
		color: white;
		background-color: #FFA200;
		font-size: 24rpx;
		display: flex;
		width: 40rpx;
		height: 40rpx;
		flex-flow: row;
		flex-wrap: wrap;
		justify-content: center;
		align-items: center;
		margin-left: 20rpx;

	}

	.newsitem {
		margin-top: 50rpx;
		display: flex;
		width: 100%;
		height: 100%;
		flex-flow: row;
		flex-wrap: wrap;
		justify-content: center;
		align-items: center;
	}

	.news {
		display: flex;
		width: 35%;
		justify-content: start;
		align-items: center;
		flex-flow: row;
		margin: 20rpx 0rpx;
		padding-left: 30rpx;
		font-size: 30rpx;
	}

	.end-title {
		display: flex;
		font-size: 32rpx;
		position: sticky;
	}

	.end-title view {
		flex-grow: 1;
		text-align: center;
	}

	.end-cont {
		display: none;

	}

	.btna {
		font-weight: 800;

	}

	.dis {
		display: flex;
	}

	.short {
		width: 75%;
	}

	.listCount {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;
		padding: 0rpx 3%;

	}


	.listCar {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;


	}



	uni-page-body,
	#app {

		width: 100%;


	}
</style>
