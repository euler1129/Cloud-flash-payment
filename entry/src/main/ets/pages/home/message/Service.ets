
import router from '@ohos.router'
import { CardService } from './CardService'
//,
//"pages/home/message/Service"
@Entry
@Component
 struct Service {

  build() {
    Column(){
      Row() {
        Image('pages/home/image/less_than.png').width(20).margin({left:10})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/home/CloudTabContent'
            })
          })
        Search({  placeholder: '搜索消息号' })
          .width('75%')
          .height(30)
          .backgroundColor(Color.White)
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 40, weight: 400 }).margin({left:10})
        Image('pages/home/image/customer_service.png').width(25).margin({left:10})
      }.justifyContent(FlexAlign.Start)
      .width('100%').height(50)
      TabContentService()
    }.backgroundColor('#F6F6F6')


  }
}

@Component
struct TabContentService {
  @State currentIndex: number = 0
  scroller: Scroller = new Scroller()
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number,titile: string) {
    Column() {
      Text(titile)
        .fontColor(this.currentIndex === index ? Color.Black : Color.Gray)
        .fontSize(20)
        .fontWeight(500)
      if(this.currentIndex === index){
        Image('pages/home/image/laugh.png')
          .width(40)
          .height(14)
          .margin({ top: -1 })
          .zIndex(-10)
      }


    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Scroll(this.scroller) {
            Column() {
              // LoadingProgress()
              //   .color(Color.Blue).width(30)
              CardService()

            }.width('100%')
            .height('110%')
          }
          .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
          .scrollBar(BarState.Off)  // 滚动条常驻显示
          .edgeEffect(EdgeEffect.None)
        }.tabBar(this.TabBuilder(0,'服务通知'))

        TabContent() {
          Column() {
            Text('支付消息')
          }.width('100%')
        }.tabBar(this.TabBuilder(1,'支付消息'))

        TabContent() {
          Column() {
            Text('精彩动态')
          }.width('100%')
        }.tabBar(this.TabBuilder(2,'精彩动态'))

      }
      .vertical(false)
      .barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .backgroundColor('#F6F6F6')
    }.width('100%')
  }
}