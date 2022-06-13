<template>
	<swiper class="box" :style="style" circular @change="swiperChange" autoplay="true" interval="3000" indicator-dots="true"
	:indicator-active-color="themeColor">
		<swiper-item  v-for="(item, index) in list" :key="index" class="box-item" @click="toDetailPage({index: index,id:item.id})">
			<image :style="style_img" :src="item.img" @error="onImageError(item)" />
		</swiper-item>
	</swiper>
	
</template>

<script>
	export default {
		props: {
			
			list: {
				type: Array,
				default () {
					return []
				}
			},
			padding: {
				type: Number,
				default: 0
			},
			isBack: {
				type: [Boolean, String],
				default: false
			},
			height: {
				type: Number,
				default: 0
			},
			borderRadius: {
				type: Number,
				default: 0
			},
			themeColor: {
				type: String,
				default: '#FFFFFF',
			},
		},
		computed: {
			style() {
				let that = this ;
				var height = parseInt(that.height);
				var padding = parseInt(that.padding);
				var style = '' ;
				if(height>0){
					style = `height:${height}upx;`;
				}
				if(padding>0){
					style += `padding:0upx ${padding}upx;`;
				}
				
				return style ;
			},
			style_img(){
				let that = this ;
				var borderRadius = that.borderRadius;
				var style = '' ;
				
				if(borderRadius>0){
					style += `border-radius:${borderRadius}upx;`;
				}
				return style ;
			},
		},
		
		watch: {
	
		},
		data() {
			return {
				
			};
		},
	
		methods: {
			swiperChange(e){
				this.$emit('swiperChange', e);
			},
			//详情页
			toDetailPage(item) {
				let that = this ;
				let list = that.list ;
				let index = item.index ;
				let data = {
					curIndex: index,
					item : list[index] ,
					list: list
				};
				this.$emit('toDetailPage', data);
			},
			
			onImageError(item, index) {
				//虽触发，但不会显示默认的图片				
				this.error = null; //这个暂没有发现作用
				
				let obj = {
					index: index,
					list: this.list
				};
				this.$emit('Error', obj);
			},
		}
	}
</script>

<style lang="scss">
	uni-image {
		width: 100%;
		height: 100%;
	}
	
	.box {
		width: 100%;
		height: 340upx;
	
		.box-item {
			width: 100%;
			height: 100%;
			padding: 0 0upx;
			overflow: hidden;
		}
	
		image {
			width: 100%;
			height: 100%;
			// border-radius: 20upx;
		}
	}
	
</style>
