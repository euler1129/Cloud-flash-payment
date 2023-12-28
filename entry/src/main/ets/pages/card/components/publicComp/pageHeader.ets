
import router from '@ohos.router'
interface obj {
 title: string
 right?: string | Resource
 leftCallBack?: ()=>void
 rightCallBack?: ()=>void
}
// 页面的头部
@Builder export default function pageHeader (obj: obj) {
  Row() {
    Column() {
      Image($r('app.media.detail_back_icon')).width(26)
    }
      .width(60)
      .height(60)
      .justifyContent(FlexAlign.Center)
      .onClick(()=>{
          obj.leftCallBack ? obj.leftCallBack() : router.back()
      })
     Column() {
      Text(obj.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
     }.layoutWeight(1)
     Column() {
      Text(obj.right || '')
     }
      .width(60)
      .height(60)
      .justifyContent(FlexAlign.Center)
      .visibility(obj.right ? Visibility.Visible : Visibility.Hidden)

  }
  .width('100%')
  .height(60)
  // .border({width: {bottom: 1}})
  .justifyContent(FlexAlign.SpaceBetween)
}