/**
 * 我的账号-个人中心页面
 */

import { Header } from './components/Header'
import wantConstant from '@ohos.ability.wantConstant';
import common from '@ohos.app.ability.common';
import router from '@ohos.router';

@Entry
@Component
struct IndividualCenter {
  @State headImg: string = ''

  // 接收router传递的参数
  // 添加@State表示当前IndividualCenter组件被创建时就初始化
  @State person: any = router.getParams()

  build() {
    Column() {
      //功能栏--引入自定义标题组件
      Header({ headerName: '个人中心' })
        .backgroundColor(Color.White)

      Row() {
        Text('头像').fontSize(16).fontColor(Color.Black)
        Blank()
        if (this.person) {
          Row() {
            Image(this.headImg || this.person.avatar).width(40).height(40)
          }.width(30).height(30).borderRadius(50).clip(true)
          .justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)
          // Image(this.headImg || this.person.avatar).width(30).height(30).borderRadius(100)
        }
        Image($r('app.media.my_consumer_youjiantou')).width(25)
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })
      .margin({ bottom: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        // let want = {
        //   deviceId: '', //为空则默认调用本机应用
        //   action: wantConstant.Action.ACTION_IMAGE_CAPTURE,
        // }
        // let context = getContext(this) as common.UIAbilityContext
        // context.startAbility(want)
        this.takePhoto().then((res)=>{
          console.log('t头像', res)
          this.headImg = res
        })

      })

      Row() {
        Text('实名认证').fontSize(16).fontColor(Color.Black)
        Image($r('app.media.my_consumer_youjiantou')).width(25)
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })
      .margin({ bottom: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/myAccount/RealNameAuth',
          params: this.person
        })
      })

      Row() {
        //空白
      }.width('100%').height('100%').backgroundColor(Color.White)

    }.width('100%').height('100%')
    .backgroundColor($r('app.color.my_bg1'))
  }

  takePhoto() {
    let context = getContext() as common.UIAbilityContext
    let want = {
      'uri': '',
      'action': "ohos.want.action.imageCapture",
      'parameters': {},
    };
    return context.startAbilityForResult(want)
      .then((result) => {
        if (result.resultCode === 0 && result.want && result.want.uri ) {
          //拍照成功
          console.log('拍照成功', result.want.uri)
          return result.want.uri;
        }
      }).catch((error) => {
        return error;
      })
  }
}


