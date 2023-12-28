
@Component
export default  struct Carousel{
  @State simgsrc:any[] = ['pages/home/image/the_hottest_list.png',
  'pages/home/image/preferential_price.png','pages/home/image/red_envelope.png'];


  @State sindex:number=1

  build(){
    Column(){
      Row(){
        Text('最热榜单').fontSize(16).fontWeight(FontWeight.Bold).fontColor('#141414')
        Text(this.sindex.toString()).margin({left:223})
        Text('/3').fontColor(Color.Gray)

      }
      Row() {
        if (this.simgsrc.length > 0) {
          Swiper() {
            ForEach(this.simgsrc, (item)=>{
              Column({space: 6}){
                Image(item).width('100%').height(369)
              }
              .width('100%')
              .padding({bottom: 12})
              .justifyContent(FlexAlign.Center)
              .backgroundColor('#f5f6f8')
              .borderRadius(10)
              .clip(true)
            })
          }
          .width('150%')
          .autoPlay(true)
          .indicator(false)
          .loop(true)
          .duration(1000)
          .displayCount(2)
          .itemSpace(10)
          .onChange((index:number)=>{
            this.sindex=index+1;
          })
        }
      }.width('100%').clip(true).margin({top:14})
    }.width('90%').alignItems(HorizontalAlign.Start)
    .padding({top:10,bottom:10,left:12})
    .margin({top:18})
    .backgroundColor('#FFFFFF')


  }
}