import router from '@ohos.router'
import { applyCardDataType } from '../common/utils/type'
import SubHead from './publicComp/SubHead'


@Component
export default struct ApplyCard {
  @Link applyCardData: Array<applyCardDataType>
  // 主题卡
  @Builder themeCard(title: string, fontColor:string, bgColorUp: string, bgColorDown: string) {
    Column() {
      Row() {
        Text(title)
          .fontColor(fontColor)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({right: 8})
        Text('>')
          .width(18)
          .height(18)
          .fontColor(fontColor)
          .backgroundColor('#fff')
          .borderRadius(9)
          .fontSize(12)
          .textAlign(TextAlign.Center)
      }
        .height(40)
    }
    .width('44%')
    .height(40)
    .margin({top: 20})
    .borderRadius(10)
    .linearGradient({
      angle: 180,
      colors: [[bgColorUp, 0.0], [bgColorDown, 1.0]]
    })
    .onClick(()=>{
      const obj = {
        name: title,
        logo: '',
        explain: '申请银行卡-底部选卡'
      }
      router.pushUrl({url: 'pages/card/CardDetail', params: obj})
    })
  }

  @State currentIndex: Number = 0

  build() {
    Column() {
      SubHead('申请银行卡', '汇集千余款银行卡', '更多', ()=>{
        console.log('跳转到更多')
            const obj = {
              name: '更多',
              logo: '',
              explain: '申请银行卡'
            }
            router.pushUrl({url: 'pages/card/CardDetail', params: obj})
      })
      Column() {
        if (this.applyCardData?.length >0) {
          Swiper() {
            ForEach(this.applyCardData, (item: applyCardDataType)=>{
              Column(){
                Image(item.img).width('100%')
                Text(item.title).fontWeight(FontWeight.Bold).height(30).fontSize(14)
                Text(item.desc).fontColor('#999').fontSize(9)
              }
              .width('80%')
              .justifyContent(FlexAlign.Center)
              .onClick(()=>{
                const obj = {
                  name: item.title,
                  logo: item.img,
                  explain: '申请银行卡-详情'
                }
                router.pushUrl({url: 'pages/card/CardDetail', params: obj})
              })
            }, item=>item.key)

          }
          .indicator(false)
          .loop(true)
          .displayCount(3)
          .itemSpace(10)
          .width('150%')
        }
      }.width('100%').clip(true)
      Row() {
        this.themeCard('云闪付主题卡','#d15d56','#fae0e6', '#fef7f7')
        this.themeCard('条件选卡','#d08359','#fef6de', '#fefaf1')
      }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
    }.width('100%')
  }
}