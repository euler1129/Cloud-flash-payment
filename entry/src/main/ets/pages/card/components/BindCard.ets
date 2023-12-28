import router from '@ohos.router'
import { bindCardDataType, bindCardDataType1, bindCardDataType2 } from '../common/utils/type'
import SubHead from './publicComp/SubHead'

@Component
export default struct BindCard {
  @Link bindCardData: bindCardDataType

  @State currentIndex: Number = 0
  @State bindCardList1: Array<bindCardDataType1> = this.bindCardData?.bindCardList1 || []
  @State bindCardList2: Array<bindCardDataType2> = this.bindCardData?.bindCardList2 || []

  build() {
    Column() {
      SubHead('绑卡有优惠', '优惠好礼等你拿')
      Row() {
        if (this.bindCardList1?.length > 0) {
            GridRow({
              columns: 2,
              gutter: { x: 10, y: 10 },
            }) {
                ForEach(this.bindCardList1, (item) => {
                  GridCol() {
                    Column() {
                      Row() {
                        Image(item.logo).width(20).margin({ right: 6 }).borderRadius(10)
                        Text(item.name).fontSize(12).fontColor('#999')
                      }.width('100%')

                      Row() {
                        Text() {
                          ForEach(item.desc.split(''), (str) => {
                            Span(str)
                              .fontSize(!!str.match(/\d/g) ? 22 : 12)
                              .fontWeight(!!str.match(/\d/g) && FontWeight.Bold)
                              .fontColor((str === '元' || !!str.match(/\d/g)) && '#ED171F')
                          }, str => str)
                        }.fontSize(12)

                        Text('绑卡>')
                          .fontSize(10)
                          .padding(4)
                          .backgroundColor('#fff')
                          .fontColor('#ED171F')
                          .borderRadius(8)
                      }
                      .width('100%')
                      .alignItems(VerticalAlign.Bottom)
                      .justifyContent(FlexAlign.SpaceBetween)
                    }
                    .width('100%')
                    .height(70)
                    .borderRadius(10)
                    .padding(10)
                    .linearGradient({
                      angle: 180,
                      colors: [['#fae0e6', 0.0], ['#fef7f7', 1.0]]
                    })
                    .justifyContent(FlexAlign.SpaceBetween)
                    .onClick(()=>{
                      const obj = {
                        name: item.name,
                        logo: item.logo,
                        explain: '绑卡有优惠-上部分'
                      }
                      router.pushUrl({url: 'pages/card/CardDetail', params: obj})
                    })
                  }
                 }, item => item.key)
            }.width("100%")
        }
      }.width('100%')
      Row() {
        if (this.bindCardList2?.length > 0) {
          GridRow({
            columns: 2,
            gutter: { x: 10, y: 10 },
          }) {
              ForEach(this.bindCardList2, (item) => {
                GridCol() {
                  Column({space: 6}) {
                    Image(item.img).width('70%')
                    Row() {
                      Image(item.logo).width(20).margin({ right: 6 }).borderRadius(10)
                      Text(item.title).fontSize(14).fontWeight(FontWeight.Bold)
                    }.width('100%')
                    Row() {
                      Text(item.desc).fontSize(12).fontColor('#999')
                    }
                    Row() {
                      Text('去绑卡')
                        .height(26)
                        .fontSize(12)
                        .fontColor('#fff')
                        .backgroundColor('#d73631')
                        .padding({left: 10, right: 10})
                        .borderRadius(13)
                    }
                  }
                    .width('100%')
                    .borderRadius(10)
                    .padding(10)
                    .linearGradient({
                      angle: 180,
                      colors: [['#fdefe4', 0.0], ['#fbe4d0', 1.0]]
                    })
                  .onClick(()=>{
                    const obj = {
                      name: item.title,
                      logo: item.img,
                      explain: '绑卡有优惠-下部分'
                    }
                    router.pushUrl({url: 'pages/card/CardDetail', params: obj})
                  })
                }
              }, item=>item.key)
          }.width("100%")
        }
      }.width('100%').margin({top: 10})
    }.width('100%')
  }
}