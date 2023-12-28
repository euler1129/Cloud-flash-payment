/**
 * 我的账号-个人中心-实名认证页面
 */

import { Header } from './components/Header'
import wantConstant from '@ohos.ability.wantConstant'
import common from '@ohos.app.ability.common'
import router from '@ohos.router'

@Entry
@Component
struct IndividualCenter {
  //通过router参数对象
  @State person: any = router.getParams()

  build() {
    Column() {
      //功能栏--引入自定义标题组件
      Header({ headerName: '实名认证' })
        .backgroundColor($r('app.color.my_bg1'))

      Row() {
        Row() {
          if (this.person) {
            Image(this.person.avatar).width(40).height(40).margin({right:8})
          }
          Column() {
            Row(){
              Text(this.person.name)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .margin({right:5})
              Text('已实名').fontSize(12).fontColor(Color.White)
                .border({width:0.8, color:Color.White})
                .borderRadius(2)
            }.margin({bottom:12})
            Text(this.person.idNumber + ' [身份证]')
              .fontSize(14)
              .fontColor(Color.White)
          }.alignItems(HorizontalAlign.Start)
        }.margin({bottom:20})
      }
      .width('90%')
      .height(130)
      .backgroundImage($r('app.media.my_shimingrenzheng'))
      .backgroundImageSize({ width: '100%', height: '100%' })
      .borderRadius(10)
      .padding({left:10})
      .margin({bottom:20})

      Row() {
        Text('个人信息').fontSize(16).fontColor(Color.Black)
        Blank()
        Text('去完善').fontSize(12).fontColor('#083879')
        Image($r('app.media.my_consumer_youjiantou')).width(25)
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      Row({space:5}){
        Text('完善身份信息，尊享更多服务').fontSize(12).fontColor('#676767')
        Text('了解更多').fontSize(12).fontColor('#083879')
      }.width('100%').height(50).padding({left:10})
      Row() {
        Text('证件照片').fontSize(16).fontColor(Color.Black)
        Blank()
        Text('去上传').fontSize(12).fontColor('#083879')
        Image($r('app.media.my_consumer_youjiantou')).width(25)
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      Row({space:5}){
        Text('上传证件照片，享受金融服务').fontSize(12).fontColor('#676767')
        Text('了解更多').fontSize(12).fontColor('#083879')
      }.width('100%').height(50).padding({left:10})
      Row() {
        Text('人像照片').fontSize(16).fontColor(Color.Black)
        Blank()
        Text('已验证').fontSize(12).fontColor('#676767')
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 30 })
      .justifyContent(FlexAlign.SpaceBetween)
      Row({space:5}){
        Text('验证人像照片，体验快捷刷脸...').fontSize(12).fontColor('#676767')
        // Text('了解更多').fontSize(12).fontColor('#083879')
      }.width('100%').height(50).padding({left:10})

      Row(){
        Text('常见问题').fontSize(14).fontColor('#083879')
      }.width('100%').layoutWeight(1)
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.Center)
      .padding({bottom:35})
    }.width('100%').height('100%')
    .backgroundColor($r('app.color.my_bg1'))
  }
}
