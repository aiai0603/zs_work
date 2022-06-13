<template>
	<view class="loading">
		<image src="../../static/img/loading.jpg" mode="" class="loading" ></image>
	</view>
</template>

<script>
	export default {
		data() {
			return {
					
			}
		},
		
		onReady() {
			 setTimeout(
			 function() {
			       uni.switchTab({
			            url:'../index/index',
						animationType: 'pop-out',
						animationDuration: 1000
			       })
			  }, 4000);
		}
		
	}
</script>

<style>
	uni-page-body,
	#app {
		width: 100%;
		height: 100%;
	}

	.loading {
		width: 100%;
		height: 100%;

	}
</style>
