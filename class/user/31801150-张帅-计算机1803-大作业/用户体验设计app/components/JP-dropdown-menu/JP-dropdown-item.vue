<template>
	<view class="dropdown-item" ref="item" 
		:class="{active: isActive}" 
		:style="{height: isActive ? `${containerHeight}px`: '0'}" 
		@touchmove.prevent="noop">
		<view class="overlay" @tap="close"></view>
		<view class="wrap">
			<scroll-view scroll-y class="content" :style="{maxHeight: `${contentHeight}rpx`, transform: `translate3d(0,${-contentHeight}rpx, 0)`}">
				<slot></slot>
			</scroll-view>
		</view>
	</view>
</template>

<script>
	export default {
		inject: ['dropdownMenu'],
		props: {
			Myitem: {//当前菜单标题
				type: String,			
				default: ''
			},			
			title: {//当前菜单标题
				type: String,			
				default: ''
			}
		},
		data() {
			return {
				containerHeight: 0,
				isActive: false //激活状态
			}
		},
		computed: {
			contentHeight() { //内容区高度
				return this.dropdownMenu.height
			},
		},
		watch:{
			title() { //监听当前菜单标题，通知父级更新标题
				this.dropdownMenu.getTitles()
			}
		},
		mounted() {
			this.getContainerHeight();
		},
		methods: {
			noop() {},
			async getContainerHeight() {
				//获取容器到屏幕底部高度
				let ref =  document.querySelector('.dropdown-item')
				let top = ref && ref.getBoundingClientRect().top
				let info = await uni.getSystemInfo()
				let winH = info[1].screenHeight
				this.containerHeight = winH - top
			},
			toggle(bool) {					
				//开关菜单
				if (bool) {
					this.isActive = this.isActive? !bool: bool
				} else {
					this.isActive = bool
				}
			},
			close() {
				//关闭菜单
				this.isActive = false;
				this.dropdownMenu.getActiveIndex()
			}
		}
	}
</script>

<style lang="scss">
.dropdown-item{
	width: 100%;
	height: 1000px;
	position: absolute;
	top: 80rpx;
	left: 0;
	right: 0;
	overflow: hidden;
	z-index: 99;
	.overlay{
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: rgba(0, 0, 0, 0.5);
	}
	.wrap{
		overflow: hidden;
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		z-index: 100;
		.content{
			border-top: 1px solid #eee;
			background: #fff;
			overflow-y: auto;
			transition-duration: 200ms;
		}
	}
	&.active{
		z-index: 3;
		.wrap{
			.content{
				transform: translate3d(0,0,0) !important;
			}
		}
	}
}
</style>
