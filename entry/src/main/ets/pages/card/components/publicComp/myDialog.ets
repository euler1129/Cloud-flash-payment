@CustomDialog
export default struct myDialog {
  @Link title: string
  @Link content: string
  @Link cancelText: string
  @Link confirmText: string
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Row() {
        Text(this.title).height(40).fontSize(20).fontWeight(FontWeight.Bold)
      }
      Row() {
        Text(this.content)
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#666')
          .textAlign(TextAlign.Center)
          .margin({top: 10, bottom: 20})
      }.width('100%')
      Row() {
        Button(this.cancelText)
          .border({width: 1, color: '#da362f'})
          .backgroundColor('#fff')
          .fontColor('#da362f')
          .fontSize(14)
          .padding({left: 30, right: 30})
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
        Button(this.confirmText)
          .backgroundColor('#da362f')
          .fontColor('#fff')
          .fontSize(14)
          .padding({left: 30, right: 30})
          .onClick(() => {
            this.controller.close()
            this.confirm()
          })
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
    }.padding({left: 16, right: 16, top: 26, bottom: 26})
  }

}
