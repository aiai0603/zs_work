import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
   {
        path: '/car',
        meta: {
            title: '车型天地'
        },
        component: (resolve) => require(['./car.vue'], resolve)
    }, {
     path: '/index',
     meta: {
         title: '主页'
     },
     component: (resolve) => require(['./index.vue'], resolve)
    },{
		path: '*',
		meta: {
		    title: '主页'
		},
		component: (resolve) => require(['./index.vue'], resolve)
    },{
		path: '/server',
		meta: {
		    title: '售后服务'
		},
		component: (resolve) => require(['./server.vue'], resolve)
    },
    {
    path: '/brand',
    meta: {
        title: '品牌专区'
    },
    component: (resolve) => require(['./brand.vue'], resolve)
    },
    {
        path: '/car/:id',
        meta: {
            title: '车辆详情'
        },
        component: (resolve) => require(['./drive.vue'], resolve)
    }, {
        path: '/calculate',
        meta: {
            title: '金融计算机'
        },
        component: (resolve) => require(['./money.vue'], resolve)
    },

  ],
  watch: {
        '$route'(to, from) {
          this.$router.go(0);
        }
      },
})
