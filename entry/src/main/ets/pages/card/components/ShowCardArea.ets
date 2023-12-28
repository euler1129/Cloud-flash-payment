import router from '@ohos.router'
import { showCardAreaDataType } from '../common/utils/type'




@Component
export default struct ShowCardArea {
  private swiperController: SwiperController = new SwiperController()

  @Link showCardAreaData: showCardAreaDataType

  @State depositCardNum: number = 0
  @State creditCardNum: number = 0
  @State currCardType: 'depositCard' | 'creditCard'  = 'depositCard' // 当前银行卡类型
  @State currCardList: Array<any>  = [] // 当前银行卡类型对应的银行卡列表
  @State addDoneCardInfo: Array<any> = this.showCardAreaData?.addDoneCardInfo || [] // 已添加的银行卡数据
  @State cardFunctionList: Array<any> = this.showCardAreaData?.cardFunctionList || [] // 银行卡功能模块
  @State cardInfoFlag: string = '' // 是否成功请求已添加的银行卡数据的标识 ''未初始化 0无数据 1 有数据
  @State eyeState: boolean = false // 是否隐藏金额
  @State allMoney: string = '' // 余额总计

  @StorageLink('saveCardNum') @Watch('watchCurrentCardNum') saveCardNum1: string = '';

  // 监听传回来的值
  watchCurrentCardNum () {
    if (this.saveCardNum1) {
      console.log('saveCardNum', this.saveCardNum1.substr(-4))

      const list = JSON.parse(JSON.stringify(this.addDoneCardInfo))

      const addIndex = list[1].cardList.length + 1
      list[1].cardList.push({
        id: `creditCard_${addIndex}`,
        img: $r('app.media.auth_card_default_card_ec'),
        cardName: `新增银行${addIndex}`,
        cardNum: this.saveCardNum1.substr(-4),
        money: '4000',
        isTransfer: true
      })
      this.addDoneCardInfo = []
      setTimeout(()=>{
        this.addDoneCardInfo = list
        this.dealTypeToList()
        // 置空
        AppStorage.SetOrCreate('saveCardNum', '')
      }, 300)
    }


  }

  // 银行卡展示内容
  @Builder cardItemInfo () {
    Row() {
      Text('余额总计 ')
      Text(this.dealMoneyShow(this.allMoney))
      Image(this.eyeState ? $r('app.media.i_eye') : $r('app.media.i_close_eye'))
        .width(20)
        .margin({left: 10})
        .onClick(()=>{
          this.eyeState = !this.eyeState
        })
    }
      .width('100%')
      .height(60)
    List({space: 10}) {
      ForEach(this.currCardList, (item) => {
        ListItem() {
          Row() {
            Column() {
              Image(item.img).height('100%')
            }
            Column() {
              Row() {
                Text() {
                  Span(item.cardName).fontWeight(FontWeight.Bold)
                  Span(` [${item.cardNum}]`).fontColor('#999').fontSize(14)
                }.width('100%')
              }
              Row() {
                Text(this.dealMoneyShow(item.money)).width('100%')
              }
            }
              .height('100%')
              .margin({left: 20})
              .justifyContent(FlexAlign.SpaceBetween)
              .layoutWeight(1)
            Column() {
              Text('转账')
                .fontColor('#ED171F')
                .fontWeight(FontWeight.Bold)
                .backgroundColor('#fff')
                .padding({left: 14, right: 14})
                .height(30)
                .borderRadius(15)
                .border({width: 1, color: '#ED171F'})
                .visibility(item.isTransfer ? Visibility.Visible : Visibility.Hidden)
                .onClick(()=>{
                  console.log('转账', JSON.stringify({...item, headerTitle: item.name}))
                  const obj = {
                    name: item.cardName,
                    logo: item.img,
                    explain: '转账'
                  }
                  router.pushUrl({url: 'pages/card/CardDetail', params: obj})
                })
            }
              .height('100%')
              .justifyContent(FlexAlign.End)

          }
          .width('100%')
          .height(80)
          .padding({left: 10, right: 10, top: 16, bottom: 16})
          .backgroundColor('#f5f6f8')
          .borderRadius(10)
        }
      }, item => item.id)
    }
      .width('100%')
      // .height(300)
  }

  aboutToAppear() {
    console.log('获取数据-showCardAreaData', JSON.stringify(this.showCardAreaData))
    this.dealTypeToList()
  }

  build() {
    Column() {
      // 卡信息总览
      Row() {
        // 银行卡类型
        ForEach(this.addDoneCardInfo, (item)=>{
          Column() {
            Text(`${item.typeName}(${item.cardList.length})`)
              .margin({right: 16})
              .fontSize(this.currCardType === item.type ? 16 : 14)
              .fontWeight(this.currCardType === item.type && FontWeight.Bold)
              .onClick(() => {
                this.currCardType = item.type
                this.dealTypeToList()
            })
            Image($r('app.media.tab_index_img'))
              .width(28)
              .margin({top: 6, left: -16})
              .visibility(this.currCardType !== item.type ? Visibility.Hidden : Visibility.Visible)
          }.height('100%')
        }, item=>item.type)
        Blank()
        Column() {
          Image($r('app.media.icon_add'))
            .width(24)
            .onClick(()=> this.goAddCard())
        }.justifyContent(FlexAlign.Start).height('100%')
      }.width('100%').height(50).padding({top: 10})
      // 添加按钮（无卡状态）
      if (this.cardInfoFlag === '1') {
        this.cardItemInfo()
      }
      if (this.cardInfoFlag === '0') {
        Row() {
          Text('+ 添加储蓄卡 转账0手续费')
            .width('80%')
            .height(40)
            .textAlign(TextAlign.Center)
            .border({width: 1, color: '#ED171F'})
            .fontColor('#ED171F')
            .borderRadius(20)
            .onClick(()=> this.goAddCard())
        }
        .width('100%')
        .height(100)
        .justifyContent(FlexAlign.Center)
      }

      // 银行卡功能模块
      if (this.cardFunctionList?.length > 0) {
        Row() {
          Swiper(this.swiperController) {
            ForEach(this.cardFunctionList, (item)=>{
              Row() {
                ForEach(item.list, (son)=>{
                  Column() {
                    Stack({alignContent: Alignment.TopEnd}) {
                      Image(son.icon).width(30)
                      if (son.desc) {
                        Text(son.desc)
                          .fontSize(8)
                          .backgroundColor(Color.Red)
                          .fontColor('#fff')
                          .width(34)
                          .height(12)
                          .textAlign(TextAlign.Center)
                          .borderRadius({topLeft: 10, topRight: 10, bottomRight: 10})
                          .position({x: 12})
                      }
                    }.width(30)

                    Text(`${son.name}`)
                      .fontSize(12)
                      .margin({top: 8, bottom: 14})
                  }.onClick(()=>{
                    const obj = {
                      name: son.name,
                      logo: son.icon,
                      explain: '银行卡功能区'
                    }
                    router.pushUrl({url: 'pages/card/CardDetail', params: obj})
                  })
                }, son=>son.key)
              }
              .width('100%')
              .height(100)
              .justifyContent(FlexAlign.SpaceBetween)
            }, item => item.key)
          }
          .duration(500)
          .indicatorStyle({
            color: '#ccc',
            selectedColor: '#d32c3c'
          })
        }.border({width: {top: 1}, color: '#eee'}).margin({top: 10})
      }

    }
      .padding({top: 12, left: 12, right: 12})
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(10)
  }

  // 统一处理金额显示
  dealMoneyShow(num: string) {
    return this.eyeState ? num : '****'
  }

  // 根据当前银行卡类型，输出当前银行卡列表, 计算余额总计
  dealTypeToList() {
    const arr = this.addDoneCardInfo.filter((item)=> item.type === this.currCardType)
    if (arr?.length > 0) {
      this.currCardList = arr[0].cardList
      // 1.显示对应类型卡列表的标识
      this.cardInfoFlag = this.currCardList?.length > 0 ? '1' : '0'
      // 2.计算余额总计
      if (this.currCardList?.length > 0) {
        let allNum = 0
        this.currCardList.forEach((item)=>{
          allNum += Number(item.money)
        })
        this.allMoney = '' + allNum
      }
    }
  }

  // 跳转至添加银行卡页面
  goAddCard() {
    router.pushUrl({url: 'pages/card/AddCard'})
  }
}