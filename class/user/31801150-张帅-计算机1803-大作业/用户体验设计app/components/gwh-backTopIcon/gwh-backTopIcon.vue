<template>
	<view>
		<cover-image mode="aspectFill"  class="fixedView icon" @touchstart.stop="touchIcon" @touchmove.stop.prevent="moveIcon" @tap.stop="tapIcon"
		 :style="{left:iconPosition.left+'px',top:iconPosition.top+'px',width:iconSize.width+'upx',height:iconSize.height+'upx'}">
			<!-- <image mode="aspectFill" :src="icon_path" :style="{width:iconSize.width+'upx',height:iconSize.height+'upx'}"></image> -->
		</cover-image>
	</view>
</template>

<script>
	export default {
		data() {
			return {
			
				windowSize:{
					width:0,
					height:0,
					margin:{
						left:10,
						right:10,
						top:10,
						bottom:10,
					}
				},
				iconSize:{
					width:100,
					height:100
				},
				iconPosition:{
					left:0,
					top:0,
					touchPostion:{
						x:0,
						y:0
					}
				},
			}
		},
		props:{
			startPostion:{
				type:Number,
				default:3
			},
			iconWidth:{
				type:Number,
				default:100
			},
			iconHeight:{
				type:Number,
				default:100
			},
			marginLeft:{
				type:Number,
				default:10
			},
			marginRight:{
				type:Number,
				default:10
			},
			marginTop:{
				type:Number,
				default:10
			},
			marginBottom:{
				type:Number,
				default:10
			},
			
			/*tapFunction:{
				type:Function,
				default:this.tapIcon
			}*/
		},
		mounted() {
			this.$set(this.iconSize,'width',this.iconWidth);
			this.$set(this.iconSize,'height',this.iconHeight);
			this.$set(this.windowSize.margin,'left',this.marginLeft);
			this.$set(this.windowSize.margin,'right',this.marginRight);
			this.$set(this.windowSize.margin,'top',this.marginTop);
			this.$set(this.windowSize.margin,'bottom',this.marginBottom);
			this.$set(this.windowSize,'width',uni.getSystemInfoSync().windowWidth);
			this.$set(this.windowSize,'height',uni.getSystemInfoSync().windowHeight);
			switch(this.startPostion){
				case 0:
				//初始位置左上角
				this.$set(this.iconPosition,'left',this.windowSize.margin.left);
				this.$set(this.iconPosition,'top',this.windowSize.margin.top);
				break;
				case 1:
				//初始位置右上角
				this.$set(this.iconPosition,'left',this.windowSize.width - uni.upx2px(this.iconSize.width) - this.windowSize.margin.right);
				this.$set(this.iconPosition,'top',this.windowSize.margin.top);
				break;
				case 2:
				//初始位置左下角
				this.$set(this.iconPosition,'left',this.windowSize.margin.left);
				this.$set(this.iconPosition,'top',this.windowSize.height - uni.upx2px(this.iconSize.height) - this.windowSize.margin.bottom);
				break;
				default:
				//初始位置右下角
				this.$set(this.iconPosition,'left',this.windowSize.width - uni.upx2px(this.iconSize.width) - this.windowSize.margin.right);
				this.$set(this.iconPosition,'top',this.windowSize.height - uni.upx2px(this.iconSize.height) - this.windowSize.margin.bottom);
				break;
			}
			var that = this;
			
			
		},
		methods: {
			touchIcon(e){
				//console.log(e);
				this.$set(this.iconPosition.touchPostion,'x',e.touches[0].clientX);
				this.$set(this.iconPosition.touchPostion,'y',e.touches[0].clientY);
			},
			moveIcon(e){
				//console.log(e)
				/*this.iconPosition.left += (e.touches[0].clientX - this.iconPosition.touchPostion.x);
				this.iconPosition.top += (e.touches[0].clientY - this.iconPosition.touchPostion.y);
				this.iconPosition.touchPostion.x = e.touches[0].clientX;
				this.iconPosition.touchPostion.y = e.touches[0].clientY;*/
				this.$set(this.iconPosition,'left', e.touches[0].clientX - uni.upx2px(this.iconSize.width / 2));
				this.$set(this.iconPosition,'top', e.touches[0].clientY - uni.upx2px(this.iconSize.height / 2) + uni.getSystemInfoSync().windowTop);
				//console.log(uni.getSystemInfoSync());
				
				this.$set(this.iconPosition,'left',Math.min(this.windowSize.width - uni.upx2px(this.iconSize.width) - this.windowSize.margin.right, this.iconPosition.left));
				this.$set(this.iconPosition,'left',Math.max(this.windowSize.margin.left, this.iconPosition.left));
				this.$set(this.iconPosition,'top',Math.min(this.windowSize.height - uni.upx2px(this.iconSize.height) - this.windowSize.margin.bottom, this.iconPosition.top));
				this.$set(this.iconPosition,'top',Math.max(this.windowSize.margin.top, this.iconPosition.top));
			},
			tapIcon(e){
				//console.log('you tap icon');
				this.$emit('tapIcon');
			}
		}
	}
</script>

<style scoped lang="scss">
	.fixedView{
		position: fixed;
		z-index: 200;
		background-image: url(../../static/img/back.png);
		background-size: cover;
	}
	
	.icon{
		border-radius: 50%;
		overflow: hidden;
		border: none;
		box-shadow: 0px 2px 5px #C0C0C0 !important;
	}
</style>
