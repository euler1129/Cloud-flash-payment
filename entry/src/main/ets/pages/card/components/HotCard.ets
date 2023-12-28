
import router from '@ohos.router'
import { hotCardDataType } from '../common/utils/type'
import SubHead from './publicComp/SubHead'

@Component
export default struct HotCard {
  @Link hotCardData: Array<hotCardDataType>

  @State currentIndex: Number = 0
  @State hotCardList: Array<hotCardDataType> = this.hotCardData || []

  build() {
    Column() {
      SubHead('热门卡权益', '海量权益享不停')
      Scroll() {
        Row({space: 10}) {
          if (this.hotCardList.length > 0) {
            ForEach(this.hotCardList, (item) => {
              Column({ space: 6 }) {
                Image(item.img).width('100%').height(100)
                Text(item.title)
                  .fontWeight(FontWeight.Bold)
                  .height(30)
                  .width('100%')
                  .padding({ left: 6 })
                Row() {
                  Image(item.logo).width(20).margin({ right: 4 })
                  Text(item.desc)
                    .fontColor('#999')
                    .fontSize(12)
                }
                .width('100%')
                .padding({ left: 6 })
              }
              .width('44%')
              .padding({ bottom: 12 })
              .justifyContent(FlexAlign.Center)
              .backgroundColor('#f5f6f8')
              .borderRadius(10)
              .clip(true)
              .onClick(()=>{
                const obj = {
                  name: item.title,
                  logo: item.img,
                  explain: '热门卡权益-详情'
                }
                router.pushUrl({url: 'pages/card/CardDetail', params: obj})
              })
            }, item => item.key)
          }
        }
      }
      .scrollable(ScrollDirection.Horizontal)  // 滚动方向纵向
      .scrollBar(BarState.Off)  // 滚动条常驻显示
      .edgeEffect(EdgeEffect.None)

    }.width('100%')
  }
}