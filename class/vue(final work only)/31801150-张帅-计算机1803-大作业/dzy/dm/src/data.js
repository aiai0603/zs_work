export default{
          showcar:[{
            name:'新一代悦纳',
            big:require('./assets/yuena.jpg'),
            src1:require('./assets/d-1.jpg'),
            src2:require('./assets/d-2.jpg'),
            src3:require('./assets/d-3.jpg'),
            kun1:require('./assets/新一代悦纳-car.png'),
            path: [require('./assets/more-1.jpg'), require('./assets/more-2.jpg'), require('./assets/more-3.jpg'),require('./assets/more-4.jpg')
            ],
            sj:require('./assets/试驾.jpg'),
            wx1:require('./assets/mj-2.jpg'),
            wxword1:"价位入门级、环保很高级 新一代悦纳的这波反差厉害了",
            wxtitle1:"2020年伊始,突如其来的疫情,让举国上下投入到一场“没有硝烟的战争”中。有数据表明,78%的人类新发传染病与野生动物有关...",
            wx2:require('./assets/mj-1.jpg'),
            wxword2:"特殊时期，车内如何防疫？新一代悦纳已备好攻略",
            wxtitle2:" 席卷全国的疫情,让人们度过了一个不同寻常的春节。由于新型冠状病毒传播方式广泛,除了戴口罩勤洗手等..."
          },{
              name:'新领动',
              big:require('./assets/lingdong.jpg'),
              src1:require('./assets/ld-1.jpg'),
              src2:require('./assets/ld-2.jpg'),
              src3:require('./assets/ld-3.jpg'),
              kun1:require('./assets/ld.png'),
              path: [require('./assets/more-1.jpg'), require('./assets/more-2.jpg'), require('./assets/more-3.jpg'),require('./assets/more-4.jpg')
              ],
              sj:require('./assets/试驾.jpg'),
              wx1:require('./assets/ld-5.jpg'),
              wxword1:"或年内发布 北京现代全新领动谍照曝光",
              wxtitle1:"前，我们从相关渠道获取了一组北京现代全新领动(参数|询价)的国内谍照。新车为海外版第七代伊兰特的国产版本车型...",
              wx2:require('./assets/ld-6.jpg'),
              wxword2:"没996等于青春不完整？新领动说NO!",
              wxtitle2:" 相信每个职场中人对“996”都有着深刻的领悟:互联网公司程序猿敲代码要996、广告公关人做创意方案要996、公号狗…… "
          }

          ],
          news:[{
             title: "【教练我想学】北京现代×切尔西|足球课堂第一期",
             img: require('./assets/new-3.jpg'),
             pass: "去年11月，英超顶级俱乐部切尔西与传奇球星阿什利·科尔空降北京，现身北京现代青少年足球训练营，与187名青少年共度难忘周末。今年，切尔西与北京现代再度携手，为大家拍摄足球教学视频。今天为大家带来第一期：盘带训练。"
           }, {
             title: "【教练我想学】北京现代×切尔西|足球课堂第二期",
             img: require('./assets/new-2.jpg'),
             pass: "传球是一名球员在比赛场上使用最频繁的技术动作，在学习完上一期的盘带技术后，北京现代携切尔西的青训小妖比利·吉尔摩和青年队教练，为大家带来第二期训练内容，与大家一起进行传球的基本训练，帮助大家成为拥有手术刀般精准脚法的传球大师。"
           }, {
             title: "【教练我想学】北京现代×切尔西|足球课堂第三期",
             img: require('./assets/new-1.jpg'),
             pass: "在足球场上，进攻方经常会遇到需要背身拿球的情况，那么如何在防守球员面前完成华丽转身，并闪出传球和射门的空间。今天，北京现代邀请切尔西的青年队教练和女足球员贝斯·英格兰及罗曼娜·巴赫曼一起，为大家带来持球转身的训练内容。"
           }

         ],
         options: [{
               value: 'zj',
               label: '浙江省',
               children: [{
                 value: 'hz',
                 label: '杭州市',
                 children: [{
                   value: 'ht',
                   label: '浙江韩通汽车有限公司'
                 }, {
                   value: 'qt',
                   label: '浙江全通汽车有限公司'
                 }, {
                   value: 'jk',
                   label: '浙江金凯汽车有限公司'
                 }]
               }, {
                 value: 'jx',
                 label: '嘉兴市',
                 children: [{
                   value: 'ht',
                   label: '浙江浩通汽车有限公司'
                 }, {
                   value: 'xt',
                   label: '浙江兴田汽车有限公司'
                 }]
               }]
             }, {
               value: 'sh',
               label: '上海市',
               children: [{
                 value: 'basic',
                 label: '上海市',
                 children: [{
                   value: 'zc',
                   label: '上海中创汽车有限公司'
                 }, {
                   value: 'xf',
                   label: '上海现峰汽车有限公司'
                 }, {
                   value: 'lc',
                   label: '上海联诚汽车有限公司'
                 }]
               }],
             },
             {
               value: 'zs',
               label: '江苏省',
               children: [{
                 value: 'sz',
                 label: '苏州市',
                 children: [{
                   value: 'xt',
                   label: '江苏天驰兴泰汽车有限公司'
                 }, {
                   value: 'zw',
                   label: '江苏正旺汽车有限公司'
                 }, {
                   value: 'hx',
                   label: '江苏化现汽车有限公司'
                 }]
               }, {
                 value: 'nj',
                 label: '南京市',
                 children: [{
                   value: 'wb',
                   label: '江苏万邦汽车有限公司'
                 }, {
                   value: 'zh',
                   label: '江苏正和汽车有限公司'
                 }]

               }, {
                 value: 'hx',
                 label: '无锡市',
                 children: [{
                   value: 'df',
                   label: '江苏东方汽车有限公司'
                 }, {
                   value: 'hp',
                   label: '江苏海鹏汽车有限公司'
                 }]
               }]
             }
           ],
           carall: [
             [{
               name: '新一代悦纳',
               path: require('./assets/新一代悦纳.png'),
               src: require('./assets/新一代悦纳.jpg'),
               p: 72800,
               size:'4,405 * 1,720 * 1,455',
               power:'73.3 / 6,000',
               you:'最低5.0',
             }, {
               name: '新领动',
               path: require('./assets/新领动.png'),
               src: require('./assets/领动.jpg'),
               p: 109800,
               size:'4,610 * 1,800 * 1,450',
               power:'84.5 / 6,300',
               you:'最低5.5',
             }, {
               name: '菲斯塔',
               path: require('./assets/菲斯塔.png'),
               src: require('./assets/菲斯塔.jpg'),
               p: 119800,
               size:'4,660 * 1,790 * 1,425',
               power:'103 / 6,000',
               you:'最低5.2',
             }, {
               name: '逸行',
               path: require('./assets/逸行.png'),
               src: require('./assets/逸行.jpg'),
               p: 90900,
               size:'4,405* 1,750 * 1,470',
               power:'90.2 / 6,300',
               you:'最低5.1',
             }, {
               name: '全新瑞纳',
               path: require('./assets/全新瑞纳.png'),
               src:require('./assets/全新瑞纳.jpg'),
               p: 49900,
              size:'4,610 * 1,800 * 1,450',
              power:'84.5 / 6,300',
              you:'最低5.5',
             }, {
               name: '全新索纳塔',
               path: require('./assets/全新索纳塔.png'),
               src:require('./assets/全新索纳塔.jpg'),
               p: 169800,
               size:'4,405* 1,750 * 1,470',
               power:'90.2 / 6,300',
               you:'最低5.1',
             }, {
               name: '新名图',
               path: require('./assets/新名图.png'),
               src:require('./assets/新名图.jpg'),
               p: 149800,
              size:'4,405* 1,750 * 1,470',
              power:'90.2 / 6,300',
              you:'最低5.4',
             }, {
               name: '全新悦动',
               path: require('./assets/全新悦动.png'),
               src: require('./assets/全新悦动.jpg'),
               p: 84900,
              size:'4,405* 1,750 * 1,470',
              power:'101 / 12,300',
              you:'最低5.1',
             }, ],
             [{
               name: '第四代途胜',
               path: require('./assets/第四代途胜.png'),
               src: require('./assets/第四代途胜.jpg'),
               p: 149800,
               size:'4,545 * 1,850 * 1,670',
               power:'150 / 6,300',
               you:'最低6.7',
             }, {
               name: '新ix25',
               path: require('./assets/ix25.png'),
               src: require('./assets/ix25.jpg'),
               p: 109800,
               size:'4,300 * 1,790 * 1,620',
               power:'84.4 / 6,300',
               you:'最低6.4',
             }, {
               name: '昂希诺 钢铁侠版',
               path: require('./assets/昂希诺钢铁侠.png'),
               src: require('./assets/钢铁侠.jpg'),
               p: 149900,
               size:'4,195 * 1,800 * 1,575',
               power:'150 / 5,500',
               you:'最低6.5',
             }, {
               name: '第四代胜达',
               path: require('./assets/第四代胜达.png'),
               src: require('./assets/胜达.jpg'),
               p: 202800,
               size:'4,930 * 1,910 * 1,720',
               power:'150 / 14,000',
               you:'最低8.2',
             }, {
               name: 'ix35',
               path: require('./assets/ix35.png'),
               src: require('./assets/ix35.jpg'),
               p: 119900,
              size:'4,300 * 1,790 * 1,620',
              power:'84.4 / 6,300',
              you:'最低6.4',
             }, ],
             [{
               name: '菲斯塔 纯电动',
               path: require('./assets/pc.png'),
               src: require('./assets/菲斯塔纯电动.jpg'),
               p: 173800,
               size:'4,705 * 1,790 * 1,435',
               power:'135/14,000',
               you:'490',
             }, {
               name: '领动 插电混动',
               path: require('./assets/领动插电混动-pc.png'),
               src: require('./assets/领动插电混动.jpg'),
               p: 157800,
               size:'4,610 * 1,800 * 1,450',
               power:'77.2 / 5,700',
               you:'最低1.0',
             }, {
               name: '索纳塔 插电混动',
               path: require('./assets/索纳塔插电混动.png'),
               src: require('./assets/全新索纳塔插电混动.jpg'),
               p: 222800,
               size:'4,855 * 1,835 * 1,475',
               power:'115 / 6,000',
               you:'最低1.3',
             }],


           ],
           options2: [{
             id: 0,
             value: '选项1',
             label: '轿车',

             car: [{
               id: 0,
               value: '选项1',
               label: '新一代悦纳',
               src:require('./assets/yuena-big.png'),
               mode: [{
                   id: 0,
                   value: '选项1',
                   label: '1.4 TOP CTV 精英版',
                   sum: 96800,
                 }, {
                   id: 1,
                   value: '选项2',
                   label: '1.4 GS MT手动･青春版',
                   sum: 72800,
                 },
                 {
                   id: 2,
                   value: '选项3',
                   label: '1.4 GLS MT 手动･炫酷版',
                   sum: 77800,
                 }, {
                   id: 3,
                   value: '选项4',
                   label: '1.4 GLS CTV 炫酷版',
                   sum: 87800,
                 }
               ]
             }]
           }, {
             id: 1,
             value: '选项2',
             label: 'SUV',

             car: [{
               id: 0,
               value: '选项1',
               label: '新一代ix25',
                src:require('./assets/ix25-b.png'),
               mode: [{
                   id: 0,
                   value: '选项1',
                   label: '1.5L GS 6MT手动时尚型',
                    sum: 105800,
                 }, {
                   id: 1,
                   value: '选项2',
                   label: '1.5L GLS CVT智能型',
                   sum: 119800,
                 },
                 {
                   id: 2,
                   value: '选项3',
                   label: '1.5L DLX CVT尊贵型',
                   sum: 129800,
                 }, {
                   id: 3,
                   value: '选项4',
                   label: '1.5L TOP CVT旗舰型',
                   sum: 136800,
                 }
               ]
             }]
           }],

           carall1: [
             {
               name: '新一代悦纳',
               path: require('./assets/新一代悦纳.png'),
               src: require('./assets/新一代悦纳.jpg'),
               p: 72800,
               size:'4,405 * 1,720 * 1,455',
               power:'73.3 / 6,000',
               you:'最低5.0',
             }, {
               name: '新领动',
               path: require('./assets/新领动.png'),
               src: require('./assets/领动.jpg'),
               p: 109800,
               size:'4,610 * 1,800 * 1,450',
               power:'84.5 / 6,300',
               you:'最低5.5',
             }, {
               name: '菲斯塔',
               path: require('./assets/菲斯塔.png'),
               src: require('./assets/菲斯塔.jpg'),
               p: 119800,
               size:'4,660 * 1,790 * 1,425',
               power:'103 / 6,000',
               you:'最低5.2',
             }, {
               name: '逸行',
               path: require('./assets/逸行.png'),
               src: require('./assets/逸行.jpg'),
               p: 90900,
               size:'4,405* 1,750 * 1,470',
               power:'90.2 / 6,300',
               you:'最低5.1',
             }, {
               name: '全新瑞纳',
               path: require('./assets/全新瑞纳.png'),
               src:require('./assets/全新瑞纳.jpg'),
               p: 49900,
              size:'4,610 * 1,800 * 1,450',
              power:'84.5 / 6,300',
              you:'最低5.5',
             }, {
               name: '全新索纳塔',
               path: require('./assets/全新索纳塔.png'),
               src:require('./assets/全新索纳塔.jpg'),
               p: 169800,
               size:'4,405* 1,750 * 1,470',
               power:'90.2 / 6,300',
               you:'最低5.1',
             }, {
               name: '新名图',
               path: require('./assets/新名图.png'),
               src:require('./assets/新名图.jpg'),
               p: 149800,
              size:'4,405* 1,750 * 1,470',
              power:'90.2 / 6,300',
              you:'最低5.4',
             }, {
               name: '全新悦动',
               path: require('./assets/全新悦动.png'),
               src: require('./assets/全新悦动.jpg'),
               p: 84900,
              size:'4,405* 1,750 * 1,470',
              power:'101 / 12,300',
              you:'最低5.1',
             },
             {
               name: '第四代途胜',
               path: require('./assets/第四代途胜.png'),
               src: require('./assets/第四代途胜.jpg'),
               p: 149800,
               size:'4,545 * 1,850 * 1,670',
               power:'150 / 6,300',
               you:'最低6.7',
             }, {
               name: '新ix25',
               path: require('./assets/ix25.png'),
               src: require('./assets/ix25.jpg'),
               p: 109800,
               size:'4,300 * 1,790 * 1,620',
               power:'84.4 / 6,300',
               you:'最低6.4',
             }, {
               name: '昂希诺 钢铁侠版',
               path: require('./assets/昂希诺钢铁侠.png'),
               src: require('./assets/钢铁侠.jpg'),
               p: 149900,
               size:'4,195 * 1,800 * 1,575',
               power:'150 / 5,500',
               you:'最低6.5',
             }, {
               name: '第四代胜达',
               path: require('./assets/第四代胜达.png'),
               src: require('./assets/胜达.jpg'),
               p: 202800,
               size:'4,930 * 1,910 * 1,720',
               power:'150 / 14,000',
               you:'最低8.2',
             }, {
               name: 'ix35',
               path: require('./assets/ix35.png'),
               src: require('./assets/ix35.jpg'),
               p: 119900,
              size:'4,300 * 1,790 * 1,620',
              power:'84.4 / 6,300',
              you:'最低6.4',
             },
             {
               name: '菲斯塔 纯电动',
               path: require('./assets/pc.png'),
               src: require('./assets/菲斯塔纯电动.jpg'),
               p: 173800,
               size:'4,705 * 1,790 * 1,435',
               power:'135/14,000',
               you:'490',
             }, {
               name: '领动 插电混动',
               path: require('./assets/领动插电混动-pc.png'),
               src: require('./assets/领动插电混动.jpg'),
               p: 157800,
               size:'4,610 * 1,800 * 1,450',
               power:'77.2 / 5,700',
               you:'最低1.0',
             }, {
               name: '索纳塔 插电混动',
               path: require('./assets/索纳塔插电混动.png'),
               src: require('./assets/全新索纳塔插电混动.jpg'),
               p: 222800,
               size:'4,855 * 1,835 * 1,475',
               power:'115 / 6,000',
               you:'最低1.3',
             },


           ],


}
