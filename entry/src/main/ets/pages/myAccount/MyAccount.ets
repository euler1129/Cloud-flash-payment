/**
 * 我的账号 页面
 */

import router from '@ohos.router'
import Person from './dataObject/Person'
import UserPreferenceModel from '../login/model/UserPreferenceModel'
import UserModel from '../login/viewmodel/UserModel'
import  { CustomDialog1 }  from './components/CustomDialog1'

@Entry
@Component
export struct MyAccount {

  //引入滑动组件
  scroller: Scroller = new Scroller()
  @State textValue: string = '666'//用于参数传递
  @State inputValue: string = 'click me' //用于参数未使用
  @State textIndex: string = '00'//用于参数传递，自定义弹窗下标
  //初始化一个用户对象
  @State person: Person = new Person(
    '何仕江', '18282048535', '03', '511321199801067978', $r('app.media.my_avatar'))

  //通过首选项获取用户手机号
  async aboutToAppear() {
    UserPreferenceModel.getUserModel().then((userModel: UserModel) => {
      if (userModel) {
        console.log('用户首选项数据为' + userModel)
        console.log('从用户首选项数据取出电话为',userModel.phoneNumber)
        this.person.setPhoneNumber(userModel.phoneNumber)
        console.log('更新后的person为:' + JSON.stringify(this.person))
      }else {
        console.log('用户首选项数据为空')
      }
    });
  }

  //引入弹窗组件
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog1({
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,//用于参数传递
      textIndex: $textIndex
    }),
    cancel: this.existApp,
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })
  // 在自定义组件即将析构销毁时将dialogControlle删除和置空
  aboutToDisappear() {
    delete this.dialogController, // 删除dialogController
    this.dialogController = undefined // 将dialogController置空
  }
  onCancel() {
    console.info('Callback when the first button is clicked')
  }
  onAccept() {
    console.info('Callback when the second button is clicked')
  }
  existApp() {
    console.info('Click the callback in the blank area')
  }

  //页面UI代码
  build() {
    Column() {
      //功能栏
      Row() {
        Row() {
          Image($r('app.media.my_consumer_protect')).width(20)
          Text('消费者权益保护中心').fontSize(12)
          Image($r('app.media.my_consumer_youjiantou')).width(20)
        }
        .borderRadius(20)
        .margin({ right: 50 })
        .backgroundColor(Color.White)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否打开消费者权益保护中心？'
            this.dialogController.open()
          }
        })

        Image($r('app.media.my_message')).width(25)
          .onClick(() => {
            if (this.dialogController != undefined) {
              this.textValue = '是否打开短信窗口？'
              this.dialogController.open()
            }
          })
        Image($r('app.media.my_kefu')).width(25)
          .onClick(() => {
            if (this.dialogController != undefined) {
              this.textValue = '是否打开客服窗口？'
              this.dialogController.open()
            }
          })
        Image($r('app.media.my_shezhi')).width(25)
          .onClick(() => {
            router.pushUrl({ url: 'pages/myAccount/Settings' })
              .then(() => {
                console.info('Succeeded in jumping to the Settings page.')
              }).catch((err) => {
              console.error(`Failed to jump to the Settings page.Code is ${err.code}, message is ${err.message}`)
            })
          })
      }
      .width('100%')
      .padding({ top: 25, bottom: 15, left: 15, right: 18 })
      .backgroundColor($r('app.color.my_bg1'))
      .justifyContent(FlexAlign.SpaceBetween)

      Scroll(this.scroller) {
        Column() {
          //财富背景
          Column() {
            //个人信息
            Row() {
              Image(this.person.avatar).width(40)
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/myAccount/IndividualCenter',
                    params: initPerson(this.person)
                  })
                })
              Column() {
                Row() {
                  Text(initPerson(this.person).phoneNumber).fontWeight(FontWeight.Bold)
                  Image($r('app.media.my_consumer_youjiantou')).width(20)
                }
                Text(initPerson(this.person).memberLevel)
                  .fontColor(Color.Black)
                  .fontSize(10)
                  .height(16)
                  .border({ width: 1, color: Color.Gray })
                  .padding({ left: 3, right: 3 })
                  .borderRadius(1)
                  .backgroundColor(Color.White)
              }.alignItems(HorizontalAlign.Start).margin({ left: 10 })
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/myAccount/IndividualCenter',
                  params : initPerson(this.person)
                })
              })
              Blank()
              Text('签到')
                .fontColor(Color.Red)
                .fontSize(12)
                .height(24)
                .border({ width: 1, color: Color.Red })
                .padding({ left: 10, right: 10 })
                .borderRadius(15)
                .backgroundColor(Color.White)
                .margin({ right: 15 })
                .onClick(() => {
                  if (this.dialogController != undefined) {
                    this.textValue = '是否进入签到页面？'
                    this.dialogController.open()
                  }
                })
            }.width('90%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ top: 20, bottom: 25 })

            //62VIP
            Row() {
              Column() {
                Row() {
                  Text('开通62VIP').fontColor("#825225").fontSize(18).margin({ right: 3 })
                  Image($r('app.media.my_hyyoujiantou')).width(18).margin({ bottom: 3 })
                }.margin({ bottom: 10 })

                Text('可享12大特权预计可省 ￥4618/年').fontColor("#825225").fontSize(13)
              }.alignItems(HorizontalAlign.Start).margin({ left: 15 })

              Row() {
                Text('会员中心').fontColor("#825225").fontSize(12)
                Image($r('app.media.my_hyyoujiantou')).width(16)
              }
              .width(80)
              .height(24)
              .padding({ left: 10, right: 10 })
              .borderRadius(15)
              .backgroundColor("#FEFFF9")
            }
            .width('90%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ top: 18, bottom: 15 })
            .padding({ right: 10 })
            .onClick(() => {
              router.pushUrl({ url: 'pages/myAccount/MemberCenter' })
                .then(() => {
                  console.info('Succeeded in jumping to the Settings page.')
                }).catch((err) => {
                console.error(`Failed to jump to the Settings page.Code is ${err.code}, message is ${err.message}`)
              })
            })
            //专享特权
            Row() {
              Row() {
                Button() {
                  Image($r('app.media.my_huiyuan')).width(15).height(18)
                }
                .type(ButtonType.Circle)
                .width(25)
                .height(25)
                .backgroundColor(Color.White)
                .margin({ right: 5 })

                Column() {
                  Text('专享特权').fontSize(15).fontColor("#815030")
                  Text('瑞幸咖啡').fontSize(10).fontColor("#815030")
                }.height('25%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.SpaceAround)
              }
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入专享特权？'
                  this.dialogController.open()
                }
              })

              Divider().vertical(true).height('22%')
              Row() {
                Button() {
                  Image($r('app.media.my_shoucang')).width(16).height(16)
                }
                .type(ButtonType.Circle)
                .width(25)
                .height(25)
                .backgroundColor(Color.White)
                .margin({ right: 5 })

                Column() {
                  Text('超值兑换').fontSize(15).fontColor("#815030")
                  Text('1元微信券').fontSize(10).fontColor("#815030")
                }.height('25%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.SpaceAround)
              }
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入超值兑换？'
                  this.dialogController.open()
                }
              })

              Divider().vertical(true).height('22%')
              Row() {
                Button() {
                  Image($r('app.media.my_youhuiquan')).width(20).height(20)
                }
                .type(ButtonType.Circle)
                .width(25)
                .height(25)
                .backgroundColor(Color.White)
                .margin({ right: 5 })

                Column() {
                  Text('月月领').fontSize(15).fontColor("#815030")
                  Text('6元回本券').fontSize(10).fontColor("#815030")
                }.height('25%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.SpaceAround)
              }
              .onClick(() => {
                if (this.dialogController != undefined) {
                  this.textValue = '是否进入月月领？'
                  this.dialogController.open()
                }
              })
            }.width('90%')
            .margin({ bottom: 20 })
            .padding({ right: 5, top: 20, bottom: 20 })
            .justifyContent(FlexAlign.SpaceAround)
          }
          .width('100%').height(250)
          .backgroundImage($r('app.media.my_caifubj2'))
          .backgroundImageSize({ width: '100%', height: '100%' })

          //积点待领取
          Row() {
            Text('有积点待领取')
              .fontColor(Color.Red)
              .fontSize(10)
              .height(20)
              .border({ width: 0.5, color: Color.Red })
              .padding({ left: 5, right: 5 })
              .borderRadius(10)
              .margin({ right: 12 })
          }.width('93%').justifyContent(FlexAlign.End)
          .onClick(() => {
            if (this.dialogController != undefined) {
              this.textValue = '是否进入积点领取页面？'
              this.dialogController.open()
            }
          })
          //优惠券+卡权益+红包+积点
          Row() {
            Column() {
              Text('2').fontColor(Color.Black).fontSize(15).fontWeight(FontWeight.Bold).margin({ bottom: 5 })
              Text('优惠券').fontSize(12).fontColor("#815030")
            }.onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否查看优惠券？'
                this.dialogController.open()
              }
            })

            Column() {
              Text('0').fontColor(Color.Black).fontSize(15).fontWeight(FontWeight.Bold).margin({ bottom: 5 })
              Text('卡权益').fontSize(12).fontColor("#815030")
            }.onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否查看卡权益？'
                this.dialogController.open()
              }
            })

            Column() {
              Text('0.99').fontColor(Color.Black).fontSize(15).fontWeight(FontWeight.Bold).margin({ bottom: 5 })
              Text('红包').fontSize(12).fontColor("#815030")
            }.onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否查看红包？'
                this.dialogController.open()
              }
            })

            Column() {
              Text('12').fontColor(Color.Black).fontSize(15).fontWeight(FontWeight.Bold).margin({ bottom: 5 })
              Text('积点').fontSize(12).fontColor("#815030")
            }.onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否查看积点？'
                this.dialogController.open()
              }
            })
          }.width('90%').justifyContent(FlexAlign.SpaceAround).margin({ bottom: 15 })
          //我的账单+银行卡+会员证件+收藏
          Column() {
            Row() {
              Image($r('app.media.my_zhangdan')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('我的账单').fontColor(Color.Black).fontSize(16)
              Blank()
              Text('最近一笔交易￥3615.90').fontColor("#815030").fontSize(12)
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入我的账单？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_yinhangka')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('我的银行卡').fontColor(Color.Black).fontSize(16)
              Blank()
              Text('金融卡 3张').fontColor("#815030").fontSize(12)
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入我的银行卡？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_huiyuan2')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('我的会员 证件').fontColor(Color.Black).fontSize(16)
              Blank()
              Text('暂未新增证件').fontColor("#815030").fontSize(12)
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入我的证件？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_shoucang2')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('我的收藏').fontColor(Color.Black).fontSize(16)
              Blank()
              Text('优惠券/商家/小程序').fontColor("#815030").fontSize(12)
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入我的收藏？'
                this.dialogController.open()
              }
            })
          }
          .width('90%')
          .height(220)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .justifyContent(FlexAlign.SpaceAround)
          .alignItems(HorizontalAlign.Start)
          .padding({ right: 10 })
          .margin({ bottom: 15 })
          //信用报告+积分中心+数字藏品
          Column() {
            Row() {
              Image($r('app.media.my_xinyongbaogao')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('信用报告').fontColor(Color.Black).fontSize(16)
              Blank()
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入信用报告？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_jifenzhongxin')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('积分中心').fontColor(Color.Black).fontSize(16)
              Blank()
              Text('积分查询/联盟通兑').fontColor("#815030").fontSize(12)
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入积分中心？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_shuzicangpin')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('数字藏品').fontColor(Color.Black).fontSize(16)
              Blank()
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入数字藏品？'
                this.dialogController.open()
              }
            })
          }
          .width('90%')
          .height(165)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .justifyContent(FlexAlign.SpaceAround)
          .alignItems(HorizontalAlign.Start)
          .padding({ right: 10 })
          .margin({ bottom: 15 })
          //我是商家+我是收银员+我是推广大使
          Column() {
            Row() {
              Image($r('app.media.my_xinyongbaogao')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('我是商家').fontColor(Color.Black).fontSize(16)
              Blank()
              Text('聚合支付/商家服务').fontColor("#815030").fontSize(12)
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入商家服务？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_jifenzhongxin')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('我是收银员').fontColor(Color.Black).fontSize(16)
              Blank()
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入收银员服务？'
                this.dialogController.open()
              }
            })

            Row() {
              Image($r('app.media.my_shuzicangpin')).width(25).height(25).margin({ left: 10, right: 5 })
              Text('数我是推广大使').fontColor(Color.Black).fontSize(16)
              Blank()
              Image($r('app.media.my_consumer_youjiantou')).width(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否进入推广大使？'
                this.dialogController.open()
              }
            })
          }
          .width('90%')
          .height(165)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .justifyContent(FlexAlign.SpaceAround)
          .alignItems(HorizontalAlign.Start)
          .padding({ right: 10 })
          .margin({ bottom: 25 })

          Column() {
            Row() {
              Image($r('app.media.my_kefu2')).width(25)
              Text('我的客服').fontColor(Color.Black).fontSize(15).margin({ left: 5 })
              Image($r('app.media.my_consumer_youjiantou')).width(25).height(25)
            }
            .width('36%')
            .height(30)
            .backgroundColor(Color.White)
            .borderRadius(15)
            .padding({ left: 10, right: 10 })
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 25 })
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.textValue = '是否打开我的客服？'
                this.dialogController.open()
              }
            })
          }.width('100%').height(120)

        }.width('100%').backgroundColor($r('app.color.my_bg1'))
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.Off) // 滚动条不显示
      .edgeEffect(EdgeEffect.Fade)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })

    }.width('100%').height('100%')
  }
}


function initPerson(person: Person) {
  return new Person(
    person.formatName(person.name),
    person.formatPhoneNumber(person.phoneNumber),
    person.getMemberLevel(person.memberLevel),
    person.formatIdNumber(person.idNumber),
    $r('app.media.my_avatar')
  );
}