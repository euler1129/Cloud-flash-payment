
@Component
export  struct CardContent {
   build(){
     Row(){
       Column(){
         Column(){
           Row(){
             Text('专属推荐').fontColor('#141414')
               .fontSize(16).fontWeight(FontWeight.Bold)
             Column(){
               Image('pages/home/image/down_grey.png').width(15)
             }.alignItems(HorizontalAlign.End)

           }
           Image('pages/home/image/recommendation.png')
             //.width('40%').height(53)
             .margin({top:4})
         }.backgroundColor(Color.White).width('45%')
         .borderRadius(10).padding({top:10,bottom:10,left:10})
         .margin({left:20}).alignItems(HorizontalAlign.Start)
         Column(){
           Row(){
             Text('发现小程序').fontColor('#141414')
               .fontSize(16).fontWeight(FontWeight.Bold)
             Image('pages/home/image/down_grey.png').width(15).margin({left:30})
           }
           Image('pages/home/image/government_affairs.png')
             //.width('40%').height(53)
         }.backgroundColor(Color.White).width('45%').height(80)
         .alignItems(HorizontalAlign.Start)
         .margin({left:20,top:15}).borderRadius(10).padding({top:10,
           bottom:12,left:10})
       }

       Column(){
         Row(){
           Text('本地精彩').fontColor('#141414')
             .fontSize(16).fontWeight(FontWeight.Bold)
           Image('pages/home/image/down_grey.png').width(15).margin({left:35})
         }
         Column(){
           Image('pages/home/image/local_wondeful.png')
             .height(170)
             //.fitOriginalSize(true)
             //.width('40%').height(156)
         }
       }.backgroundColor(Color.White).width('45%')
       .borderRadius(10).padding({top:10,bottom:10})
       .margin({left:10})

     }.width('100%').margin({top:10})

   }
}

@Component
export struct ImageRelative{
   build(){
     Column(){
         Image('pages/home/image/coffee_milk_tea.png').width('90%')
           .margin({top:20})
       Column(){
          Text('今日必选').fontSize(16)
            .fontColor('#141414').fontWeight(FontWeight.Bold)
         Image('pages/home/image/choose_today.png').width('90%')
           .margin({top:15})
       }.backgroundColor('#FFFFFF')
       .alignItems(HorizontalAlign.Start)
       .borderRadius(10).width('90%')
       .margin({top:20})
       .padding({top:10,bottom:10,left:12})
     }.width('100%').backgroundColor('#F5F5F5')
   }
}