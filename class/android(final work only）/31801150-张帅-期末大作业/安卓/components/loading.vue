<template>
	<view>
		<view class="cu-load load-modal" v-if="loadModal">
			<!-- <view class="cuIcon-emojifill text-orange"></view> -->
			
			<view class="gray-text">加载中...</view>
		</view>
	</view>
</template>
 
<script>
export default {
	props: {
		loadModal: true
	},
	data() {
		return {};
	},
	methods: {
		LoadModal(e) {
			this.loadModal = true;
			setTimeout(() => {
				this.loadModal = false;
			}, 500);
		}
	}
};
</script>
 
<style>
	.gray-text{
		width: 100%;
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		padding: 30rpx 0;
	}
		
	
</style>