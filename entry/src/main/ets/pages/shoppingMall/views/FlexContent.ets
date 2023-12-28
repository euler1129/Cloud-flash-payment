import RecommendItem from '../components/RecommendItem'

interface imgItem{
  img:Resource
  title:string
  price:string
  oldPrice:string
  sold:string
}

@Component
export default struct FlexContent{
  scroller: Scroller = new Scroller()
  @Prop @Watch('onEdgeUpdate') isEdge:boolean
  timer:any = null
  @State aa:number = 0
  @State bb:number = 0

  onEdgeUpdate(propName: string){
    console.log('变成true了，该加载数据了')
    let ccc = [
      {
        img: $r('app.media.ic_goods'),
        title:"【到手21片】珀莱雅透亮莹润保湿面膜21片补水保湿玻尿酸面膜",
        price:'198',
        oldPrice:'289',
        sold:'3000'+this.arr1.length
      },
      {
        img: $r('app.media.ic_recommend1'),
        title:"珀莱雅红宝石面霜3.0双环肽抗皱紧致淡纹",
        price:'699',
        oldPrice:'899',
        sold:'30万'+this.arr1.length
      },
      {
        img: $r('app.media.ic_recommend3'),
        title:"【百亿补贴】YvesSaintLaurent/圣罗兰ysl小金条唇膏",
        price:'149',
        oldPrice:'189',
        sold:'5000'+this.arr1.length
      },
      {
        img: $r('app.media.ic_recommend4'),
        title:"台湾常春淡奶油1L 植物性鲜奶油打发奶盖家用烘焙蛋糕裱花专用",
        price:'69',
        oldPrice:'129',
        sold:'20万'+this.arr1.length
      },
      {
        img: $r('app.media.ic_recommend5'),
        title:"Hermes/爱马仕大地女持久留香72小时一轮伪体香香淡香氛百亿补贴正品",
        price:'709',
        oldPrice:'1089',
        sold:'40万'+this.arr1.length
      }
    ]

    let ddd = [
      {
        img: $r('app.media.ic_recommend6'),
        title:"Petrus柏翠复古咖啡机家用小型半自动意式萃取浓缩商用蒸汽打奶泡",
        price:'669',
        oldPrice:'989',
        sold:'800'+this.arr2.length
      },
      {
        img: $r('app.media.ic_recommend7'),
        title:"凯瑞kiri奶油奶酪200g小包装进口芝士块慕斯乳酪蛋糕烘焙材料家用",
        price:'280',
        oldPrice:'389',
        sold:'3000'+this.arr2.length
      },
      {
        img: $r('app.media.ic_recommend8'),
        title:"德国supkit气压式热水瓶家用按压式保温大容量热水壶暖瓶保温暖壶",
        price:'399',
        oldPrice:'499',
        sold:'5000'+this.arr2.length
      },
      {
        img: $r('app.media.ic_recommend9'),
        title:"天堂伞防晒防紫外线太阳伞轻小巧便携折叠晴雨两用伞女男士遮阳伞",
        price:'28',
        oldPrice:'68',
        sold:'9000'+this.arr2.length
      },
      {
        img: $r('app.media.ic_recommend10'),
        title:"【百亿补贴】海狸先生黄鱼酥即食香酥小黄花鱼零食即食鱼仔小鱼干",
        price:'39',
        oldPrice:'68',
        sold:'1万'+this.arr2.length
      }
    ]
    var this_ = this
    this.timer = setTimeout(function (){
      clearTimeout(this_.timer)
      for(let i=0;i<ccc.length;i++){
        this_.arr1.push(ccc[i])
      }
      for(let i=0;i<ddd.length;i++){
        this_.arr2.push(ddd[i])
      }
    },2000)
  }

  @State arr1:Array<imgItem> = [
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
      price:'69',
      oldPrice:'129',
      sold:'20万'
    },
    {
      img: $r('app.media.ic_recommend5'),
      title:"Hermes/爱马仕大地女持久留香72小时一轮伪体香香淡香氛百亿补贴正品",
      price:'709',
      oldPrice:'1089',
      sold:'40万'
    }
  ]
  @State arr2:Array<imgItem> = [
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
      price:'28',
      oldPrice:'68',
      sold:'9000'
    },
    {
      img: $r('app.media.ic_recommend10'),
      title:"【百亿补贴】海狸先生黄鱼酥即食香酥小黄花鱼零食即食鱼仔小鱼干",
      price:'39',
      oldPrice:'68',
      sold:'1万'
    }
  ]


  build(){

        //   Text(this.aa.toString()).fontSize(30).backgroundColor('#ba070b')
        //   Text(this.bb.toString()).fontSize(30).backgroundColor('blue')

        Column(){
          Flex({justifyContent:FlexAlign.SpaceBetween}){
            Column() {
              Image($r('app.media.ic_recommend')).width('100%').borderRadius(10).margin({bottom:10})
              ForEach(this.arr2, (item: imgItem) => {
                RecommendItem({ img: item.img, title: item.title, price: item.price, sold: item.sold, oldPrice: item.oldPrice }).margin({bottom:10})
              }, (item: imgItem) => JSON.stringify(item))
            }.width('48.5%')
            // .onAreaChange((oldValue: Area, newValue: Area) => {
            //   this.aa = parseInt(newValue.height.toString())
            // })
            Column() {
              ForEach(this.arr1, (item: imgItem) => {
                RecommendItem({ img: item.img, title: item.title, price: item.price, sold: item.sold, oldPrice: item.oldPrice }).margin({bottom:10})
              }, (item: imgItem) => JSON.stringify(item))
            }.width('48.5%')
            .justifyContent(FlexAlign.Start)
            // .onAreaChange((oldValue: Area, newValue: Area) => {
            //   this.aa = parseInt(newValue.height.toString())
            // }

          }.width('100%')
          Row(){
            LoadingProgress().color('#999').margin({right:10}).width(30).height(30)
            Text('玩命加载中。。。').fontColor('#999').fontSize(14)
          }.width('100%').margin({top:10}).justifyContent(FlexAlign.Center)
        }


    }
}