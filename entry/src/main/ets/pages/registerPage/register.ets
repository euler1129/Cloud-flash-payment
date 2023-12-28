import router from '@ohos.router'
import { myNotification } from './myNotification';

@Entry
@Component
struct register{
   onPageShow(){
     this.country=globalThis.country||"中国";
     this.tel=globalThis.tel||"+86";
  }

  @State country:string='';
  @State tel:string='';

  @State phone:string='';
  // @State phone:string='18701565455'; //测试 测试

  @State isEnabled:boolean=false;//手机号输入标识
  @State isChecked:boolean=false;//复选框标识
  @State isVisibility:boolean=false; //叉号，显隐标识


build(){
   Column(){
      //返回箭头
      Row(){
         Image($r('app.media.ic_back'))
            .width(30)
            .height(30)
            .margin({top:15})
            .onClick(()=>{
               AlertDialog.show({
                  message:"输入手机号即可轻松完成注册，\n您确定要返回吗？"
                 ,primaryButton:{
                     value:"返回"
                    ,fontColor:Color.Red
                    ,backgroundColor:Color.White
                    ,action: () => {
                        router.back();
                     }
                  }
                 ,secondaryButton:{
                     value:"继续注册"
                    ,fontColor:Color.White
                    ,backgroundColor:Color.Red
                    ,action:()=>{
                     }
                  }
               })

            })
      }.width('94%')
      .justifyContent(FlexAlign.Start)
     //文字，手机号注册
     Row(){
         Text("手机号注册")
            .fontWeight(FontWeight.Bold)
            .fontColor("#000")
            .fontSize(30)
            .width('100%')
            .textAlign(TextAlign.Start)
      }.width('94%')
       .margin({top:40})
       .justifyContent(FlexAlign.Start)
     //国家/地区选择
     Row(){
            Text("国家/地区").width('30%')
               .fontSize(18)
               .fontColor(Color.Gray)
           Row(){
             Text(`${this.country}`)
               .fontSize(18)
               .fontColor(Color.Black)
             Image($r('app.media.right_grey'))
               .width('30%')
               .height('30%')

              }.width('70%')
               .justifyContent(FlexAlign.SpaceAround)
               .onClick(()=>{
                 router.pushUrl({
                   url:'pages/registerPage/countrySelection'
                 }
                 ,router.RouterMode.Single
                 )
               })
       .justifyContent(FlexAlign.SpaceBetween)
      }.border({width:{bottom:"2px"},color:{bottom:Color.Grey} })
      .padding({bottom:"2"})
      .margin({top:80,left:10,right:20})
      .width('95%')
      .height('50')

     //手机区号，手机号输入
     Row(){
        Row(){
          Text(`${this.tel}`)
            .fontSize(18)
            .fontColor(Color.Gray)
        } .width('25%')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/registerPage/countrySelection'
            })
          })

       Row(){

         TextInput({ placeholder:"请输入手机号"
         ,text:(this.phone.length<8?
             this.phone.replace(/\D+/g, '').replace(/^(\d{3})/g, "$1 ").replace(/\s$/, '')
            :this.phone.replace(/\D+/g, '').replace(/^(\d{3})(\d{4})/g, "$1 $2 ").replace(/\s$/, '')
           )})
           .placeholderColor('#BAC2C3')
           .placeholderFont({ size:20,weight:FontWeight.Bold })
           .fontSize(20)
           .fontWeight(FontWeight.Bold)
           .type(InputType.PhoneNumber)//电话号码输入模式。支持输入数字、+ 、-、*、#，长度不限。
           .width('85%')
           .maxLength(13)
           .onChange((value:string)=>{
             if(value.replace(' ','')!=''){
               this.isEnabled=true;
               this.isVisibility=true;
               if(value.length<8)
               {
                 this.phone=value.replace(/\D+/g, '').replace(/^(\d{3})/g, "$1 ").replace(/\s$/, '')
               }else{
                 this.phone=value.replace(/\D+/g, '').replace(/^(\d{3})(\d{4})/g, "$1 $2 ").replace(/\s$/, '')
               }
             }else{
               this.isEnabled=false;
               this.isVisibility=false;
             }
           })

         Image($r("app.media.cancel"))
           .visibility(this.isVisibility?Visibility.Visible:Visibility.Hidden)
           .onClick(()=>{
                this.phone='';
           })
           .width('10%')
           .height('30%')
       } .width('75%')


      }.border({width:{bottom:"2px"},color:{bottom:Color.Grey} })
      .padding({bottom:"2"})
      .margin({top:20,left:10,bottom:20,right:20})
      .width('95%')
      .height('60')

     //用户协议
     Column(){
        Row(){
          Checkbox()
            .selectedColor(Color.Red)
            .onChange((value:boolean)=>{
               this.isChecked=value;
            })
          Text(' 我已阅读并同意').fontSize(16).fontColor(0x737373);
          Text('《隐私保护协议》').fontSize(16).fontSize(16).fontColor(this.isChecked?Color.Red:0x10396F).fontWeight(500);
          Text('及').fontSize(16).fontColor(0x737373).padding({ left: 20 });
        }
       Row(){
           Text('《联通统一认证服务条款》').fontSize(16).fontSize(16).fontColor(this.isChecked?Color.Red:0x10396F).padding({ left: 20 })
       }
     }.width('95%')
     .height('60')
     .alignItems(HorizontalAlign.Start)

     //注册按钮
     Row(){
          Button("注册")
            .type(ButtonType.Normal)
            .backgroundColor(Color.Red)
            .fontColor(Color.White)
            .fontSize(25)
            .stateEffect(false)
            .opacity(this.isEnabled&&this.isChecked?1:0.6)
            .enabled(this.isEnabled&&this.isChecked?true:false)
            .width('100%')
            .height('100%')
            .onClick(()=>{

              //console.log("phone="+this.phone);
              if(/^1[3456789]\d{9}$/.test(this.phone.replace(/(\D{1})/g, ''))){
                this.phone=this.phone.replace(/\s/g, '');
                globalThis.globalPhone=this.phone;

                router.pushUrl({
                  url:'pages/registerPage/verification',
                  params:{
                     phone1:this.phone
                  }
                }
                  ,router.RouterMode.Single
                )
                setTimeout(()=>{myNotification();},2000);
              }else {
                AlertDialog.show(
                  {
                    message: "手机号格式不正确，请重新输入。",
                    confirm:{
                      value: "确定",
                      fontColor:"#FFF",
                      backgroundColor:"red",
                      action: () => {
                        this.phone=this.phone.replace(/^(\d{3})(\d{4})/g, "$1 $2 ").replace(/\s$/, '');

                      }
                    }
                  }
                )

              }

            })
     }.margin({top:30})
     .width('95%')
     .height('60')

   }.width('100%')
   .height('100%')


}
}