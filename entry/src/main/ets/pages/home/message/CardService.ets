

class CardParams{
  title1:string;
  title2:string;
  title3:string;
  title4:string;
  title5:string;
  title6:string;
  title7:string;
  img:any;

  constructor(title1: string, title2: string, title3: string, title4: string
              ,title5:string,title6:string, title7:string,img:any) {
    this.title1=title1
    this.title2=title2
    this.title3=title3
    this.title4=title4
    this.title5=title5
    this.title6=title6
    this.title7=title7
    this.img=img
  }
}

@Component
export struct CardService{

  @State customPopup: boolean = false
  @State customPopup2: boolean = false

  @State arr:Array<CardParams>=[];

  aboutToAppear(){
      let timeId=setTimeout(()=>{
        this.arr=[new CardParams('16:39','奖励提醒','奖励内容','备注',
          '立即领10元还款券','62VIP年卡开通福利','还款券','pages/home/image/.welfare.png'),
          new CardParams('周五 17:43','奖励提醒','奖励内容','备注',
            '叮~请查收专属福利','立减10元！在美团、淘宝、拼多多等商户使用云闪付' +
            '支付立享优惠，数量有限，先到先得>> （如已使用请忽略）','','')]
      },2000)
    if(this.arr.length>0){
      clearTimeout(timeId)
    }
  }

  // popup构造器定义弹框内容
  @Builder popupBuilder() {
    Column(){
      Row() {
        Text('退订').fontSize(10)
      }.width(90).height(50).padding(4).justifyContent(FlexAlign.Center)
      Row() {
        Text('删除').fontSize(10).fontColor('#D69291')
      }.width(90).height(50).padding(4).border({
        width: {  top: 0.5,bottom:0.5},
        color: { top: '#808080',bottom:Color.Gray},
        style: {
          top: BorderStyle.Solid,
          bottom:BorderStyle.Solid,
        }
      }).justifyContent(FlexAlign.Center)
      Row() {
        Text('投诉').fontSize(10)
      }.width(90).height(50).padding(4).border({
        width: {  top: 0.5},
        color: { top: Color.Black},
        style: {
          top: BorderStyle.Solid
        }
      }).justifyContent(FlexAlign.Center)
    }.width(102)

  }
  build(){
    Column(){
      if(this.arr.length>0){
        ForEach(this.arr,(item:CardParams,index:number)=>{
          Column(){
            Text(item.title1).fontSize(20).fontColor(Color.Gray)
          }.margin({bottom:10})
          Column(){
            Row(){
              Image('pages/home/image/discount_assistant.png').width(40)
              Text('优惠助手').fontColor('#8482B7').fontSize(25)
              Text('...').fontSize(30).margin({left:120})
              Button('u').onClick((evl) => {
                if(index===0){
                  this.customPopup = !this.customPopup
                }
                if (index===1){
                  this.customPopup2 = !this.customPopup2
                }
              }).bindPopup(index===0?this.customPopup:this.customPopup2, {
                builder: this.popupBuilder,
                placement: Placement.Bottom,
                popupColor: Color.White,
                enableArrow: true,
                showInSubWindow: false,
                onStateChange: (e) => {
                  if (!e.isVisible) {
                    this.customPopup = false
                  }
                }
              }).margin({left:-23}).opacity(0)
            }.width('90%')
            Row(){
              Text('奖励提醒').fontSize(30)
              //.margin({left:-100})
            }.border({
              width: {  top: 0.5},
              color: { top: '#808080'},
              style: {
                top: BorderStyle.Solid
              }
            }).width('90%')

            Row(){
              Column(){
                Text('奖励内容').fontSize(20).fontColor(Color.Gray)
                Text('备注').fontSize(20).fontColor(Color.Gray)
              }.alignItems(HorizontalAlign.Start)
              Column(){
                Text(item.title5).fontSize(20)
                Text(item.title6).fontSize(20)
                if(item.title7!=''){
                  Text(item.title7).fontSize(30)
                }
              }.margin({left:40}).alignItems(HorizontalAlign.Start).width('60%')
            }.width('90%')
            Row(){
              if(item.img!=''){
                Image('pages/home/image/welfare.png').width('100%')
              }
            }.width('90%')
            Row(){
              Text('查看详情').fontColor(Color.Gray).fontSize(20)
              Image('pages/home/image/more_than_grey.png').width(20)
                .margin({left:200})
            }.border({
              width: {  top: 0.5},
              color: { top: '#808080'},
              style: {
                top: BorderStyle.Solid
              }
            }).width('90%').margin({top:10}).padding({top:10,bottom:10})
          }.backgroundColor(Color.White).width('90%')
        })

      }else{
         LoadingProgress()
           .color(Color.Blue).width(200)
      }

    }.margin({top:18})

  }
}








