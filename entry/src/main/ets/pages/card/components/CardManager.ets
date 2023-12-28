
import ApplyCard from './ApplyCard'
import BindCard from './BindCard'
import HotCard from './HotCard'
import showCardArea from './ShowCardArea'
import {sendShowCardAreaData, sendCardImgList, sendBindCardInfo, sendHotCardList} from '../mockData'
import { applyCardDataType, showCardAreaDataType } from '../common/utils/type'
import router from '@ohos.router'

@Component
export default struct CardManager {
  @State centerAdvertisingFlag: boolean = true // 中间广告显示状态
  @State showCardAreaData: showCardAreaDataType = {} // 卡展示区 数据
  @State applyCardData: Array<applyCardDataType> = [] // 申请银行卡 数据
  @State bindCardData: any = {} // 绑卡有优惠 数据
  @State hotCardData: any = {} // 热门卡权益 数据
  @State loadingStatus: boolean = true // loading状态

  aboutToAppear() {
    // 模拟接口调用，获取数据
    setTimeout(()=>{
      this.showCardAreaData = sendShowCardAreaData
      this.applyCardData = sendCardImgList
      this.bindCardData = sendBindCardInfo
      this.hotCardData = sendHotCardList
      this.loadingStatus = false
    }, 500)
  }

  // 板块公共样式
  @Styles partCardStyle() {
    .borderRadius(10)
    .backgroundColor('#fff')
    .width('100%')
    .padding(10)
  }
  scroller: Scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Stack({ alignContent: Alignment.Top }) {
        // 顶部背景色块
        Row()
          .width('100%')
          .height(200)
          .backgroundImage($r('app.media.wealth_blue_bg'))
          .backgroundImageSize({width: '100%'})
        if (this.loadingStatus) {
          Column() {
            LoadingProgress().width('30%')
          }.width('100%').height('100%')
        } else {
          Column({space: 18}) {
            // 1、头部（广告、卡片展示区）
            if (Object.keys(this.showCardAreaData).length > 0) {
              Column() {
                // 1-1 头部广告
                if (this.showCardAreaData?.advertisingTop) {
                  Row() {
                    Text(this.showCardAreaData.advertisingTop)
                      .fontColor('#fff')
                      .fontSize(11)
                    Image($r('app.media.func_right_white_arrow')).width(30)
                  }
                  .justifyContent(FlexAlign.SpaceBetween)
                  .padding(10)
                  .width('94%')
                  .height(40)
                  .backgroundColor('#fb7710')
                  .borderRadius({ topLeft: 10, topRight: 10 })
                  .onClick(()=>{
                    const obj = {
                      name: '头部广告',
                      logo: '',
                      explain: '广告'
                    }
                    router.pushUrl({url: 'pages/card/CardDetail', params: obj})
                  })
                }
                // 1-2 卡片展示区
                showCardArea({showCardAreaData: $showCardAreaData})
              }.margin({top: 20})
            }
            // 中间广告
            if (this.showCardAreaData?.advertisingTop && this.centerAdvertisingFlag) {
              Row() {
                Text(this.showCardAreaData.advertisingCenter)
                  .fontSize(12)
                Image($r('app.media.close_small')).width(14).onClick(()=>{
                  this.centerAdvertisingFlag = false
                })
              }
              .partCardStyle()
              .height(40)
              .justifyContent(FlexAlign.SpaceBetween)
            }
            // 2、申请银行卡
            if (this.applyCardData?.length > 0) {
              Column() {
                ApplyCard({applyCardData: $applyCardData})
              }.partCardStyle()
            }
            // 3、绑卡有优惠
            if (Object.keys(this.bindCardData).length > 0) {
              Column() {
                BindCard({bindCardData: $bindCardData})
              }.partCardStyle()
            }
            // 4、热门卡权益
            if (this.hotCardData?.length > 0) {
              Column() {
                HotCard({hotCardData: $hotCardData})
              }.partCardStyle()
            }
            // 5. 底边提示语
            Column() {
              Row() {
                Text('——').fontColor('#999').fontSize(12)
                Text('已经到底啦').margin(16).fontColor('#999').fontSize(12)
                Text('——').fontColor('#999').fontSize(12)
              }
              Image($r('app.media.card_bottom')).width(40).margin({top: -14})
            }
          }
          .width('100%')
          .padding(16)
        }



      }.width('100%')
    }
    .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
    .scrollBar(BarState.Off)  // 滚动条常驻显示
    .edgeEffect(EdgeEffect.None)
  }
}