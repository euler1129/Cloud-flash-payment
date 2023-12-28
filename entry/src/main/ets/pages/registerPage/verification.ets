import router from '@ohos.router'
import { myNotification } from './myNotification';

let phone1=router.getParams()['phone1']; //获取手机号

@Entry
@Component
struct verification{


  @State globalRound: string = ''; //随机验证码
  @State code:string=''; //验证码

  @State time: number = 10;


  aboutToAppear() {
    setTimeout(() => {
      myNotification();
      this.globalRound = globalThis.globalRound
    }, 2000);
    this.load()
  }

  aboutToDisappear() {
    clearInterval(this.time)
  }

  load() {

    this.time = 10;

    let intervalID =setInterval(() => {
        this.time=this.time-1;
        if(this.time==0){
           clearInterval(intervalID);
        }
    }, 1000)


  }


  build(){
    Column(){
      //返回箭头
      Row() {
        Image($r('app.media.ic_back'))
          .width(30)
          .height(30)
          .margin({ right: 80 })
          .onClick(() => {

            AlertDialog.show({
             message:"短信可能有延迟，请再等一会"
            ,primaryButton:{
               value:"返回"
              ,fontColor:Color.Red
              ,backgroundColor:Color.White
              ,action: () => {
                  router.back();
                }
              }
            ,secondaryButton:{
                value:"再等一会"
              ,fontColor:Color.White
              ,backgroundColor:Color.Red
              ,action:()=>{
                }
              }
            })
          })
      }.width('94%')
      .justifyContent(FlexAlign.Start)
      .margin({top:15})
      //文字
      Row(){
        Text("我的验证码是")
          .fontWeight(FontWeight.Bold)
          .fontColor("#000")
          .fontSize(30)
          .width('100%')
          .textAlign(TextAlign.Start)
      }.width('94%')
      .margin({top:40})
      .justifyContent(FlexAlign.Start)
      //文字，重新发送
      Row(){
        Text(`短信验证码已发送至 ${phone1.slice(0,3)} **** ${phone1.slice(7)}`)
          .fontColor(Color.Grey)
          .fontSize(16);

        Button(this.time === 0 ? '重新发送' : this.time + 's')
          .fontSize(16)
          .fontColor(this.time === 0 ?Color.Red : Color.Black)
          .backgroundColor(Color.White)
          .borderColor(Color.White)
          .type(ButtonType.Normal)
          .enabled(this.time === 0 ?true:false)
            //.opacity(this.time ===0 ?1:0.6)
          .onClick(()=>{
            this.load()
            setTimeout(() => {//发送短信
              myNotification();
              this.globalRound = globalThis.globalRound;
            }, 2000);
          })
      }.width('94%')
      .margin({top:20})
      .justifyContent(FlexAlign.SpaceBetween)
      //验证码输入框
      Row(){
            TextInput(({ placeholder:"请输入验证码",text:this.code}))
              .maxLength(12)
              .type(InputType.Number)
              .placeholderFont({ size:30,weight:FontWeight.Bold })
              .fontSize(60)
              .backgroundColor(Color.White)
              .onChange((value:string)=>{
                this.code=value.replace(/\D+/g, '').replace(/(\d{1})/g, ' $1').replace(/\s$/, '')
              })


      }.width('94%')
      .height('100')
      .margin({top:50})
      .justifyContent(FlexAlign.SpaceBetween)
      //下一步
      Row(){
          Button("下一步")
            .type(ButtonType.Normal)
            .backgroundColor(Color.Red)
            .fontColor(Color.White)
            .fontSize(25)
            .stateEffect(false)
            .opacity(this.code!=''?1:0.6)
            .enabled(this.code!=''?true:false)
            .width('100%')
            .height('100%')
            .onClick(()=>{

              if(this.code.replace(/(\D{1})/g, '')==this.globalRound){
                  router.replaceUrl({
                    url:"pages/home/CloudTabContent"
                  })
              }else{
                AlertDialog.show(
                  {
                    message: "验证码错误，请重新输入。",
                    confirm:{
                      value: "确定",
                      fontColor:"#FFF",
                      backgroundColor:"red",
                      action: () => {
                      }
                    }
                  }
                )
              }

            })
      }.width('94%')
      .height('60')
      .margin({top:20})
    }.width('100%')
    .height('100%')
  }
}