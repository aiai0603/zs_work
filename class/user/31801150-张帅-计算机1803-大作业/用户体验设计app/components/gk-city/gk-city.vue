
<template>
	<view>
		<view class="mask" :class="{'maskShow' : showPicker}" @click="hide" @click.stop.prevent @touchmove.stop.prevent catchtouchmove="true"></view>
		<view class="cpicker-content" :class="{'cpickerShow' : showPicker}">
			<!-- 优惠券页面，仿mt -->
			<view class="city-head" @click.stop.prevent @touchmove.stop.prevent catchtouchmove="true">
				<view class="city-head-title">{{headtitle}}</view>
				<text v-if="rightIcon" class="rightIcon iconfont icon-quxiao" @click="hide('self')"></text>
			</view>
			<scroll-view id="nav-bar" class="nav-bar"scroll-x="true" scroll-with-animation="true" :scroll-left="scrollLeft" >
				<view
					v-for="(item,index) in tabbars" 
					class="nav-item"
					:key="index"
					:id="'tab'+index"
					@click="changeTab(index)"
					 :class="{'current': index === tabCurrentIndex}"
				><text class="nav-bar-title">{{item.text}}</text></view>
			</scroll-view>
			<view class="city_content"> 
				<scroll-view class="panel-scroll-box" :scroll-y="enableScroll" :cscrollTop="scrollTop" :current="tabCurrentIndex" :scroll-top="scrollTop">
					<block v-for="(item,index) in showData" :key="index">
						<view class="flex-row-c-c" @click="changCity(tabCurrentIndex,item)">
							<icon type="success_no_circle" v-if="tabbars[tabCurrentIndex].value==item.value" :id="'show'+tabCurrentIndex" class="ischeck" size="14" color="#00B1B7" ></icon>
							<text class="city-text">{{item.text}}</text>
						</view>
					</block>
				</scroll-view>
			</view>
		</view>
	</view>
</template>

<script>
	let windowWidth = 0,scrollTimer = false, tabBar;
	export default {
		name: 'UniCityNvue',
		props: {
			headtitle: {    // 使用多少个tab
				type: String,
				default: ''
			},
			pickerSize: {    // 使用多少个tab
				type: [String, Number],
				default: 1
			},
			data: {      // 默认的省市区id，如果不使用id的情况下则为[]；
				type:Array,
				default:function(){
					return  [];
				},
			},
			provincedata: {      // 默认的省市区id，如果不使用id的情况下则为[]；
				type:Array,
				default:function(){
					return  [];
				},
			}
		},
		data() {
			return {
				isFirst: true,
				rightIcon:true,
				scrollLeft: 500, //顶部选项卡左滑距离
				scrollTop:0,
				enableScroll: true,
				tabCurrentIndex: 0, //当前选项卡索引
				tabbars:this.provincedata,
				showData:this.data,
				pickersize: this.pickerSize,
				showPicker: false
			}
		},
		watch: {
			showPicker(){
				if(this.isFirst){
					this.isFirst = false;
				}
			}
		},
		methods: {
			show(){
				this.showPicker = true;
				windowWidth = uni.getSystemInfoSync().windowWidth;
				if(this.provincedata.length>0&&this.provincedata.length<this.pickerSize&&this.isFirst&&this.provincedata[this.provincedata.length-1].value!=""){
					this.showData=this.findSameId(this.data,this.tabbars[this.provincedata.length],this.tabbars[this.provincedata.length-1]);
					var current={
							text:"请选择",
							value:"",
						}
					this.tabbars.push(current);
					this.tabCurrentIndex=this.provincedata.length-1;
					this.scrollTop=0;
					this.setScroll(this.tabCurrentIndex);
				}else{
					this.showData=this.findSameId(this.data,this.tabbars[this.provincedata.length-1],this.tabbars[this.provincedata.length-2]);
					this.tabCurrentIndex=this.provincedata.length-1;
					this.scrollTop=0;
					this.setScroll(this.tabCurrentIndex);
				}
			},
			findSameId(tree, currentTab,preTab) {
				let retNode = null;
				function deepSearch(tree, currentTab,preTab) {
					for (var i = 0; i < tree.length; i++) {
						if (tree[i].children && tree[i].children.length > 0) {
							deepSearch(tree[i].children, currentTab,preTab);
						}
						var flag=currentTab==undefined?true:(currentTab.value===""?true:false);
						var value=tree[i].value+"";
						var text=tree[i].text;
						if (preTab!=null&&flag&&preTab.text=== text&&preTab.value+"" ===value) {
							retNode=tree[i].children;
							break;
						}else if (currentTab!=null&&currentTab.text=== text&&currentTab.value+"" === value) {
							retNode=tree;
							break;
						}
					}
				}
				deepSearch(tree, currentTab,preTab);
				return retNode==null?tree:retNode;
			},
			
			hide(){
				this.showPicker = false;
			},
			//tab切换
			changeTab(e){
				let index = e;
				this.setScroll(index);
				//延迟300ms,等待swiper动画结束再修改tabbar
				this.tabCurrentIndex = index; 
				this.showData=this.findSameId(this.data,this.tabbars[index],index===0?this.tabbars[index]:this.tabbars[index-1]);
				setTimeout(()=>{
					this.getScroll("show"+index);
				}, 10)
			},
			//获得元素的size
			getElSize(id) { 
				return new Promise((res, rej) => {
					let el = uni.createSelectorQuery().in(this).select('#' + id);
					el.fields({
						size: true,
						scrollOffset: true,
						rect: true
					}, (data) => {
						res(data);
					}).exec();
				});
			},
			 changCity(index,item) {
				if(this.tabbars[index].value!=item.value){
					this.tabbars[index].text=item.text;
					this.tabbars[index].value=item.value;
					if(index<(this.tabbars.length-1)){
						this.tabbars.splice(index+1,this.tabbars.length-index-1)
					}
					if(this.tabbars.length<this.pickersize){
						var current={
								text:"请选择",
								value:""
							}
						this.showData=item.children;
						this.tabbars.push(current);
						this.tabCurrentIndex++; 
						this.scrollTop=0;
						this.setScroll(index);
					}else{
						this.$emit('funcvalue',this.tabbars);
						this.hide();
					}
				}
			},
			async setScroll(index){
				let width = 0;
				let nowWidth = 0;
				for (let i = 0; i <= index; i++) {
					let result = await this.getElSize('tab' + i);
					width += result.width;
					if(i === index){
						nowWidth = result.width;
					}
				}
				if ((width+nowWidth)>windowWidth) {
					this.scrollLeft=width+nowWidth;
				}else{
					this.scrollLeft = 0;
				} 
			},
			getScroll(id) {
				uni.createSelectorQuery().in(this).select('.panel-scroll-box').boundingClientRect((data)=>{
					uni.createSelectorQuery().in(this).select('#' + id).boundingClientRect((res)=>{
						if(res != undefined && res != null && res != ''){
							this.scrollTop=res.top-data.top;
						}
					}).exec()
				}).exec();
			}
		}
	}
</script>

<style lang="scss">
/* 优惠券面板 */
.mask {
    visibility: hidden;
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    z-index: 1000;
    background: rgba(0, 0, 0, .6);
    opacity: 0;
    transition: all .3s ease;
}
.maskShow {
    visibility: visible;
    opacity: 1;
}
.cpicker-content {
    position: fixed;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: #FFFFFF;
    transition: all .3s ease;
    transform: translateY(100%);
    z-index: 3000;
}
.cpickerShow {
    transform: translateY(0);
}
.city-head {
    width: 750rpx;
    height: 88rpx;
    flex-direction: column;
    border-bottom-width: 1px;
    border-bottom-color: #F4F4F4;
    border-bottom-style: solid;
}
.city-head-title {
    font-size: 15px;
    line-height: 88rpx;
    align-items: center;
    /* #ifndef APP-NVUE */
    text-align: center;
    /* #endif */
}
.rightIcon {
    position: absolute;
    right: 15px;
    top: -2px;
    font-size: 30px;
    color: #BEBEBE;
}
.nav-bar {
    position: relative;
    z-index: 10;
    height: 90upx;
    white-space: nowrap;
    box-shadow: 0 2upx 8upx rgba(0,0,0,.06);
    background-color: #fff;
}
.nav-bar::-webkit-scrollbar {
  display: none;
}
.nav-item {
    /* #ifndef APP-NVUE */
    display: inline-flex!important;
    /* #endif */
    /* #ifdef APP-NVUE */
    flex-direction: row!important;
    /* #endif */
    width: 170rpx;
    padding: 7px 0px;
    line-height: 26px;
    align-items: center;
    justify-content: center;
    color: #303133;
    position: relative;
    overflow: hidden;
    text-overflow: ellipsis;
}
.nav-bar-title {
    font-size: 12px;
}
.current {
  
    border-bottom-width: 4rpx;
    border-bottom-style: solid;
}
.current:after {
    width: 50%;
}
.panel-scroll-box {
    height: 516rpx;
    margin-top: 8px;
}
.flex-row-c-c {
    /* #ifndef APP-NVUE */
    display: block;
    /* #endif */
    /* #ifdef APP-NVUE */
    flex-direction: row;
    /* #endif */
    padding-left: 25px;
}
.city-text {
    /* #ifdef APP-NVUE */
    flex-direction: row;
    /* #endif */
    height: 35px;
    line-height: 35px;
    font-size: 13px;
}
.hide {
    opacity: 0;
}
.ischeck {
    /* #ifndef APP-NVUE */
    display: inline-flex!important;
    /* #endif */
    /* #ifdef APP-NVUE */
    flex-direction: column;
    /* #endif */
    margin-right: 5px;
    vertical-align: middle;
}

</style>