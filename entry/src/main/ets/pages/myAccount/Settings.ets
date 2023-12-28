/**
 * 我的账号-设置页面
 */

import router from '@ohos.router'
import { Header } from './components/Header'
import  { CustomDialog1 }  from './components/CustomDialog1'

@Entry
@Component
struct Settings {
  @State textValue: string = '666'//用于参数传递
  @State textIndex: string = '00'//用于参数传递，自定义弹窗下标
  //引入滑动组件
  scroller: Scroller = new Scroller()

  //引入弹窗组件
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog1({
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,//用于参数传递
      textIndex: $textIndex//用于参数传递
    }),
    cancel: this.existApp,
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })
  // 在自定义组件即将析构销毁时将dialogControlle删除和置空
  aboutToDisappear() {
    delete this.dialogController, // 删除dialogController
    this.dialogController = undefined // 将dialogController置空
  }
  onCancel() {
    console.info('Callback when the first button is clicked')
  }
  onAccept() {
    console.info('点击【确定】按钮，参数textValue:' + this.textValue + '，参数textIndex:' + this.textIndex)
    if (this.textIndex == '01') {
      console.info('textIndex为：01')
      router.pushUrl({ url: 'pages/login/LoginIndex' })
        .then(() => {
          console.info('Succeeded in jumping to the Settings page.')
        }).catch((err) => {
        console.error(`Failed to jump to the Settings page.Code is ${err.code}, message is ${err.message}`)
      })
    }
  }
  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
      Column() {
        //功能栏--引入自定义组件
      Header({headerName: '设置'})
        .backgroundColor($r('app.color.my_bg1'))
        .margin({bottom:10})

        //滚动区域
        Scroll(this.scroller) {
          Column() {
            Column() {
              Row() {
                Text('安全中心').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入安全中心？'
                  this.dialogController.open()
                }
              })
              Divider()
              Row() {
                Text('收藏中心').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入收藏中心？'
                  this.dialogController.open()
                }
              })
            }
            .width('100%')
            .height('20%')
            .backgroundColor(Color.White)
            .padding({ left: 15, right: 15 })
            .justifyContent(FlexAlign.SpaceEvenly)
            .margin({ bottom: 16 })

            Column() {
              Row() {
                Text('支付设置').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入支付设置？'
                  this.dialogController.open()
                }
              })
              Divider()
              Row() {
                Text('生物识别').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入生物识别？'
                  this.dialogController.open()
                }
              })
              Divider()
              Row() {
                Text('通用设置').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入通用设置？'
                  this.dialogController.open()
                }
              })
              Divider()
              Row() {
                Text('隐私设置').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入隐私设置？'
                  this.dialogController.open()
                }
              })
            }
            .width('100%')
            .height('40%')
            .backgroundColor(Color.White)
            .padding({ left: 15, right: 15 })
            .justifyContent(FlexAlign.SpaceEvenly)
            .margin({ bottom: 16 })

            Column() {
              Row() {
                Text('切换至关爱版').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否切换至关爱版？'
                  this.dialogController.open()
                }
              })
            }
            .width('100%')
            .height('10%')
            .backgroundColor(Color.White)
            .padding({ left: 15, right: 15 })
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 16 })

            Column() {
              Row() {
                Text('意见反馈').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入支付意见反馈？'
                  this.dialogController.open()
                }
              })
            }
            .width('100%')
            .height('10%')
            .backgroundColor(Color.White)
            .padding({ left: 15, right: 15 })
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 16 })

            Column() {
              Row() {
                Text('关于我们').fontSize(16).fontColor(Color.Black)
                Image($r('app.media.my_consumer_youjiantou')).width(25)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入关于我们？'
                  this.dialogController.open()
                }
              })
            }
            .width('100%')
            .height('10%')
            .backgroundColor(Color.White)
            .padding({ left: 15, right: 15 })
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 16 })

          }.width('100%').backgroundColor($r('app.color.my_bg1'))
        }
        .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
        .scrollBar(BarState.Off) // 滚动条不显示
        .edgeEffect(EdgeEffect.Fade)
        .onScroll((xOffset: number, yOffset: number) => {
          console.info(xOffset + ' ' + yOffset)
        })
        .onScrollEdge((side: Edge) => {
          console.info('To the edge')
        })
        .height('80%')

        //退出登录
        Row() {
          Button() {
            Text('退出登录')
              .fontSize(20)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(48)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor(Color.Red)
          .onClick(() => {
            if (this.dialogController != undefined) {
              this.textValue = '退出登录？'
              this.textIndex = '01'
              this.dialogController.open()
            }
          })
        }
        .width('100%')
        .height('14%')
        .backgroundColor(Color.White)
        .padding({ left: 16, right: 16 })
        .alignItems(VerticalAlign.Center)
        .margin({ bottom: 10 })
      }.width('100%').height('100%')
  }
}
