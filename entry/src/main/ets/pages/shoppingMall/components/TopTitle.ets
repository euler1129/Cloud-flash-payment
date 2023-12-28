import router from '@ohos.router'
@Component
export default struct TopTitle{
  @Prop title:string
  build(){
    Stack({alignContent:Alignment.Center}){
      Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
        Image($r('app.media.detail_back_icon')).width(25).height(25).onClick(()=>{
          router.back()
        })
        Row(){
          Image($r('app.media.ic_rt_icon')).width(25).height(25)
          Divider().vertical(true).margin({left:10,right:10}).height(15)
          Image($r('app.media.ic_cancel')).width(25).height(25).onClick(()=>{
            router.pushUrl({url:'pages/Index'})
          })
        }.backgroundColor('#fff').height(35).padding({left:10,right:10}).borderRadius(25).alignItems(VerticalAlign.Center)
      }.width('100%')
      Text(this.title).fontSize(16).fontWeight(FontWeight.Bold)
    }.backgroundColor('#efefef').padding(10)
  }
}