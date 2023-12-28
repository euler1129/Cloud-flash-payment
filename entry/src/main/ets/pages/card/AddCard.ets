

const sendBankList1 = [
  {id: 1, key: "CCB", name: "建设银行", desc: '', logo: $r('app.media.icon_bank_1')},
  {id: 2, key: "ICBC", name: "工商银行", logo: $r('app.media.icon_bank_2')},
  {id: 3, key: "ABC", name: "农业银行", logo: $r('app.media.icon_bank_1')},
  {id: 4, key: "BOC", name: "中国银行", desc: '首绑信用卡限量得5元券', logo: $r('app.media.icon_bank_2')},
  {id: 5, key: "COMM", name: "交通银行", logo: $r('app.media.icon_bank_1')},
  {id: 7, key: "CMB", name: "招商银行", desc: '首绑银联卡最高得88元券', logo: $r('app.media.icon_bank_1')},

]
const sendBankList2 = [
  {id: 8, key: "CMBC", name: "民生银行", logo: $r('app.media.icon_bank_2')},
  {id: 9, key: "SPDB", name: "浦发银行", logo: $r('app.media.icon_bank_1')},
  {id: 10, key: "CITIC", name: "中信银行", logo: $r('app.media.icon_bank_1')},
  {id: 11, key: "CEB", name: "光大银行", logo: $r('app.media.icon_bank_2')},
  {id: 12, key: "HXBANK", name: "华夏银行", logo: $r('app.media.icon_bank_1')},
  {id: 13, key: "GDB", name: "广发银行", logo: $r('app.media.icon_bank_1')},
  {id: 14, key: "CIB", name: "兴业银行", desc: '首绑银联卡最高得88元券', logo: $r('app.media.icon_bank_2')},
  {id: 25, key: "BJBANK", name: "北京银行",desc: '首绑信用卡限量得5元券', logo: $r('app.media.icon_bank_1')},
  {id: 26, key: "SHBANK", name: "上海银行", logo: $r('app.media.icon_bank_1')},
]

interface bankInfo {
  logo: Resource,
  name: string
  key: string
  desc?: string
}

import router from '@ohos.router'
import { takePhoto } from './common/utils/methods'
import myDialog from './components/publicComp/myDialog'
import pageHeader from './components/publicComp/pageHeader'
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct AddCard {
  @State bankList: Array<bankInfo> = []
  @State checkMoreState: boolean = true // true 查看更多 false 查找更多银行
  @State inputVal: string = '' // 输入卡号的值

  @State DialogTitle: string = '是否返回？'
  @State DialogContent: string = '云闪付APP绑定银行卡可享跨行转账、信用卡还款0手续费'
  @State cancelText: string = '仍要返回'
  @State confirmText: string = '继续绑卡'

  // 返上一页前，二次确认 弹窗
  dialogController: CustomDialogController = new CustomDialogController({
    builder: myDialog({
      cancel: ()=>{
        console.log('仍要返回')
        router.back()
      },
      confirm: ()=>{
        console.log('继续绑卡')
      },
      title: $DialogTitle,
      content: $DialogContent,
      cancelText: $cancelText,
      confirmText: $confirmText
    }),
    cancel: ()=>{
      console.log('点击浮层')
    },
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })

  scroller: Scroller = new Scroller()

  aboutToAppear() {

    setTimeout(()=>{
      this.bankList = sendBankList1
    }, 200)
  }

  onBackPress() {
    this.dialogController.open()
    return true
  }

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = undefined // 将dialogController置空
  }


  build() {
      Column() {
        pageHeader({ title: '添加银行卡', leftCallBack: () => this.dialogController.open() })
        Scroll(this.scroller) {
         Column() {
           Row() {
             Column({ space: 6 }) {
               Row() {
                 Text('免输卡号，一键绑卡').fontSize(14).fontWeight(FontWeight.Bold)
               }

               Row() {
                 Text('已和以下522家银行合作，可快速绑定银行卡').fontSize(10).fontColor('#999')
               }
             }
             .layoutWeight(1)
             .alignItems(HorizontalAlign.Start)

             Column() {
               Row() {
                 Text('全部支持银行').fontColor('#113c87').fontSize(14).margin({ right: 6 })
                 Image($r('app.media.arrow_right_blue')).width(16)
               }
             }
           }.width('100%').padding(16)
           // 银行列表
           List() {
             ForEach(this.bankList, (item: bankInfo) =>{
               ListItem() {
                 Row() {
                   Image(item.logo).width(20).margin({right: 12})
                   Text(item.name).fontColor('#333')
                   Blank()
                   Text(item.desc).fontSize(14).margin({right: 8}).fontColor(Color.Red)
                   Image($r('app.media.fragmentation_ic_right')).width(8)
                 }
                 .width('100%')
                 .padding({top: 14, bottom: 14})
                 .border({width: {bottom: 1}, color: '#eee'})
                 .onClick(()=>{
                   const obj = {
                     name: item.name,
                     logo: item.logo,
                     explain: '银行卡-详情'
                   }
                   router.pushUrl({url: 'pages/card/CardDetail', params: obj})
                 })
               }
             }, item=>item.key)
           }.margin({left: 16, right: 16}).border({width: {top: 1}, color: '#eee'})

           Row() {
             Text(this.checkMoreState ? '查看更多' : '查找更多银行').fontColor('#666').fontSize(12).margin({right: 10})
             Image(this.checkMoreState ? $r('app.media.arrow_down_grey') : $r('app.media.fragmentation_ic_right')).width(this.checkMoreState ? 12 : 8)
           }
           .height(40)
           .onClick(()=>{
             if (this.checkMoreState) {
               this.checkMoreState = false
               this.bankList = this.bankList.concat(...sendBankList2)
             } else {
               console.log('跳转到-查找更多银行页面')
             }
           })



           // 输入卡号部分
           Column() {
             Stack({alignContent: Alignment.Top}) {
               Row().width('70%').height('50%').border({width:{bottom: 1}, color: '#ccc'})
               Text('或选择')
                 .fontSize(12)
                 .fontColor('#666')
                 .height('100%')
                 .backgroundColor('#fff')
                 .padding({left: 10, right: 10})
             }
             .width('100%')
             .height(40)

             Row() {
               Text('输入卡号绑卡').fontSize(14).fontWeight(FontWeight.Bold).margin({right: 10})
               Text('支持近2000家银行').fontSize(10).fontColor('#999')
             }.width('100%').height(40)
             Row() {
               TextInput({placeholder: '点击输入本人的银行卡号', text:this.inputVal})
                 .placeholderColor('#999')
                 .backgroundColor(Color.Transparent)
                 .layoutWeight(1)
                 .borderRadius(0)
                 .type(InputType.Number)
                 .maxLength(23)
                 .onChange((val: string)=> this.dealCardNumber(val))

                 if (this.inputVal) {
                   // 清空输入框
                   Column() {
                    Image($r('app.media.clear_btn')).width(30)
                   }
                    .padding({left: 6, right: 6})
                    .onClick(()=>this.inputVal = '')
                 } else {
                   // 调用拍照
                   Column() {
                     Image($r('app.media.card_take_photo')).width(30)
                     Text('拍照添卡').fontSize(12).fontColor('#999')
                   }
                    .padding({left: 6, right: 6})
                    .onClick(()=>{
                      takePhoto().then((res: string)=>{
                        this.inputVal = res
                      })
                    })
                 }
             }.width('100%').height(60).border({width: 1, color: '#999'})
             Row() {
               Text('请添加您本人的银行卡，享受更便携的银联服务').fontSize(12).fontColor('#999')
             }.width('100%').height(40)

             Button('下一步')
               .width('100%')
               .backgroundColor('#da362f')
               .opacity(this.inputVal.length >= 16 ? 1 : 0.4)
               .type(ButtonType.Normal)
               .borderRadius(4)
               .onClick(() => {
                  if (this.inputVal.length >= 16) {
                    promptAction.showToast({
                      message: '添加成功',
                      duration: 2000,
                      bottom: 400
                    })
                    setTimeout(()=>{
                      AppStorage.SetOrCreate('saveCardNum', this.inputVal.replace(/\s/g, ''))
                      router.back()
                    }, 2000)
                  }
             })
           }.padding({left: 16, right: 16})
         }.padding({bottom: 100})
        }
          .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
          .scrollBar(BarState.Off)  // 滚动条常驻显示
          .edgeEffect(EdgeEffect.None)
      }
      .width('100%')
      .height('100%')
  }

  // 处理银行卡每四个数字用空格隔开
  dealCardNumber(val: string) {
    let value1 = val.replace(/\s/g, '');
    let value = value1.replace(/(.{4})/g, "$1 ")
    this.inputVal = value
  }
}