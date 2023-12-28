import { CouPonTips } from './Tips'
import router from '@ohos.router'
class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Component
export default  struct ContentSwiper {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([1, 2])

  build() {

    Column() {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          ImageSwiper()
        }, item => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)

    }.width('100%')
  }
}

@Component
struct ImageSwiper{
  @State fontSize:number=10
  @State mwidth:number=30

  @State customPopup: boolean = false

   build(){
     Column(){
       Row(){
         Column(){
           Image('pages/home/image/ride_code.png').width(this.mwidth)
           Text('乘车码').fontSize(this.fontSize)
           Image('pages/home/image/cloud_flash_payment_mall.png').width(this.mwidth)
           Text('云闪付商城').fontSize(this.fontSize)
         }.onClick(()=>{
           router.pushUrl({
             url:'pages/shoppingMall/shoppingMall'
           })
         })
         Column(){
           Image('pages/home/image/magic_capital.png').width(this.mwidth)
           Text('U惠魔都').fontSize(this.fontSize)
           Image('pages/home/image/lucky.png').width(this.mwidth)
           Text('寻福之旅').fontSize(this.fontSize)
         }
         Column(){
           Image('pages/home/image/metro.png').width(this.mwidth)
            CouPonTips()
           Text('上海地铁').fontSize(this.fontSize)
           Image('pages/home/image/creadit_card_payment.png').width(this.mwidth)
           Text('信用卡还款').fontSize(this.fontSize)
         }
         Column(){
           Image('pages/home/image/very_happy.png').width(this.mwidth)
           Text('有礼乐开花').fontSize(this.fontSize)
           Image('pages/home/image/cellular_phone_replenishing.png').width(this.mwidth)
           Text('手机充值').fontSize(this.fontSize)
         }
         Column(){
           Image('pages/home/image/metro.png').width(this.mwidth)
           Text('借款').fontSize(this.fontSize)
           Image('pages/home/image/applying_credit_card.png').width(this.mwidth)
           Text('申请信用卡').fontSize(this.fontSize)
         }
       }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
       //.justifyContent(FlexAlign.SpaceAround)
       // Row(){
       //   Column(){
       //     Image('pages/home/image/cloud_flash_payment_mall.png').width(this.mwidth)
       //     Text('云闪付商城').fontSize(this.fontSize)
       //   }
       //   Column(){
       //     Image('pages/home/image/lucky.png').width(this.mwidth)
       //     Text('寻福之旅').fontSize(this.fontSize)
       //   }
       //   Column(){
       //     Image('pages/home/image/creadit_card_payment.png').width(this.mwidth)
       //     Text('信用卡还款').fontSize(this.fontSize)
       //   }
       //   Column(){
       //     Image('pages/home/image/cellular_phone_replenishing.png').width(this.mwidth)
       //     Text('手机充值').fontSize(this.fontSize)
       //   }
       //   Column(){
       //     Image('pages/home/image/applying_credit_card.png').width(this.mwidth)
       //     Text('申请信用卡').fontSize(this.fontSize)
       //   }
       // }.width('100%')
       //.justifyContent(FlexAlign.SpaceAround)
     }.width('100%').height(117).margin({top:15})


   }
}