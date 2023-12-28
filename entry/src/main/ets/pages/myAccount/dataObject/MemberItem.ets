@Component
export default struct MemberItem{
  img:Resource
  @Prop title:string
  @Prop price:string
  @Prop sold:string
  build(){
    Column(){
      Image(this.img).width('100%').objectFit(ImageFit.Contain).objectRepeat(ImageRepeat.NoRepeat)
      Text(this.title).width('100%').padding(10).fontWeight(FontWeight.Bold).maxLines(2).textOverflow({overflow:TextOverflow.Ellipsis})
      Row(){
        Text(this.price).fontSize(20).fontColor('#202F57').fontWeight(FontWeight.Bold)
        Text('积点').fontSize(20).fontColor('#202F57').fontWeight(FontWeight.Bold)
      }.width('100%').padding({left:10}).justifyContent(FlexAlign.Start).alignItems(VerticalAlign.Bottom)
      Text('已兑换 '+this.sold + '+').fontSize(12).fontColor('#999').padding({top:10,left:10}).width('100%').textAlign(TextAlign.Start)
    }.backgroundColor('#fff').padding({bottom:10})
  }
}