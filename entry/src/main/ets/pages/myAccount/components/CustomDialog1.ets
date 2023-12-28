/**
 * 自定义弹窗组件
 */
@CustomDialog
export struct CustomDialog1 {
  @Link textValue: string
  @Link textIndex: string
  // @Link inputValue: string
  controller: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，
  // 以实现在CustomDialog中打开另一个或另一些CustomDialog，
  // 那么此处需要将指向自己的controller放在最后
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text(this.textValue).fontSize(16).margin({ top: 30, bottom: 20 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).width(110).backgroundColor(Color.White).fontColor(Color.Red)
          .border({width:1.2,color:Color.Red})
        Button('确定')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          }).width(110).backgroundColor(Color.Red).fontColor(Color.White)
      }.margin({ bottom: 30 })
    }
    // dialog默认的borderRadius为24vp，如果需要使用border属性，请和borderRadius属性一起使用。
  }
}