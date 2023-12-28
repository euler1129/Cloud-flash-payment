import router from '@ohos.router'
import FlexContent from './FlexContent'
import SwiperContent from './SwiperContent'
import TextImgItem from '../components/TextImgItem'
import WaterFlowContent from './WaterFlowContent'


@Component
export default struct HomeTabs{
  scroller: Scroller = new Scroller()
  @State isEdge:boolean = false
  // @State shopCarNumber:number = 0

  // @StorageLink('shopData') @Watch('watchShopData') shopData:any = {}

  // 监听传回来的值
  // watchShopData () {
  //   this.shopData = JSON.parse(AppStorage.Get<string>('shopData'))
  //   this.shopCarNumber = this.shopData.num
  // }

  // onPageShow(){
  //   if(AppStorage.Get<string>('shopData')){
  //     this.shopData = JSON.parse(AppStorage.Get<string>('shopData'))
  //     this.shopCarNumber = this.shopData.num
  //   }
  // }


  build(){
    Scroll(this.scroller){
      Column(){
        // search
        Row(){
          Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
            Search({ placeholder: '搜索好物' }).width('80%').height(35).placeholderFont({ size: 16 }).margin(0)

            // Badge({
            //   count: this.shopCarNumber,
            //   maxCount: 99,
            //   position: BadgePosition.RightTop,
            //   style: { color: 0xFFFFFF, fontSize: 12, badgeSize: 12, badgeColor: Color.Red }
            // }) {
              Image($r('app.media.shopping_car_icon')).width(25).height(25).margin({right:20})
                .onClick(()=>{
                  router.pushUrl({url:'pages/shoppingMall/shoppingCar'})
                })
            // }
          }.backgroundColor('#fff').width('100%').padding(10)
        }

        // swiper
        SwiperContent()

        // 专题1
        Flex({justifyContent:FlexAlign.Start,alignItems:ItemAlign.Start}){
          TextImgItem({Title:'大牌数码',TitleColor:'#e08354',SubTitle:'免息分期',bgColor:'#ffe9db',img:$r('app.media.ic_phone1'),img2:$r('app.media.ic_phone2'),price:'499.92',price2:'824.92',isShowMoneyIcon:true,isShowMoneyIcon2:true,isShowFq:true,isShowFq2:true,btmTitle:'Apple产品',btmTitle2:' 华为手机 '}).margin({right:5})
          TextImgItem({Title:'特惠充值',TitleColor:'#d95174',SubTitle:' 0.1元起 ',bgColor:'#fbdee4',img:$r('app.media.ic_phone3'),img2:$r('app.media.ic_phone4'),price:'3.5 起',price2:'6折起',isShowMoneyIcon:false,isShowMoneyIcon2:false,isShowFq:false,isShowFq2:false,btmTitle:'爱优腾芒VIP',btmTitle2:'茶饮代金卷'}).margin({left:5})
        }.width('100%').padding({left:10,right:10})

        // 专题2，
        Row(){
          Image($r('app.media.ic_zhuanti1')).width('48.5%')
          Image($r('app.media.ic_zhuanti2')).width('48.5%')
        }.width('100%').padding({left:10,right:10,top:10}).justifyContent(FlexAlign.SpaceBetween)

        // 瀑布流
        FlexContent({isEdge:this.isEdge}).margin(10)
      }


    }.backgroundColor('#efefef')
    .onScroll(()=>{
      this.isEdge = false
      console.log('滚动中')
    })
    .onScrollEdge((side: Edge) => {
      if(side === 2){
        console.info('滚到到了下边缘')
        this.isEdge = true
      }else if(side === 0){
        console.info('滚到到了上边缘')
      }

    })
  }
}