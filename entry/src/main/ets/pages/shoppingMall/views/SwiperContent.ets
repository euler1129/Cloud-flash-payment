interface swiperItem {
  name:string
  img:Resource
}

const swiperData1: Array<swiperItem> = [
  {
    name:'品牌手表',
    img:$r('app.media.shopping_swiper1')
  },
  {
    name:'爆款AJ',
    img:$r('app.media.shopping_swiper2')
  },
  {
    name:'神卷神价',
    img:$r('app.media.shopping_swiper3')
  },
  {
    name:'电子数码',
    img:$r('app.media.shopping_swiper4')
  },
  {
    name:'萌宠玩偶',
    img:$r('app.media.shopping_swiper5')
  }
]
const swiperData2: Array<swiperItem> = [
  {
    name:'户外用品',
    img:$r('app.media.shopping_swiper6')
  },
  {
    name:'品质家具',
    img:$r('app.media.shopping_swiper7')
  },
  {
    name:'收藏金属',
    img:$r('app.media.shopping_swiper9')
  },
  {
    name:'手机数码',
    img:$r('app.media.shopping_swiper8')
  },
  {
    name:'美妆个护',
    img:$r('app.media.shopping_swiper10')
  }
]

@Component
export default struct SwiperContent {
  private swiper:SwiperController = new SwiperController()


  build(){
    Swiper(this.swiper) {
      Row(){
        ForEach(swiperData1, (item: swiperItem,index) => {
          Column(){
            Image(item.img).width(65).height(65).borderRadius(index === 2?6:20)
            Text(item.name).fontSize(12).margin({top:8})
          }
        }, (item:swiperItem) => JSON.stringify(item))
      }.justifyContent(FlexAlign.SpaceAround).alignItems(VerticalAlign.Top)
      Row(){
        ForEach(swiperData2, (item: swiperItem,index) => {
          Column(){
            Image(item.img).width(65).height(65).borderRadius(index === 2?6:20)
            Text(item.name).fontSize(12).margin({top:8})
          }
        }, (item:swiperItem) => JSON.stringify(item))
      }.justifyContent(FlexAlign.SpaceAround).alignItems(VerticalAlign.Top)
    }
    .width('100%')
    .height(125)
    .padding({left:10,right:10,top:10})
    .autoPlay(false)
    .interval(3000)
    .indicator(true) // 是否启用导航小点
    .loop(false)
    .displayCount(1)
    .effectMode(EdgeEffect.None)
    .itemSpace(0) // 子组件间隔
    .indicatorStyle({
      color:'#ccc',
      selectedColor:'#000',
      bottom:0
    })
    .onChange((index: number) => {
      console.info(index.toString())
    })
  }
}