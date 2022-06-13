<template>
	<view>
		<view class="content">
			<swiper3D :imgList="imgList"></swiper3D>
		</view>
		<view class="listCount">
			<view class="listtitle">
				<view class="listlogoitem">
					<view class="listlogo"></view>
					<view class="listtopic">资讯</view>
				</view>
				<view class="listmore"  @click="tomore(1)">更多></view>
			</view>
			<view class="list"  v-for="(item,index) in newsad">
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>

					<view class="listword">

						<view>{{item.title}}</view>
					</view>

				</view>

				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">

					<view class="listword-2">

						<view>{{item.title}}</view>

					</view>
					

				</view>

				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">

						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>

					</view>

				</view>
								
				
						
						
						
						


				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">

						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>

				</view>



				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
			</view>
			
			<view class="nomore" v-show="newsad.length==0">
				暂无更多
			</view>
			
			
		</view>

		<view class="listCount">
			<view class="listtitle">
				<view class="listlogoitem">
					<view class="listlogo"></view>
					<view class="listtopic"   >设计</view>
				</view>
				<view class="listmore" @click="tomore(2)">更多></view>
			</view>
			
			<view class="list"  v-for="(item,index) in designad" >
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>
			
					<view class="listword">
			
						<view>{{item.title}}</view>
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">
			
					<view class="listword-2">
			
						<view>{{item.title}}</view>
			
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>
			
					</view>
			
				</view>
			
			
				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>
			
				</view>
			
			
			
				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
			</view>
			
			<view class="nomore" v-show="designad.length==0">
				暂无更多
			</view>
			
		</view>


		<view class="listCount">
			<view class="listtitle">
				<view class="listlogoitem">
					<view class="listlogo"></view>
					<view class="listtopic">爱车</view>
				</view>
				<view class="listmore" @click="tomore(3)">更多></view>
			</view>
			<view class="list" v-for="(item,index) in classad">
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>
			
					<view class="listword">
			
						<view>{{item.title}}</view>
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">
			
					<view class="listword-2">
			
						<view>{{item.title}}</view>
			
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>
			
					</view>
			
				</view>
			
			
				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>
			
				</view>
			
			
			
				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
			</view>
			
			<view class="nomore" v-show="classad.length==0">
				暂无更多
			</view>
		</view>


		<view class="listCount">
			<view class="listtitle">
				<view class="listlogoitem">
					<view class="listlogo"></view>
					<view class="listtopic" >走进AMG</view>
				</view>
				<view class="listmore"   @click="tomore(4)">更多></view>
			</view>
			<view class="list"  v-for="(item,index) in amgad" >
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>
			
					<view class="listword">
			
						<view>{{item.title}}</view>
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">
			
					<view class="listword-2">
			
						<view>{{item.title}}</view>
			
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>
			
					</view>
			
				</view>
			
			
				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>
			
				</view>
			
			
			
				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
			</view>
			<view class="nomore" v-show="amgad.length==0">
				暂无更多
			</view>
			
		</view>


		<view class="listCount">
			<view class="listtitle">
				<view class="listlogoitem">
					<view class="listlogo"></view>
					<view class="listtopic">历史</view>
				</view>
				<view class="listmore"   @click="tomore(5)">更多></view>
			</view>
			<view class="list" @click="topage" v-for="(item,index) in historyad">
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>
			
					<view class="listword">
			
						<view>{{item.title}}</view>
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">
			
					<view class="listword-2">
			
						<view>{{item.title}}</view>
			
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>
			
					</view>
			
				</view>
			
			
				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>
			
				</view>
			
			
			
				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
				
			</view>
			
			<view class="nomore" v-show="historyad.length==0">
				暂无更多
			</view>


		</view>

		<view class="listCount">
			<view class="listtitle">
				<view class="listlogoitem">
					<view class="listlogo"></view>
					<view class="listtopic">理念</view>
				</view>
				<view class="listmore"   @click="tomore(6)">更多></view>
			</view>
			<view class="list"  v-for="(item,index) in thinkad" >
				<view class="listitem" v-if="item.type==1" @click="topage(item.id)">
					<image class="listimg" :src="item.img1"></image>
			
					<view class="listword">
			
						<view>{{item.title}}</view>
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==2" @click="topage(item.id)">
			
					<view class="listword-2">
			
						<view>{{item.title}}</view>
			
					</view>
			
				</view>
			
				<view class="listitem" v-else-if="item.type==3" @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<view class="listimg-2">
							<image :src="item.img1" mode=""></image>
							<image :src="item.img2" mode=""></image>
							<image :src="item.img3" mode=""></image>
						</view>
			
					</view>
			
				</view>
			
			
				<view class="listitem" v-else @click="topage(item.id)">
					<view class="listword-2">
			
						<view>{{item.title}}</view>
						<video :src="item.video" show-loading controls class="video"></video>
					</view>
			
				</view>
			
			
			
				<view class="listunder">
					<view>
						{{item.see}}阅读
					</view>
					<view>
						{{item.date}}
					</view>
				</view>
			</view>
			
			<view class="nomore" v-show="thinkad.length==0">
				暂无更多
			</view>
			
			
			
			


		</view>


	</view>
</template>

<script>
	import swiper3D from '../../components/swiper3D.vue';
	export default {



		data() {
			return {
				newsad: [

				],
				designad: [
				
				],
				classad: [
				
				],
				amgad:[
					
				],
				historyad:[
					
				],
				thinkad:[
					
				],
				



				imgList: [{
						url: '../more/more?kind=1',
						src: '../../static/img/bz3.jpg',
						title: "走进奔驰——从设计到产品"
					}, {
						url: '../more/more?kind=2',
						src: '../../static/img/bz1.jpg',
						title: "品牌资讯——奔驰最新消息"
					},
					{
						url: '../more/more?kind=3',
						src: '../../static/img/bz2.jpg',
						title: "奔驰课堂——如何保护自己的爱车"
					},

				],
			}
		},

		onShow() {
			let that = this;
			uni.request({
				url: 'http://47.100.136.15:8087/passage/all', //仅为示例，并非真实接口地址。
				data: {

				},
				success: (res) => {
					that.newsad = res.data.news;
					that.designad = res.data.design;
					that.classad = res.data.class;
					that.amgad = res.data.amg;
					that.historyad = res.data.history;
					that.thinkad = res.data.think;

				}
			});
		},

		methods: {
			tomore(e) {
				uni.navigateTo({
					url: "../more/more?kind="+e
				})
			},

			topage(e) {
				uni.navigateTo({
					url: "../page/page?id="+e
				})
			},
		},
		components: {
			swiper3D
		}

	};
</script>
<style>
	.nomore {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		height: 100rpx;
		border-bottom: #C0C0C0 1rpx solid;


	}

	.video {
		width: 98%;
		margin: 20rpx 0;
	}

	.listlogoitem {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;

	}

	.listmore {
		font-size: 26rpx;
		color: #999999;
	}

	.listtopic {
		font-weight: 800;
		font-size: 36rpx;
	}

	.listlogo {
		width: 10rpx;
		height: 40rpx;
		background-color: #666666;
		margin-right: 10rpx;
	}

	.listtitle {
		padding-top: 50rpx;
		display: flex;
		flex-flow: row;
		justify-content: space-between;
		align-items: center;
		width: 93%;
		border-top: #c0c0c0 1rpx solid;
	}

	.listCount {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin-top: 10rpx;

		padding: 0rpx 3%;


	}

	.listCar {
		display: flex;
		flex-flow: column;
		width: 100%;
		margin: 0rpx;
		padding: 0rpx;


	}

	.listword {
		width: 60%;
		margin-left: 3%;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;

	}

	.listimg-2 {
		margin: 20rpx 0;
		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: flex-start;
		align-items: center;
	}

	.listimg-2 image {
		width: 32%;
		margin-right: 1%;

		height: 150rpx;

	}

	.listword-2 {
		width: 100%;
		margin-bottom: 20rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;

	}

	.listpage-2 {
		width: 100%;
		margin-top: 20rpx;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-self: flex-start;
		font-size: 28rpx;
		color: #666666;
		line-height: 40rpx;
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

	.content {
		background-color: #C0C0C0;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding-top: 20rpx;
		padding-bottom: 50rpx;

	}
</style>
