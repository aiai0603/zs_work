<template>
    <view class="container">
        <view class="nav-list">
            <view class="nav-item"
                v-for="(item,index) of list" 
                :class="{active:index==viewNavIndex}"
                @click="handleClickNav(index)"
                :key="index">分类{{index}}</view>
        </view>
        <view class="list-wrapper">
            <scroll-view class="list-container" id="list-container"
                @scroll="handleListScroll"
                @touchstart="handleTouchScrollView"
                :scroll-y="true" 
                :scroll-into-view="'scroll-item-'+clickedNavIndex" 
                :show-scrollbar="false"
                :scroll-with-animation="true">
                <view class="list" v-for="(item,listIndex) of list" :key="listIndex" :id="'scroll-item-'+listIndex">
                    <view class="title"><text>分类{{listIndex}}-对应内容</text></view>
                    <view class="item-container">
                        <view class="item" v-for="(item,index) of [1,2,3,4,5]" :key="index">
                            <image src="../../static/logo.png" mode=""></image>
                            <view class="name">分类{{listIndex}}-{{index}}</view>
                        </view>
                    </view>
                </view>
            </scroll-view>
        </view>
    </view>
</template>

<script>
export default {
    name: 'easy-scroll',
    props:{
        topDistance:{
            type: Number,
            default:0
        }
    },
    data() {
        return {
            list: Array(16).fill(1),//列表数据
            isTouchScrollView: false,
            clickedNavIndex: 0,
            viewNavIndex: 0,
            nodeInfoList: [],
        }
    },
    methods:{
        init(){
            const query = uni.createSelectorQuery().in(this);
            query.selectAll('#list-container .list').boundingClientRect(data => {
                // console.log(data);
                this.nodeInfoList = data
            }).exec()
        },
        handleClickNav(nav){
            if(!this.isTouchScrollView&&this.clickedNavIndex == nav) return;
            // 锁定联动
            this.isTouchScrollView = false;
            // 解决clickedNavIndex相同触发更新失败
            if(this.clickedNavIndex == nav){
                this.clickedNavIndex = -1;
            }
            this.$nextTick(function(){
                this.clickedNavIndex = nav;
                this.viewNavIndex = nav
            })
        },
        handleListScroll(e){
            if(!this.isTouchScrollView) return;
            let scrollTop = this.scrollTop = e.detail.scrollTop;
            // console.log("scrollTop: " + scrollTop);
            let currentNavIndex = this.nodeInfoList.map((item,index)=>({index,...item}))
            .filter(item => item.top <= scrollTop + this.topDistance)
            .sort((a,b)=>b.top-a.top)[0].index;
            // console.log(currentNavIndex);
            this.viewNavIndex = currentNavIndex;
        },
        handleTouchScrollView(){
            this.isTouchScrollView = true;
        },
    },
    mounted() {
        this.$nextTick(function(){
            this.init()
        })
    }
}
</script>

<style lang="stylus" scoped>
.container
    display flex
    height calc(100vh - var(--window-top))
    .nav-list
        width: 160rpx;
        border-right: 2rpx solid #efefef;
        overflow-y auto
        overflow-x hidden
        display flex
        flex-direction column
        align-items center
        font-size 34rpx
        &::-webkit-scrollbar
            width 0
            height 0
            background transparent
        .nav-item
            width 100%
            padding 25rpx 0
            text-align center
            transition: transform .1s linear;
            &.active
                color: #fb7d34
                transform-origin: center center;
                transform: scale(1.32);
    .list-wrapper
        flex 1
        position relative
        .list-container
            position absolute
            top 0
            left 0
            right 0
            bottom 0
            padding 0 32rpx
            box-sizing border-box
            .title
                height 132rpx
                line-height 132rpx
                text-align center
            .item-container
                display flex
                flex-wrap wrap
                align-items center
                .item
                    width 33.33%
                    text-align center
                    padding-top 21rpx 
                    padding-bottom 31rpx
                    image
                        width 104rpx
                        height 104rpx
                        margin-bottom 28rpx
                    .name
                        font-size 23rpx
                        color #0000008a
</style>
