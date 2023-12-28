@CustomDialog
export  struct ShareDialog {
  @Link textValue: string
  @Link inputValue: string
  controller: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在最后
  cancel: () => void
  confirm: () => void

  @State fontC:string='black'

  build() {
    Column(){
      Row() {
        Text('X').margin({left:10})
          .onClick(()=>{
            this.controller.close()
          })
        Text('分享').margin({left:150}).fontWeight(400)
      }.width('100%').justifyContent(FlexAlign.Start)
      .padding(10)

      Row(){
          Column(){
            Image('pages/home/image/wechat.png').width(48)
              .onClick(()=>{
                this.fontC='red'
              })
            Text('微信').fontColor(this.fontC)
          }
        Column(){
          Image('pages/home/image/circle_of_friends.png').width(48).onClick(()=>{
            this.fontC='red'
          })
          Text('朋友圈').fontColor(this.fontC)
        }
        Column(){
          Image('pages/home/image/micro_blog.png').width(48).onClick(()=>{
            this.fontC='red'
          })
          Text('微博').fontColor(this.fontC)
        }
        Column(){
          Image('pages/home/image/text_message.png').width(48).onClick(()=>{
            this.fontC='red'
          })
          Text('短信').fontColor(this.fontC)
        }
      }.width('100%')
      .border({
        width: {  top: 0.8},
        color: { top: Color.Gray},
        style: {
          top: BorderStyle.Solid
        }
      }).justifyContent(FlexAlign.SpaceAround)
      Row(){
        Column(){
          Image('pages/home/image/qq_friends.png').width(48)
            .onClick(()=>{
              this.fontC='red'
            })
          Text('QQ好友').fontColor(this.fontC)
        }
        Column(){
          Image('pages/home/image/qq_space.png').width(48).onClick(()=>{
            this.fontC='red'
          })
          Text('QQ空间').fontColor(this.fontC)
        }
        Column(){
          Image('pages/home/image/copy_link.png').width(48).onClick(()=>{
            this.fontC='red'
          })
          Text('复制链接').fontColor(this.fontC)
        }
        Column(){

          Text('短信').fontColor(this.fontC)
        }.visibility(Visibility.Hidden)
      }.width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }.width('100%').backgroundColor(Color.White)
    .padding({bottom:20})
    .borderRadius({topLeft:10,topRight:10})

    // dialog默认的borderRadius为24vp，如果需要使用border属性，请和borderRadius属性一起使用。
  }
}