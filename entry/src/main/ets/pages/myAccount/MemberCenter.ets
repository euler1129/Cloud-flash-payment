/**
 * 云闪付-我的-会员中心
 */

import { Header } from './components/Header'
import MemeberItemList1 from './components/MemeberItemList1'
import { CustomDialog1 } from './components/CustomDialog1'
import router from '@ohos.router'

@Entry
@Component
struct MemberCenter {
  //tab组件相关的状态变量
  @State fontColor: string = '#9C9C9C'
  @State selectedFontColor: string = '#20318B'
  @State currentIndex: number = 0

  //引入tab组件
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, icon1: Resource, icon2: Resource, name: string) {
    Column() {
      Image(this.currentIndex === index ? icon1: icon2)
        .width(20)
        .height(18)
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(15)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 3, bottom: 5 })
    }.width('100%').backgroundColor(Color.White).padding({ top: 8, bottom: 8 })
  }


  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          MemberCenterIndex1()
        }.tabBar(this.TabBuilder(0, $r('app.media.my_membercenter_shouye'), $r('app.media.my_membercenter_shouye2'),'首页'))
        TabContent() {
          Column() {
            MemberCenterIndex2()
          }.width('100%').height('100%').justifyContent(FlexAlign.Center)
        }.tabBar(this.TabBuilder(1, $r('app.media.my_membercenter_wode2'),$r('app.media.my_membercenter_wode'), '我的'))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('100%')
      .height('100%')
      .backgroundColor('#FFFFF5')
    }.width('100%')
  }
}

//自定义组件1
@Component
struct MemberCenterIndex1 {
  @State Number: String[] = ['0', '1', '2', '3', '4']

  //引入滑动组件
  scroller: Scroller = new Scroller()
  //引入轮播图组件
  private swiperController: SwiperController = new SwiperController()
  //引入tab组件
  private controller: TabsController = new TabsController()
  //tab组件相关的状态变量和构建函数
  @State fontColor: string = '#9C9C9C'
  @State selectedFontColor: string = '#20318B'
  @State currentIndex: number = 0

  @Builder TabBuilder(index: number, icon: Resource, name: string) {
    Column() {
      Image(icon)
        .width(24)
        .height(20)
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 3, bottom: 5 })
    }.width('100%').backgroundColor(Color.White).padding({ top: 8, bottom: 8 })
  }

  build() {
    Column() {
      //功能栏--引入自定义组件
      Header({ headerName: '会员中心' })
        .backgroundColor('#F6F2E6')

      //滚动区域
      Scroll(this.scroller) {
        Column() {
          Column() {
            Row() {
              Stack({ alignContent: Alignment.Bottom }) {
                Image($r('app.media.my_huiyuancenter_avatar')).width(60).height(60)
                Text('普通会员')
                  .width(60)
                  .height(20)
                  .fontSize(14)
                  .fontColor('#7D6A42')
                  .backgroundColor("#FEE8BF")
                  .borderRadius(10)
              }.margin({ right: 5 })

              Text('182 **** 8535').fontColor('#6B4A16').fontSize(20).fontWeight(FontWeight.Bold)
            }.width('90%')
            .margin({ top: 20, bottom: 10 })
            //活动返积点等
            Row() {
              Column() {
                Text('活动返积点').fontColor("#564334").fontSize(14).margin({ bottom: 5 })
                Text('积点兑好物>').fontSize(12).fontColor('#897969')
              }.alignItems(HorizontalAlign.Center)

              Column() {
                Text('信用报告').fontColor("#564334").fontSize(14).margin({ bottom: 5 })
                Text('免费查询>').fontSize(12).fontColor('#897969')
              }.alignItems(HorizontalAlign.Center)

              Column() {
                Text('还信用卡').fontColor("#564334").fontSize(14).margin({ bottom: 5 })
                Text('积免手续费>').fontSize(12).fontColor('#897969')
              }.alignItems(HorizontalAlign.Center)

              Column() {
                Text('更多特权').fontColor("#564334").fontSize(14).margin({ bottom: 5 })
                Text('点击查看>').fontSize(12).fontColor('#897969')
              }.alignItems(HorizontalAlign.Center)
            }
            .width('100%')
            .height(50)
            .justifyContent(FlexAlign.SpaceEvenly)
            .margin({ top: 18, bottom: 15 })
            .padding({ right: 10 })
            //318积点+赚积点+积点乐园
            Row() {
              Column() {
                Row() {
                  Text('3 1 8').fontSize(16).fontColor('#093CA4')
                    .fontWeight(FontWeight.Bold).margin({ right: 3 })
                  Text('积点').fontSize(15).fontColor("#815030")
                }.margin({ bottom: 3 })

                Text('使用记录').fontSize(12).fontColor("#897969")
              }.alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.SpaceAround)

              Divider().vertical(true).height('22%')
              Column() {
                Row() {
                  Image($r('app.media.my_huiyuancenter_yhq')).width(15).margin({ right: 3 })
                  Text('赚积点').fontSize(15).fontColor("#815030")
                }.margin({ bottom: 3 })

                Text('N倍积点攻略').fontSize(12).fontColor("#897969")
              }.alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.SpaceAround)

              Divider().vertical(true).height('22%')
              Column() {
                Row() {
                  Image($r('app.media.my_huiyuancenter_zs')).width(15).margin({ right: 3 })
                  Text('积点乐园').fontSize(15).fontColor("#815030")
                }.margin({ bottom: 3 })

                Text('小积点 大玩法').fontSize(12).fontColor("#897969")
              }.alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.SpaceAround)
            }.width('90%')
            .margin({ bottom: 20 })
            .padding({ right: 5, top: 20, bottom: 20 })
            .justifyContent(FlexAlign.SpaceAround)
          }
          .width('100%').height(242)
          .backgroundImage($r('app.media.my_huiyuancenterbg'))
          .backgroundImageSize({ width: '100%', height: '100%' })
          //轮播图区域
          Row() {
            Column() {
              Swiper(this.swiperController) {
                Column() {
                }
                .width('100%')
                .height('100%')
                .backgroundImage($r('app.media.my_huiyuanlb1'))
                .backgroundImageSize({ width: '100%', height: '100%' })
                .borderRadius(10)

                Column() {
                }
                .width('100%')
                .height('100%')
                .backgroundImage($r('app.media.my_huiyuanlb2'))
                .backgroundImageSize({ width: '100%', height: '100%' })
                .borderRadius(10)

                Column() {
                }
                .width('100%')
                .height('100%')
                .backgroundImage($r('app.media.my_huiyuanlb3'))
                .backgroundImageSize({ width: '100%', height: '100%' })
                .borderRadius(10)

                Column() {
                }
                .width('100%')
                .height('100%')
                .backgroundImage($r('app.media.my_huiyuanlb4'))
                .backgroundImageSize({ width: '100%', height: '100%' })
                .borderRadius(10)
              }.loop(true).autoPlay(true).interval(2000)
            }.width('44%').height(180)

            Column() {
              Row({ space: 5 }) {
                Image($r('app.media.my_huiyuan_62')).width(36)
                Column({ space: 2 }) {
                  Text('62省钱会员').fontSize(12)
                  Text('7大特权').fontSize(12)
                  Text('立即领取').fontColor(Color.Red).fontSize(12)
                }.alignItems(HorizontalAlign.Start)
              }.width('100%').backgroundColor('#FFF4F2')
              .borderRadius(10).padding(5)

              Row({ space: 5 }) {
                Image($r('app.media.my_huiyuan_taobao')).width(36)
                Column({ space: 2 }) {
                  Text('淘宝指定商户').fontSize(12)
                  Text('1元券').fontSize(12)
                  Text('299积点').fontColor(Color.Red).fontSize(12)
                }.alignItems(HorizontalAlign.Start)
              }.width('100%').backgroundColor('#FFF4F2')
              .borderRadius(10).padding(5)

              Row({ space: 5 }) {
                Image($r('app.media.my_huiyuan_gj')).width(36)
                Column({ space: 2 }) {
                  Text('1元公交地铁').fontSize(12)
                  Text('立减券').fontSize(12)
                  Text('299积点起').fontColor(Color.Red).fontSize(12)
                }.alignItems(HorizontalAlign.Start)
              }.width('100%').backgroundColor('#FFFBE8')
              .borderRadius(10).padding(5)
            }.width('44%').height(200).justifyContent(FlexAlign.SpaceEvenly)
          }
          .width('92%')
          .height(210)
          .borderRadius(10)
          .backgroundColor(Color.White)
          .justifyContent(FlexAlign.SpaceAround)
          //内部tab--简化版
          Text('会员商城').fontSize(25).fontWeight(FontWeight.Bold)
            .width('90%').margin({ top: 10, bottom: 10 })
          Column({ space: 5 }) {
            Row() {
              Select([
                { value: '默认排序' },
                { value: '积点从低到高' },
                { value: '积点从高到低' }
              ])
                .selected(0) //表示默认选中下拉菜单第一项
                .value('默认排序')
                .font({ size: 14, weight: 500 })
                .fontColor('#707175')
                .backgroundColor('#F3F4F8')
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 15, weight: 400 })
                .onSelect((index: number) => {
                  console.info('Select:' + index)
                })
              Select([
                { value: '全部积点' },
                { value: '1-100' },
                { value: '101-300' },
                { value: '301-5000' },
                { value: '5000及以上' }
              ])
                .selected(0) //表示默认选中下拉菜单第一项
                .value('全部积点')
                .font({ size: 14, weight: 500 })
                .fontColor('#707175')
                .backgroundColor('#F3F4F8')
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 15, weight: 400 })
                .onSelect((index: number) => {
                  console.info('Select:' + index)
                })
            }.width('92%')

            // List(){
            //   ForEach(this.Number, (day: string) => {
            //     ForEach(this.Number, (day: string) => {
            //      ListItem() {
            //         Text(day)
            //           .fontSize(16)
            //           .backgroundColor(0xF9CF93)
            //           .width('100%')
            //           .height(80)
            //           .textAlign(TextAlign.Center)
            //       }
            //     }, day => day)
            //   }, day => day)
            // }

            // Grid() {
            //   ForEach(this.Number, (day: string) => {
            //     ForEach(this.Number, (day: string) => {
            //       GridItem() {
            //         Text(day)
            //           .fontSize(16)
            //           .backgroundColor(0xF9CF93)
            //           .width('100%')
            //           .height(80)
            //           .textAlign(TextAlign.Center)
            //       }
            //     }, day => day)
            //   }, day => day)
            // }
            // .columnsTemplate('1fr 1fr')
            // .columnsGap(10)
            // .rowsGap(10)
            // .onScrollIndex((first: number) => {
            //   console.info(first.toString())
            // })
            // .width('90%')
            // .backgroundColor('#F3F4F8') //0xFAEEE0
            // .height(300)
            Column(){
              MemeberItemList1()
            }.width('100%')
          }.width('100%')
        }.width('100%').backgroundColor('#F3F4F8')
      }
      .width('100%')
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

//自定义组件2
@Component
struct MemberCenterIndex2 {
  @State textValue: string = '666'//用于参数传递
  @State textIndex: string = '00'//用于参数传递，自定义弹窗下标
  @State Number: String[] = ['0', '1', '2', '3', '4']

  //引入弹窗组件
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog1({
      cancel: this.onCancel,
      confirm: this.onAccept,
      textValue: $textValue,//用于参数传递
      textIndex: $textIndex//用于参数传递
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
    console.info('点击【确定】按钮，参数textValue:' + this.textValue + '，参数textIndex:' + this.textIndex)
    if (this.textIndex == '01') {
      console.info('textIndex为：01')
      router.pushUrl({ url: 'pages/login/LoginIndex' })
        .then(() => {
          console.info('Succeeded in jumping to the Settings page.')
        }).catch((err) => {
        console.error(`Failed to jump to the Settings page.Code is ${err.code}, message is ${err.message}`)
      })
    } else {
      console.info('textIndex不为：01')
    }
  }
  existApp() {
    console.info('Click the callback in the blank area')
  }

  //引入tab组件
  private controller: TabsController = new TabsController()
  //tab组件相关的状态变量和构建函数
  @State fontColor: string = '#9C9C9C'
  @State selectedFontColor: string = '#20318B'
  @State currentIndex: number = 0

  @Builder TabBuilder(index: number, icon: Resource, name: string) {
    Column() {
      Image(icon)
        .width(24)
        .height(20)
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 3, bottom: 5 })
    }.width('100%').backgroundColor(Color.White).padding({ top: 8, bottom: 8 })
  }

  build() {
    Column() {
      //功能栏--引入自定义组件
      Header({ headerName: '我的' })
        .backgroundColor('#F6F2E6')
      Row() {
        Stack({ alignContent: Alignment.Bottom }) {
          Image($r('app.media.my_huiyuancenter_avatar')).width(60).height(60)
          Text('普通会员')
            .width(60)
            .height(20)
            .fontSize(14)
            .fontColor('#7D6A42')
            .backgroundColor("#FEE8BF")
            .borderRadius(10)
        }.margin({ right: 5 })
        Text('182 **** 8535').fontColor('#6B4A16').fontSize(20).fontWeight(FontWeight.Bold)
      }.width('90%').height(80).padding({left:10})
      .backgroundColor('#F3E7D7')
      .borderRadius(10)
      .margin({ top: 15})

      Column() {
        Row() {
          Text('开通记录').fontSize(16).fontColor(Color.Black)
          Image($r('app.media.my_consumer_youjiantou')).width(25)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否进入开通记录？'
            this.dialogController.open()
          }
        })
        Divider()
        Row() {
          Text('我的订单').fontSize(16).fontColor(Color.Black)
          Blank()
          Text('积点兑换、VIP特权').fontSize(14).fontColor('#939393')
          Image($r('app.media.my_consumer_youjiantou')).width(25)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否进入我的订单？'
            this.dialogController.open()
          }
        })
        Divider()
        Row() {
          Text('积点规则').fontSize(16).fontColor(Color.Black)
          Image($r('app.media.my_consumer_youjiantou')).width(25)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否进入积点规则？'
            this.dialogController.open()
          }
        })
        Divider()
        Row() {
          Text('常见问题').fontSize(16).fontColor(Color.Black)
          Image($r('app.media.my_consumer_youjiantou')).width(25)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否进入常见问题？'
            this.dialogController.open()
          }
        })
        Divider()
        Row() {
          Text('会员服务协议').fontSize(16).fontColor(Color.Black)
          Image($r('app.media.my_consumer_youjiantou')).width(25)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否进入会员服务协议？'
            this.dialogController.open()
          }
        })
        Divider()
        Row() {
          Text('原会员入口').fontSize(16).fontColor(Color.Black)
          Image($r('app.media.my_consumer_youjiantou')).width(25)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.textValue = '是否进入原会员入口？'
            this.dialogController.open()
          }
        })
      }
      .width('90%')
      .height('50%')
      .backgroundColor(Color.White)
      .padding({ left: 15, right: 15 })
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 16 })

    }.width('100%').height('100%')
    .backgroundColor('#F3F4F8')
  }
}


