## 什么是 uniCloud 
uniCloud 是 DCloud 联合阿里云、腾讯云，为开发者提供的基于 serverless 模式和 js 编程的云开发平台，更多请参考[uniCloud文档](https://uniapp.dcloud.io/uniCloud)。

## 云端一体页面的优势是什么
过去，开发一个列表，需要在后端设计数据库，提供接口，前端写列表，处理分页、下拉刷新，并保证长列表的性能，全套工作下来需要1、2天。

现在有了云端一体列表，上述工作都不用做了，页面拿来就用。

在HBuilderX 2.9+，新建页面时，可以直接选择大量云端一体页面模板，数据库、后台接口、前端页面都有了。

当然，您也可以调整，自定义数据库表和前端的ui。

## 后台数据表
后台数据表使用 [openDB](https://gitee.com/dcloud/opendb/tree/master) 设计规范，它约定了一个标准用户表的表名和字段定义，并且基于nosql的特性，可以由开发者自行扩展字段。`openDB`是[uniCloud](https://uniapp.dcloud.io/uniCloud/README)的重要软基建，支撑`uniCloud`数字生态的发展。


## 页面模板简介

列表是我们在项目开发中常见的一个需求，对于基础列表 [uni-list](https://ext.dcloud.net.cn/plugin?id=24) 组件已经提供了大部分常见的功能。

但是如果我们想要实现一个复杂的新闻列表，难免需要我们去实现不同的复杂列表布局，例如一些图文混排、左图右文、右图左文、大图略缩图、多图略缩图等多种不同排版组合，同时我们可能还需要应对不同的数据展示。

那么现在我们给大家提供了一个基于 uni-list 组件的云端一体化新闻列表页面模板，帮大家快速构建一个复杂多变的新闻列表。

当前模板做了四个事情：

- 通过 `openDB` 的 [opendb-news-articles](https://gitee.com/dcloud/opendb/tree/master/collection/opendb-news-articles)表规范表结构
- 通过 [uni-clientDB](https://ext.dcloud.net.cn/plugin?id=2314) 在本地操作数据库获取数据
- 实现常见的六种新闻列表排版，减少实现同类需求构建代码的工作量
- 实现简单的下拉刷新，上拉加载

**Tips**
- 暂不支持 nvue 页面

## 使用说明

当前模板是在 uni-list 组件基础上，通过插槽的方式实现了不同的新闻列表排版，同时使用了 [uni-clientDB](https://ext.dcloud.net.cn/plugin?id=2314) 完成了云端一体化。大大减少了大家的的代码开发时间。

1. 在 `cloudfunctions` 目录，右键上传所有云函数及公共模块
2. 在 `cloudfunctions` > `db_init.json` 文件，右键初始化数据库，数据结构参考 `openDB` 的[opendb-news-articles](https://gitee.com/dcloud/opendb/tree/master/collection/opendb-news-articles)表结构
3. 运行到 Chrome 查看效果


## 代码说明
> 代码逻辑以及样式见代码示例

### 基本排版

我们提供了六种排版布局，基本上包括了市面上大部分的新闻类列表的常见排版，具体实现代码如下

```html
<uni-list>
	<!-- 垂直排列，略缩图显示大图 -->
	<uni-list-item direction="column" note="Dcloud 128评论 21 赞">
		<template v-slot:header>
			<view class="uni-title">垂直排列的大图模式列表， header 内容为插槽自定义的内容</view>
			<view class="uni-thumb uni-content list-picture"><image src="/static/logo.png" mode="aspectFill"></image></view>
		</template>
	</uni-list-item>
	<!-- 垂直排列，图文混排 -->
	<uni-list-item direction="column">
		<template v-slot:header>
			<view class="uni-title">垂直排列的图文混排列表，内容通过 body 插槽实现，底部通过 footer 插槽实现完全自定样式</view>
		</template>
		<template v-slot:body>
			<view class="uni-list-box">
				<view class="uni-thumb"><image src="/static/logo.png" mode="aspectFill"></image></view>
				<view class="uni-content">
					<view class="uni-title-sub uni-ellipsis-2">这里是列表的副标题，最多可以显示两行，多余文字会隐藏并显示省略号</view>
					<view class="uni-note">Dcloud 128评论 21 赞</view>
				</view>
			</view>
		</template>
		<template v-slot:footer>
			<view class="uni-footer">
				<text class="uni-footer-text">评论</text>
				<text class="uni-footer-text">点赞</text>
				<text class="uni-footer-text">分享</text>
			</view>
		</template>
	</uni-list-item>
	<!-- 垂直排列，略缩图显示多图 -->
	<uni-list-item direction="column" title="" note="Dcloud 128评论 21 赞">
		<template v-slot:header>
			<view class="uni-title">垂直排列的多图列表，多图通过 body 插槽实现完全自定样式</view>
		</template>
		<template v-slot:body>
			<view class="content uni-media-box"><image v-for="img in 3" :key="img" class="uni-thumb" src="/static/logo.png" mode="aspectFill"></image></view>
		</template>
		<template v-slot:footer>
			<view class="uni-note">Dcloud 128评论 21 赞</view>
		</template>
	</uni-list-item>
	<!-- 水平排列，左图右文 -->
	<uni-list-item title="水平排列的左图右文列表，图片通过 header 插槽完全自定义" note="Dcloud 128评论 21 赞">
		<template v-slot:header>
			<view class="uni-thumb"><image src="/static/logo.png" mode="aspectFill"></image></view>
		</template>
	</uni-list-item>
	<!-- 水平排列，右图左文 -->
	<uni-list-item title="水平排列的右图左文列表，图片通过 footer 插槽完全自定义" note="Dcloud 128评论 21 赞">
		<template v-slot:footer>
			<view class="uni-thumb" style="margin: 0;"><image src="/static/logo.png" mode="aspectFill"></image></view>
		</template>
	</uni-list-item>
	<!-- 垂直排列，无略缩图，主标题+副标题显示 -->
	<uni-list-item direction="column">
		<template v-slot:header>
			<view class="uni-title">垂直排列的无图列表，现在主标题+副标题</view>
		</template>
		<template v-slot:body>
			<view class="uni-list-box">
				<view class="uni-content">
					<view class="uni-title-sub uni-ellipsis-2">这里是副标题 ，一般显示详情概览</view>
					<view class="uni-note">Dcloud 128评论 21 赞</view>
				</view>
			</view>
		</template>
		<template v-slot:footer>
			<view class="uni-footer">
				<text class="uni-footer-text">评论</text>
				<text class="uni-footer-text">点赞</text>
				<text class="uni-footer-text">分享</text>
			</view>
		</template>
	</uni-list-item>
</uni-list>

```

通过上面六种布局，我们实现了常见的新闻类列表的常见排版布局，但是我们并没有使用 mode 属性，而是直接展示了如何基于 `uni-list` 来实现这几种排版

其实在我们实际开发中往往会混合这些常见排版，这时候我们就需要一个更复杂的排版来将这些内容都融合到一起

### 复杂排版

这里的列表数据我们通过 [uni-clientDB](https://ext.dcloud.net.cn/plugin?id=2314) 获取并渲染

新闻列表的不同排版根据数据中获取到的  `mode` 属性来区分：

- mode = 1  垂直排列，略缩图显示大图
- mode = 2  垂直排列，图文混排
- mode = 3  垂直排列，略缩图显示多图
- mode = 4  水平排列，左图右文
- mode = 5  水平排列，右图左文
- mode = 6  垂直排列，无略缩图，主标题+副标题显示
	
```html

<uni-list>
	<uni-list-item v-for="item in lists" :key="item._id" :direction="direction(item.mode) ? 'column' : 'row'">
		<template v-slot:header>
			<view v-if="item.mode === 4" class="uni-thumb"><image :src="item.avatar" mode="aspectFill"></image></view>
			<view v-if="item.mode !== 4 && item.mode !== 5" class="uni-title">{{ item.title }}</view>
		</template>
		<template v-slot:body>
			<view class="content" :class="{ 'uni-content': item.mode === 1, 'uni-list-box': item.mode === 2, 'uni-media-box': item.mode === 3 }">
				<view v-if="item.mode === 1 || item.mode === 2" class="uni-thumb" :class="{ 'uni-content': item.mode === 1, ' list-picture': item.mode === 1 }">
					<image class="thumb-image" :src="item.avatar" mode="aspectFill"></image>
				</view>
				<image v-if="item.mode === 3" v-for="img in 3" :key="img" class="uni-thumb" :src="item.avatar" mode="aspectFill"></image>
				<view class="uni-content">
					<view v-if="item.mode !== 1 && item.mode !== 3" class="uni-title-sub uni-ellipsis-2">{{ item.excerpt }}</view>
					<view v-if="item.mode !== 3" class="uni-note">{{ item.user_name }} {{ item.last_modify_date }}</view>
				</view>
			</view>
		</template>
		<template v-slot:footer>
			<view v-if="item.mode === 2" class="uni-footer">
				<view>
					<uni-icons type="chat" size="14" color="#999"></uni-icons>
					<text class="uni-footer-text">评论</text>
				</view>
				<view>
					<uni-icons type="hand-thumbsup" size="14" color="#999"></uni-icons>
					<text class="uni-footer-text">点赞</text>
				</view>
				<view>
					<uni-icons type="redo" size="14" color="#999"></uni-icons>
					<text class="uni-footer-text">分享</text>
				</view>
			</view>
			<view v-if="item.mode === 3" slot="footer" class="uni-note">{{ item.user_name }} {{ item.last_modify_date }}</view>
			<view v-if="item.mode === 5" slot="footer" class="uni-thumb" style="margin: 0;"><image :src="item.avatar" mode="aspectFill"></image></view>
		</template>
	</uni-list-item>
</uni-list>

```

通过上面的排版布局，我们就可以通过 `mode` 属性方便的去展示不同的排版了，只需要在数据中给 `mode` 属性指定 `1-6` 不同的值。

### 怎么在已有项目中使用？

如果你的项目中使用了 `uniCloud` ，那么恭喜你可以直接复制代码到自己的项目中，无门槛使用（见文档最上方使用说明）

如果你的项目中没有使用 `uniCloud` ，也无需担心，只需要简单的更改即可使用

- 在后端接口中添加mode字段
- 或者请求数据后，给列表数据手动添加 mode 字段
- 数据结构不同的情况下，根据具体的字段更改替换模板中字段即可，如：item.title 代表了标题
	

## 样式覆盖

模板中通过 `common/uni-ui.scss` 定义了一些标题、图片等的基础样式

如果以上六种排版不能满足需求或者需要调整现有排版的样式，直接修改或覆盖对应样式即可。

## 其他模板样式

1. （当前模板）云端一体混合布局：[https://ext.dcloud.net.cn/plugin?id=2546](https://ext.dcloud.net.cn/plugin?id=2546)
2. 云端一体垂直布局，大图模式：[https://ext.dcloud.net.cn/plugin?id=2583](https://ext.dcloud.net.cn/plugin?id=2583)
3. 云端一体垂直布局，多行图文混排：[https://ext.dcloud.net.cn/plugin?id=2584](https://ext.dcloud.net.cn/plugin?id=2584)
4. 云端一体垂直布局，多图模式：[https://ext.dcloud.net.cn/plugin?id=2585](https://ext.dcloud.net.cn/plugin?id=2585)
5. 云端一体水平布局，左图右文：[https://ext.dcloud.net.cn/plugin?id=2586](https://ext.dcloud.net.cn/plugin?id=2586)
6. 云端一体水平布局，左文右图：[https://ext.dcloud.net.cn/plugin?id=2587](https://ext.dcloud.net.cn/plugin?id=2587)
7. 云端一体垂直布局，无图模式，主标题+副标题：[https://ext.dcloud.net.cn/plugin?id=2588](https://ext.dcloud.net.cn/plugin?id=2588)
