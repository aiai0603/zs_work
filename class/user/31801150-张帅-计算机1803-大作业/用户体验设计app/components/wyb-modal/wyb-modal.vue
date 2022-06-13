<template>
	<view>
		<wyb-popup 
		 ref="popup"
		 type="center"
		 mode="size-fixed"
		 :scroll-y="false"
		 :width="width"
		 :height="height"
		 :radius="radius"
		 :mask-click-close="maskClickClose"
		 :mask-alpha="maskAlpha"
		 :duration="duration"
		 :centerAnim="animation"
		 :bg-color="bgColor"
		 :slide-multi="slideMulti"
		 :negative-top="negativeTop"
		 :zoom-lessen-multi="zoomLessenMulti">
		 
			<view class="wyb-modal">
				<view 
				 class="wyb-modal-title"
				 v-if="showTitle"
				 :style="{color: ftColor}">
					{{title}}
				</view>
				<view 
				 class="wyb-modal-content"
				 :style="{
					 paddingTop: padding[0] + 'rpx',
					 paddingRight: padding[1] || padding[0] + 'rpx',
					 paddingBottom: padding[2] || padding[0] + 'rpx',
					 paddingLeft: padding[3] || padding[0] + 'rpx',
					 lineHeight: lineHeight + 'rpx',
					 color: ftColor}">
					<text v-if="!custom">{{content}}</text>
					<view v-if="custom" @tap.stop.prevent @touchmove.stop.prevent><slot /></view>
				</view>
				<view class="wyb-modal-btns">
				<view class="wyb-modal-line" :style="{transform: scaleLine}" />
					<view class="wyb-modal-btn-box">
						<view
						 v-if="showCancel"
						 class="wyb-modal-cancel"
						 hover-class="wyb-modal-cancel-hover"
						 hover-stay-time="100"
						 :style="{
							 color: cancelColor || ftColor,
							 borderBottomLeftRadius: radius + 'px'}"
						 @tap="onBtnsTap(0)">
							{{cancelText}}
						</view>
						<view
						 class="wyb-modal-confirm"
						 hover-class="wyb-modal-confirm-hover"
						 hover-stay-time="100"
						 :style="{
							 color:confirmColor,
							 borderBottomRightRadius: radius + 'px'}"
						 @tap="onBtnsTap(1)">
							<text v-if="!confirmClick">{{confirmText}}</text>
							<view v-if="asyncClose&&confirmClick" class="wyb-modal-loading">
								<view class="wyb-modal-loader" :style="{
									 borderTop: '1.5px solid ' + loadingColor.top,
									 borderRight: '1.5px solid ' + loadingColor.right,
									 borderBottom: '1.5px solid ' + loadingColor.bottom,
									 borderLeft: '1.5px solid ' + loadingColor.left,
									 transform: 'scale(0.5)'}" />
							</view>
						</view>
					</view>
				</view>
			</view>
			
		</wyb-popup>
	</view>
</template>

<script>
	import wybPopup from '@/components/wyb-popup/wyb-popup.vue'
	export default {
		components: {
			wybPopup
		},
		data() {
			return {
				ftColor: '#000',
				scaleLine: 'scaleY(1)',
				confirmClick: false
			}
		},
		computed: {
			loadingColor() {
				let color = this.confirmColor.slice()
				let rgbList = this.hexToRgb(color)
				let top = 'rgba(' + rgbList[0] + ',' + rgbList[1] + ',' + rgbList[2] + ', 0.3)'
				let bottom = 'rgba(' + rgbList[0] + ',' + rgbList[1] + ',' + rgbList[2] + ', 0.3)'
				let right = 'rgba(' + rgbList[0] + ',' + rgbList[1] + ',' + rgbList[2] + ', 0.3)'
				let left = 'rgb(' + rgbList[0] + ',' + rgbList[1] + ',' + rgbList[2] + ')'
				return {
					top,
					bottom,
					right,
					left
				}
			}
		},
		props: {
			title: {
				type: String,
				default: '标题'
			},
			showTitle: {
				type: Boolean,
				default: true
			},
			content: {
				type: String,
				default: '内容'
			},
			confirmText: {
				type: String,
				default: '确认'
			},
			cancelText: {
				type: String,
				default: '取消'
			},
			confirmColor: {
				type: String,
				default: '#007aff'
			},
			cancelColor: {
				type: String,
				default: '#000'
			},
			showCancel: {
				type: Boolean,
				default: true
			},
			width: {
				type: [String, Number],
				default: 600
			},
			height: {
				type: [String, Number],
				default: 350
			},
			radius: {
				type: [String, Number],
				default: 5
			},
			maskClickClose: {
				type: Boolean,
				default: false
			},
			maskAlpha: {
				type: Number,
				default: 0.5
			},
			duration: {
				type: Number,
				default: 400
			},
			animation: {
				type: String,
				default: 'zoom-lessen'
			},
			bgColor: {
				type: String,
				default: '#fff'
			},
			color: {
				type: String,
				default: ''
			},
			lineHeight: {
				type: [String, Number],
				default: 30
			},
			zoomLessenMulti: {
				type: Number,
				default: 1.2
			},
			slideMulti: {
				type: Number,
				default: 0.15
			},
			custom: {
				type: Boolean,
				default: false
			},
			negativeTop: {
				type: Number,
				default: 0
			},
			asyncClose: {
				type: Boolean,
				default: false
			},
			padding: {
				type: Array,
				default() {
					return [20]
				}
			}
		},
		mounted() {
			this.getFtColor()
		},
		methods: {
			onBtnsTap(idx) {
				switch(idx) {
					case 0:
						this.hideModal()
						this.$emit('cancel')
					break
					case 1:
						if (!this.confirmClick) {
							this.$emit('confirm')
						}
						if (this.asyncClose) {
							this.confirmClick = true
						} else {
							this.hideModal()
						}
					break
				}
			},
			getFtColor() {
				let r = 0, g = 0, b = 0
				if (this.bgColor.indexOf('#') !== -1) {
					let arr = this.hexToRgb(this.bgColor)
					r = arr[0], g = arr[1], b = arr[2]
				} else {
					let hasAlpha = this.bgColor.indexOf('a') !== -1
					let root = this.bgColor.slice()
					let idx = root.indexOf('(') + 1
					root = root.substring(idx)
					let firstDotIdx = root.indexOf(',')
					r = parseFloat(root.substring(0, firstDotIdx))
					root = root.substring(firstDotIdx + 1)
					let secondDotIdx = root.indexOf(',')
					g = parseFloat(root.substring(0, secondDotIdx))
					root = root.substring(secondDotIdx + 1)
					if (hasAlpha) {
						let thirdDotIdx = root.indexOf(',')
						b = parseFloat(root.substring(0, thirdDotIdx))
					} else {
						b = parseFloat(root)
					}
				}
				if (r * 0.299 + g * 0.578 + b * 0.114 >= 192){
					//浅色
					this.ftColor = this.color || '#000'
					this.scaleLine = 'scaleY(1)'
				} else {
				    //深色
					this.ftColor = this.color || '#fff'
					this.scaleLine = 'scaleY(0.5)'
				}
			},
			hexToRgb(color) {
				if (color.length === 4) {
					let arr = color.split('')
					color = '#' + arr[1] + arr[1] + arr[2] + arr[2] + arr[3] + arr[3]
				}
				let color16List = [color.substring(1, 3), color.substring(3, 5), color.substring(5, 7)]
				let r = parseInt(color16List[0], 16)
				let g = parseInt(color16List[1], 16)
				let b = parseInt(color16List[2], 16)
				return [r, g, b]
			},
			RGBChange(color, level, type) {
				// hex转rgb
				if (color.length === 4) {
					let arr = color.split('')
					color = '#' + arr[1] + arr[1] + arr[2] + arr[2] + arr[3] + arr[3]
				}
				let color16List = [color.substring(1, 3), color.substring(3, 5), color.substring(5, 7)]
				let r = parseInt(color16List[0], 16)
				let g = parseInt(color16List[1], 16)
				let b = parseInt(color16List[2], 16)
				let rgbc = [r, g, b]
				// 减淡或加深
				for (var i = 0; i < 3; i++)
					type === 'light' ? rgbc[i] = Math.floor((255 - rgbc[i]) * level + rgbc[i]) : rgbc[i] = Math.floor(rgbc[i] * (1 -
						level))
				// rgb转hex
				let R = rgbc[0].toString(16)
				let G = rgbc[1].toString(16)
				let B = rgbc[2].toString(16)
				if (R.length === 1) R = '0' + R
				if (G.length === 1) G = '0' + G
				if (B.length === 1) B = '0' + B
				return '#' + R + G + B
			},
			showModal() {
				this.$refs.popup.show()
			},
			hideModal() {
				if (this.confirmClick) {
					this.confirmClick = false
				}
				this.$refs.popup.hide()
			}
		}
	}
</script>

<style>
	.wyb-modal {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		z-index: 10080;
		overflow: hidden;
	}
	
	.wyb-modal-title {
		width: 100%;
		height: 70rpx;
		display: flex;
		align-items: flex-end;
		justify-content: center;
		font-size: 35rpx;
	}
	
	.wyb-modal-content {
		width: 100%;
		flex: 1;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		box-sizing: border-box;
		font-size: 30rpx;
	}
	
	.wyb-modal-line {
		width: 100%;
		height: 1px;
		background-color: #f1f1f1;
		
	}
	
	.wyb-modal-btns {
		width: 100%;
		height: 100rpx;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.wyb-modal-btn-box {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: row;
		align-items: center;
		font-size: 35rpx;
	}
	
	.wyb-modal-cancel,
	.wyb-modal-confirm {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
	}
	
	.wyb-modal-cancel-hover {
		background-color: rgba(0, 0, 0, 0.08) !important;
	}
	
	.wyb-modal-confirm-hover {
		background-color: rgba(0, 0, 0, 0.08) !important;
	}
	
	.wyb-modal-loader {
		width: 35rpx;
		height: 35rpx;
		position: relative;
		-webkit-animation: loading .75s infinite linear;
		animation: loading .75s infinite linear;
	}
	
	.wyb-modal-loader,
	.wyb-modal-loader:after {
		border-radius: 50%;
	}
	
	@-webkit-keyframes loading {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
	
		100% {
			-webkit-transform: rotate(360deg);
			transform: rotate(360deg);
		}
	}
	
	@keyframes loading {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
	
		100% {
			-webkit-transform: rotate(360deg);
			transform: rotate(360deg);
		}
	}
</style>
