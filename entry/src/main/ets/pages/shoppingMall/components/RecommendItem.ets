import router from '@ohos.router'
@Component
export default struct RecommendItem{
  img:Resource
  title:string
  price:string
  sold:string
  oldPrice:string
  build(){
    Column(){
      Image(this.img).width('100%').objectFit(ImageFit.Contain).objectRepeat(ImageRepeat.NoRepeat).borderRadius({topLeft:5,topRight:5})
      Text(this.title).width('100%').padding(10).fontWeight(FontWeight.Bold)
        .maxLines(2).textOverflow({overflow:TextOverflow.Ellipsis})
      Row(){
        Text('￥').fontSize(14).fontColor('#ba070b').fontWeight(FontWeight.Bold)
        Text(this.price).fontSize(18).fontColor('#ba070b').fontWeight(FontWeight.Bold)
      }.width('100%').padding({left:10}).justifyContent(FlexAlign.Start).alignItems(VerticalAlign.Bottom)
      Text('已售 '+this.sold + '+').fontSize(12).fontColor('#999').padding({top:10,left:10}).width('100%').textAlign(TextAlign.Start)
    }.backgroundColor('#fff').borderRadius(5).padding({bottom:10}).onClick(()=>{
      router.pushUrl({
        url:'pages/shoppingMall/detailsPage',
        params: {
          img: this.img,
          title: this.title,
          price: this.price,
          oldPrice:this.oldPrice,
          sold: this.sold
        }
      })
    })
  }
}