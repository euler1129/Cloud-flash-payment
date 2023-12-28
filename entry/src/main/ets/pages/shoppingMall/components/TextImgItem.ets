
@Component
export default struct TextImgItem{
  @Prop Title:string
  @Prop TitleColor:string
  @Prop bgColor:string
  @Prop SubTitle:string

  img:Resource
  img2:Resource
  @Prop price:string
  @Prop price2:string
  @Prop isShowMoneyIcon:boolean
  @Prop isShowMoneyIcon2:boolean
  @Prop isShowFq:boolean
  @Prop isShowFq2:boolean
  @Prop btmTitle:string
  @Prop btmTitle2:string

  // 图文内容
  @Builder TextImg(img,price,isShowMoneyIcon,isShowFq,btmTitle){
    Column(){
      Image(img).height(60)
      Row(){
        Text('￥').fontColor('#c04e4c').fontSize(10).visibility(isShowMoneyIcon?Visibility.Visible:Visibility.None)
        Text(price).fontSize(12).fontWeight(FontWeight.Bold).fontColor('#c04e4c')
        Text('x12期').fontSize(10).margin({left:2}).visibility(isShowFq?Visibility.Visible:Visibility.None)
      }.alignItems(VerticalAlign.Bottom).margin({top:6})
      Text(btmTitle).margin({top:5}).padding({left:6,right:6,top:2,bottom:2}).borderRadius(10).fontSize(10).fontColor(this.TitleColor).fontWeight(FontWeight.Bold).backgroundColor(this.bgColor)
    }.width('50%').alignItems(HorizontalAlign.Center)
  }

  build(){
    Column(){

      Row(){
        Row(){
          Text(this.Title).fontSize(17).fontColor(this.TitleColor).fontWeight(FontWeight.Bold)
          Text(this.SubTitle).fontSize(10).padding({top:2,bottom:2,left:4,right:4}).backgroundColor(this.TitleColor).fontColor('#fff').borderRadius({topLeft:10,topRight:10,bottomRight:10}).margin({left:5})
        }
        Row(){
          Text('更多').fontSize(12).fontColor('#999').margin({left:10})
          Image($r('app.media.func_right_small_arrow')).width(12)
        }
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)

      Row(){
        this.TextImg(this.img,this.price,this.isShowMoneyIcon,this.isShowFq,this.btmTitle)
        this.TextImg(this.img2,this.price2,this.isShowMoneyIcon2,this.isShowFq2,this.btmTitle2)
      }.width('100%').backgroundColor('#fff').borderRadius(5).margin({top:5}).padding({top:8,bottom:8})

    }.width('100%').padding(10).borderRadius(12).linearGradient({
      direction: GradientDirection.Bottom,
      colors: [[this.bgColor,0.5],['#fff',0.9]]
    })
  }
}