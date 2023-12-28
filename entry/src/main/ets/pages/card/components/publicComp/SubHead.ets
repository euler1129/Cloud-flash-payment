// 模块的头部
@Builder export default function SubHead (name: string, desc: string, right?: string, callBack?:()=>void) {
  Row() {
    Row() {
      Text(name)
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
        .margin({right: 10})
      Text(`| ${desc}`).fontSize(10).fontColor('#999')
    }
    Row() {
      Text(`${right} `).fontSize(10)
      Image($r('app.media.fragmentation_ic_right')).width(5)
    }
      .height(40)
      .visibility(right ? Visibility.Visible : Visibility.Hidden)
      .onClick(()=>{
        callBack()
      })
  }
  .width('100%')
  .justifyContent(FlexAlign.SpaceBetween)
}