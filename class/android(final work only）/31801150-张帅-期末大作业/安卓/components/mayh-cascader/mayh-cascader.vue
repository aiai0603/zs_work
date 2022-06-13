<template>
	<view>
		<view class="showTxt">{{showTxt}}</view>
		<view class="place-wrapper">
			<view class="place-content" v-for="(column,index) in multiArray" :key="index">
				<scroll-view :scroll-y="true" class="place-list">
					<view v-for="(item,i) in column" :key="i" :id="'s'+item.value" :class="['p-lable',{'active':item.checked}]" @tap="handleSelect(item,index)"
					 hover-class="hover-gray">
						<text>{{item.label}}</text>
						<text style="margin-left: 10rpx;" v-if="item.checked">✔</text>
					</view>
				</scroll-view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: 'cascaderSelect',
		components: {

		},
		data() {
			return {
				// 数据
				multiArray: [],
				// 选中的数据
				defaultValue: [],
				selectedData: [],
				showTxt: '请选择',
			}
		},
		props: {
			// 选中的值
			value: {
				type: Array,
				default () {
					return [];
				},
			},
			// 选项数据
			list: {
				type: Array,
				default () {
					return [];
				},
			},
		},
		computed: {

		},
		watch: {
			value(val) {
				if (this.defaultValue.length !== this.value.length) {
					//这里只需要判断 父组件异步是获取到数据就行
					console.log('只要执行一次');
					this.init();
				}
			}
		},
		mounted() {
			this.init();
		},
		methods: {
			init() {
				this.defaultValue = this.value || [];
				if (this.defaultValue.length === 0) {
					for (let i = 0; i < this.list.length; i++) {
						this.list[i].checked = false;
					}
					this.$set(this.multiArray, 0, this.list)
				} else {
					this.setColumns(this.list);
				}
				this.setTxt(this.selectedData);
			},
			// 初始化 更新选项数据
			setColumns(list = [], index = 0) {
				if (list.length) {
					// 选中的值
					const value = this.defaultValue[index] || '';
					let curIndex = 0;
					// 设置选中项
					for (let i = 0; i < list.length; i++) {
						if (list[i].value === value) {
							list[i].checked = true;
							curIndex = i;
							this.selectedData[index] = list[i];
						} else {
							list[i].checked = false;
						}
					}
					if (this.defaultValue.length >= index) {
						// 设置当前的列和下一子列
						this.$set(this.multiArray, index, list);
					} else {
						// 设置当前的列和下一子列
						this.$set(this.multiArray, index, []);
					}
					this.setColumns(list[curIndex].children || [], index + 1);
				}
			},
			// 设置选中显示值
			setTxt(arr) {
				let sarr = [];
				for (let i = 0; i < arr.length; i++) {
					sarr[i] = arr[i].label;
				}
				this.showTxt = (sarr.length ? sarr.join('-') : '请选择');
			},
			// 点击选中
			handleSelect(item, columnIndex) { //当前项 当前列下标				
				// 设置当前选中值
				this.defaultValue[columnIndex] = item.value;
				// 设置当前选项数据
				this.defaultValue = this.defaultValue.slice(0, columnIndex + 1);
				this.selectedData = this.selectedData.slice(0, columnIndex + 1);
				this.multiArray = this.multiArray.slice(0, columnIndex + 1);
							
				// 更新当前列 显示下一列
				this.setColumns(this.multiArray[columnIndex], columnIndex);
				// 显示值
				this.setTxt(this.selectedData);
				//发送事件
				this.$emit('input', this.defaultValue);
				this.$emit('on-change', this.selectedData);
			},
		}
	}
</script>
<style>
	.showTxt {
		width: 100%;
		height: 50rpx;
	}

	.place-wrapper {
		display: flex;
		height: 700rpx;
		padding: 10rpx 20rpx;

	}

	.place-content {
		flex: 1;
		height: 100%;
	}

	.place-list {
		width: 100%;
		height: 100%;
	}

	.p-lable {}

	.p-lable.active {
		color: #128CCB;
	}
</style>
