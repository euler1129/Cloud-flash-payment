/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 9:26
 */
import router from '@ohos.router';

interface ItemModel {
  imagePath: Resource;
  text: string;
  actionUrl?: string;
  //action: (actionUrl: string)=>void;
}

@Entry
//@Preview
@Component
export default struct LoginApproach {

  @State items: Array<ItemModel> =[
    {
      imagePath: $r("app.media.t1_face_id"),
      text: '面容ID登录',
      actionUrl: 'pages/login/SelectPictureOrFile_TakePhoto_TestPage'
    },
    {
      imagePath: $r("app.media.t1_wechat"),
      text: '微信登录',
      actionUrl: 'pages/Index'
    },
    {
      imagePath: $r("app.media.t1_apple_id"),
      text: 'Apple ID登录',
      actionUrl: 'pages/Index'
    },
    {
      imagePath: $r("app.media.t1_gesture"),
      text: '手势登录',
      actionUrl: 'pages/Index'
    }
  ];

  //@Link switchLoginApproach:boolean;

  @Builder
  buildItem(itemModel: ItemModel){
    Row(){
      Image(itemModel.imagePath).width(30).margin({right:5})
      Text(itemModel.text).fontSize(22).fontWeight(FontWeight.Bold)
    }.width('100%').margin(20).border({ width: { bottom: 1 }, color: Color.Gray }).justifyContent(FlexAlign.Center)
    .onClick(()=>{
      router.pushUrl({
        url: itemModel.actionUrl
      }, router.RouterMode.Single);
    })
  }

  build() {
    Column() {
      Row(){
        Image($r('app.media.t1_arrow_left'))
          .width(20)
          .onClick(() => {
            router.back({url: 'pages/login/LoginValidate'});
          })
        Text('选择其他登录方式')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.t1_close_login_approach'))
          .width(20)
          .onClick(()=>{
            router.back({url: 'pages/login/LoginValidate'});
          })
      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .margin({bottom: 30})

      ForEach(this.items, (item, index)=>{
        this.buildItem(item);
      }, (item, index)=>index.toString());
    }.padding(30)
  }

}