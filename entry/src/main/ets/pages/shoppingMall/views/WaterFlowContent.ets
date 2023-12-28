import RecommendItem from '../components/RecommendItem'

interface imgItem{
  img:Resource
  title:string
  price:string
  oldPrice:string
  sold:string
}

const RecommendDataList:Array<imgItem> = [
  {
    img: $r('app.media.ic_goods'),
    title:"【到手21片】珀莱雅透亮莹润保湿面膜21片补水保湿玻尿酸面膜",
    price:'198',
    oldPrice:'289',
    sold:'3000'
  },
  {
    img: $r('app.media.ic_recommend1'),
    title:"珀莱雅红宝石面霜3.0双环肽抗皱紧致淡纹",
    price:'699',
    oldPrice:'899',
    sold:'30万'
  },
  {
    img: $r('app.media.ic_recommend2'),
    title:"海吉尔即食羊栖菜温州洞头特产东海长寿菜即食海藻丝海草凉菜榨菜",
    price:'299',
    oldPrice:'399',
    sold:'9000'
  },
  {
    img: $r('app.media.ic_recommend3'),
    title:"【百亿补贴】YvesSaintLaurent/圣罗兰ysl小金条唇膏",
    price:'149',
    oldPrice:'189',
    sold:'5000'
  },
  {
    img: $r('app.media.ic_recommend4'),
    title:"台湾常春淡奶油1L 植物性鲜奶油打发奶盖家用烘焙蛋糕裱花专用",
    price:'69.9',
    oldPrice:'129.9',
    sold:'20万'
  },
  {
    img: $r('app.media.ic_recommend5'),
    title:"Hermes/爱马仕大地女持久留香72小时一轮伪体香香淡香氛百亿补贴正品",
    price:'709',
    oldPrice:'1089',
    sold:'40万'
  },
  {
    img: $r('app.media.ic_recommend6'),
    title:"Petrus柏翠复古咖啡机家用小型半自动意式萃取浓缩商用蒸汽打奶泡",
    price:'669',
    oldPrice:'989',
    sold:'800'
  },
  {
    img: $r('app.media.ic_recommend7'),
    title:"凯瑞kiri奶油奶酪200g小包装进口芝士块慕斯乳酪蛋糕烘焙材料家用",
    price:'280',
    oldPrice:'389',
    sold:'3000'
  },
  {
    img: $r('app.media.ic_recommend8'),
    title:"德国supkit气压式热水瓶家用按压式保温大容量热水壶暖瓶保温暖壶",
    price:'399',
    oldPrice:'499',
    sold:'5000'
  },
  {
    img: $r('app.media.ic_recommend9'),
    title:"天堂伞防晒防紫外线太阳伞轻小巧便携折叠晴雨两用伞女男士遮阳伞",
    price:'38.9',
    oldPrice:'68.9',
    sold:'9000'
  },
  {
    img: $r('app.media.ic_recommend10'),
    title:"【百亿补贴】海狸先生黄鱼酥即食香酥小黄花鱼零食即食鱼仔小鱼干",
    price:'39.9',
    oldPrice:'68.9',
    sold:'1万'
  },
  {
    img: $r('app.media.ic_goods'),
    title:"【到手21片】珀莱雅透亮莹润保湿面膜21片补水保湿玻尿酸面膜",
    price:'198',
    oldPrice:'289',
    sold:'3000'
  },
  {
    img: $r('app.media.ic_recommend1'),
    title:"珀莱雅红宝石面霜3.0双环肽抗皱紧致淡纹",
    price:'699',
    oldPrice:'899',
    sold:'30万'
  },
  {
    img: $r('app.media.ic_recommend2'),
    title:"海吉尔即食羊栖菜温州洞头特产东海长寿菜即食海藻丝海草凉菜榨菜",
    price:'299',
    oldPrice:'399',
    sold:'9000'
  },
  {
    img: $r('app.media.ic_recommend3'),
    title:"【百亿补贴】YvesSaintLaurent/圣罗兰ysl小金条唇膏",
    price:'149',
    oldPrice:'189',
    sold:'5000'
  },
  {
    img: $r('app.media.ic_recommend4'),
    title:"台湾常春淡奶油1L 植物性鲜奶油打发奶盖家用烘焙蛋糕裱花专用",
    price:'69.9',
    oldPrice:'129.9',
    sold:'20万'
  },
  {
    img: $r('app.media.ic_recommend5'),
    title:"Hermes/爱马仕大地女持久留香72小时一轮伪体香香淡香氛百亿补贴正品",
    price:'709',
    oldPrice:'1089',
    sold:'40万'
  },
  {
    img: $r('app.media.ic_recommend6'),
    title:"Petrus柏翠复古咖啡机家用小型半自动意式萃取浓缩商用蒸汽打奶泡",
    price:'669',
    oldPrice:'989',
    sold:'800'
  },
  {
    img: $r('app.media.ic_recommend7'),
    title:"凯瑞kiri奶油奶酪200g小包装进口芝士块慕斯乳酪蛋糕烘焙材料家用",
    price:'280',
    oldPrice:'389',
    sold:'3000'
  },
  {
    img: $r('app.media.ic_recommend8'),
    title:"德国supkit气压式热水瓶家用按压式保温大容量热水壶暖瓶保温暖壶",
    price:'399',
    oldPrice:'499',
    sold:'5000'
  },
  {
    img: $r('app.media.ic_recommend9'),
    title:"天堂伞防晒防紫外线太阳伞轻小巧便携折叠晴雨两用伞女男士遮阳伞",
    price:'38.9',
    oldPrice:'68.9',
    sold:'9000'
  },
  {
    img: $r('app.media.ic_recommend10'),
    title:"【百亿补贴】海狸先生黄鱼酥即食香酥小黄花鱼零食即食鱼仔小鱼干",
    price:'39.9',
    oldPrice:'68.9',
    sold:'1万'
  }
]

@Component
export default struct WaterFlowContent{
  scroller: Scroller = new Scroller()
  @Builder itemFoot() {
    Column() {
      Text(`暂无更多数据`).width('100%').fontSize(14).fontColor('#999').margin(20)
    }
  }

  build(){
    Column(){
      WaterFlow({ footer: this.itemFoot.bind(this), scroller: this.scroller }) {
        FlowItem(){Image($r('app.media.ic_recommend')).borderRadius(10)}.height('250vp')
        ForEach(RecommendDataList,(item:imgItem)=>{
          FlowItem(){
            RecommendItem({img:item.img,title:item.title,price:item.price,sold:item.sold,oldPrice:item.oldPrice})
          }.width('100%').height('290vp')
        },(item:imgItem)=>JSON.stringify(item))
      }
      .columnsTemplate("1fr 1fr")
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .columnsGap(10) // 列间距
      .rowsGap(5) // 行间距
      .onReachStart(() => { // 瀑布流组件到达起始位置时触发。
        console.info("onReachStart")
      })
      .onReachEnd(() => { // 瀑布流组件到底末尾位置时触发。
        console.info("onReachEnd")
      })
      .backgroundColor('#f2f2f2')
      .width('100%')
      .height('100%')
      .layoutDirection(FlexDirection.Column)
    }
  }
}