<template>
	<view class="dropdown-menu">
		<view class="dropdown-menu-head">
			<slot name="pre-title"></slot>
			<view class="item"  
				v-for="(item, index) in titles"
				:class="{active:activeIndex === index, selected: defaultTitles[index] != titles[index]}" 
				:key="index" 
				@tap="handleTitleTap(index)">
				<view class="title">{{item}}</view>
			</view>
			<slot name="append-title"></slot>
		</view>
		<slot></slot>
	</view>
</template>

<script>
export default {
	provide() {
		return {
			dropdownMenu: this
		}
	},
	props: {
		height: { //下拉菜单高度
			type: Number,
			default: 750
		}
	},
	data() {
		return {
			defaultTitles: [], //默认标题
			titles: [], //标题
			activeIndex: null //当前激活项
		}
	},
	created() {
		this.getTitles();
		this.defaultTitles = this.titles;
	},
	methods:{
		getActiveIndex() {
			//获取当前菜单激活状态索引
			const children = this.$children[0].$children.filter((item, index) => index > 0)
			this.activeIndex = children.findIndex((item, index) => item.isActive)
		},
		handleTitleTap(index) {
			//点击菜单标题，开关相应下拉菜单
			const children = this.$children[0].$children.filter((item, index) => index > 0)
			for (let i = 0; i < children.length; i++) {
				if (i == index) {
					children[i].toggle(true)
				} else {
					children[i].toggle(false)
				}
			}
			this.getActiveIndex();
		},
		getTitles() {
			//获取菜单标题列表
			let result = []
			for (let item of this.$slots.default) {
				if (item.componentOptions) {
					result.push(item.componentOptions.propsData.title)
				}
			}
			this.titles = result
		}
	}
}
</script>

<style lang="scss">
$primary: #E8414B;
.dropdown-menu{
	position: relative;
	height: 80rpx;
	.dropdown-menu-head{
		height: 80rpx;
		display: flex;
		align-items: center;
		.item{
			height: 40rpx;
			flex: 1;
			display: flex;
			justify-content: center;
			align-items: center;
			.title{
				position: relative;
				padding: 0 20rpx 0 0;
				font-size: 30rpx;
				color: #666;
				max-width: 80%;
				white-space: nowrap;
				text-overflow: ellipsis;
				overflow: hidden;
				&:after{
					position: absolute;
					top: 50%;
					right: 0;
					margin-top: -10rpx;
					border-color: transparent transparent #aaa #aaa;
					border-style: solid;
					border-width: 6rpx;
					transform: rotate(-45deg);
					content: "";
				}
			}
			&.active{
				.title{
					color: $primary;
					&:after{
						margin-top: 0;
						transform: rotate(135deg);
					}
				}
			}
			&.selected{
				.title{
					color: $primary;
				}
			}
			&+.item{
				border-left: 1px solid #eee;
			}
		}
	}
}
</style>
