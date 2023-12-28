import {ShareDialog} from './ShareDialog'
import router from '@ohos.router'
@Entry
//"pages/home/publish/CloudPublish"
@Component
struct CloudPublish {

  @State textValue: string = ''
  @State inputValue: string = 'click me'
  dialogController: CustomDialogController = new CustomDialogController({
    builder: ShareDialog({
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,
      inputValue: $inputValue
    }),
    cancel: this.existApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: 0 },
    gridCount: 8,
    customStyle: true
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = undefined // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Row() {
      Column() {
        Row() {
          Image('pages/home/image/less_than.png').width(20).margin({left:10})
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/home/CloudTabContent'
              })
            })
          Text('云闪付换新发布').margin({left:95})
          Image('pages/home/image/publish_tips.png').width(25).margin({left:150})
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.dialogController.open()
              }
            })
        }.justifyContent(FlexAlign.Start)
        .width('100%').height(50)
        Scroll() {
          Column() {
            Image('pages/home/image/publish_img0.png').width('100%')
            Image('pages/home/image/publish_img1.png').width('100%').margin({ top: -20 })
            Image('pages/home/image/publish_img2.png').width('100%')
          }
        }.scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
        .scrollBar(BarState.Off)  // 滚动条常驻显示
        .edgeEffect(EdgeEffect.None)
      }
      .width('100%')
    }
    .height('100%')
  }
}