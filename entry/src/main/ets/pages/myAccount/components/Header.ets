/**
 * 自定义组件 Header
 */
import router from '@ohos.router'
@Component
export struct Header {
  headerName: string

  build() {
    Row() {
      Row() {
        Image($r("app.media.my_zuojiantou")).width(18)
          .onClick(() => {
            router.back()
          })
      }.width('5%')
      Row() {
        Text(this.headerName).fontColor(Color.Black).fontSize(20)
      }.width('95%').justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height(60)
    .padding({ top: 15, bottom: 10, left:10,right: 20 })

  }
}