import TopTitle from './components/TopTitle'
import promptAction from '@ohos.promptAction';

interface shopItem {
  img: Resource;
  title: string;
  price: string;
  num:number;
}

@Entry
@Component
struct confirmOrder {
  @State shopData:Array<shopItem> = []

  onPageShow(){
    if(AppStorage.Get<string>('shopData') !== undefined){
      this.shopData = JSON.parse(AppStorage.Get<string>('shopData'))
    }
  }

  countPriceAll(){
    let s = 0;
    this.shopData.forEach(item=>{
      s+=item.num * Number(item.price)
    })
    return s.toString()
  }


  build() {
    Column() {
      TopTitle({ title: '确认订单' })

      Scroll() {
        Column(){
          // 地址栏
          Image($r('app.media.divider_icon2')).width('100%').height(4)
          Row() {
            Row() {
              Image($r('app.media.location_icon')).width(20).height(20)
              Column() {
                Text('赵先生 176****7676').fontSize(16).fontWeight(FontWeight.Bold)
                Text('上海市上海市闵行区').fontSize(14).margin({top:10})
                Text('漕河泾科汇大厦').fontSize(14)
              }.margin({ left: 10 }).alignItems(HorizontalAlign.Start)
            }
            Image($r('app.media.func_right_small_arrow')).width(12).height(12)
          }.width('100%').padding({left:10,right:10,top:10,bottom:30}).margin({bottom:10}).backgroundColor('#fff').justifyContent(FlexAlign.SpaceBetween)

          // 全部商品
          Column(){

            // 单个商品
            ForEach(this.shopData,(item:shopItem)=>{
              Column(){
                Row() {
                  Image($r('app.media.ic_shop')).width(20).height(20).margin({ left: 15 })
                  Text('珀莱雅官方旗舰店').margin({ left: 10 }).fontSize(16).fontWeight(FontWeight.Bold)
                }.width('100%').justifyContent(FlexAlign.Start).margin({bottom:15})
                Row() {
                  Image(item.img).width(100).height(100).borderRadius(5)
                  Column() {
                    Text(item.title).fontSize(16).fontWeight(FontWeight.Bold).maxLines(2).textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text('3.0轻盈霜50g').backgroundColor('#f5f5f5').fontSize(12).padding({ top: 2, bottom: 2, left: 5, right: 5 }).borderRadius(5).margin({ top: 10, bottom: 15 })
                    Row() {
                      Row() {
                        Text('￥').fontSize(12).fontColor('#ba070b').fontWeight(FontWeight.Bold)
                        Text(item.price).fontSize(16).fontColor('#ba070b').fontWeight(FontWeight.Bold)
                      }
                      Text(`x${item.num}`).fontSize(12)
                    }.width("100%").justifyContent(FlexAlign.SpaceBetween)
                  }.layoutWeight(1).margin({ left: 10 }).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.SpaceBetween)
                }.width('100%').justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('查看更多').fontSize(14).fontColor('#999').margin({right:10})
                  Image($r('app.media.arrow_down_grey')).width(12)
                }.margin({top:20}).alignItems(VerticalAlign.Center).height(20)
              }.width('100%').padding(10)
            })

          }.margin({left:10,right:10,bottom:10}).padding(10).borderRadius(15).backgroundColor('#fff')

          Column(){
            Row(){
              Image($r('app.media.confirmOrder_icon1')).width(25).height(25)
              Text('订单金额明细').fontSize(16).fontWeight(FontWeight.Bold).margin({left:10})
            }.width('100%').justifyContent(FlexAlign.Start)
            Row(){
              Text('商品金额').fontSize(14).margin({left:40})
              Text(`￥${this.countPriceAll()}.00`).fontSize(12).fontColor('#ba070b')
            }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({top:10,bottom:10})
            Row(){
              Text('总运费').fontSize(14).margin({left:40})
              Text('包邮').fontSize(14).fontColor('#ba070b')
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            Row(){
              Text('预估合计').fontSize(14)
              Text(`￥${this.countPriceAll()}.00`).fontSize(20).fontColor('#ba070b')
            }.width('100%').justifyContent(FlexAlign.End).margin({top:10})
          }.padding(10).margin({left:10,right:10}).borderRadius(15).backgroundColor('#fff')

          Column(){
            Row(){
              Row(){
                Image($r('app.media.confirmOrder_icon2')).width(25).height(25)
                Text('支付优惠').fontSize(16).fontWeight(FontWeight.Bold).margin({left:10})
              }
              Text('实际优惠以提交订单后支付时选卡为准').fontSize(12).fontColor('#999')
            }.width('100%').justifyContent(FlexAlign.SpaceBetween)
          }.margin(10).padding(10).borderRadius(15).backgroundColor('#fff')

          Column(){
            Text('提示:支付优惠在支付选卡时展示，商品最终价格以提交订单后支付选卡为准;购买后可在订单中心开票').fontSize(14).fontColor('#999')
          }.padding(10).margin({left:10,right:10,bottom:50})

        }.alignItems(HorizontalAlign.Start)
      }.layoutWeight(1).backgroundColor('#f6f6f6')

      Row() {
        Text(`共3件，预估到手合计`).fontSize(14)
        Text('￥').fontSize(16).fontColor('#ba070b').fontWeight(FontWeight.Bold)
        Text(`${this.countPriceAll()}.00`).fontSize(20).fontColor('#ba070b').fontWeight(FontWeight.Bold).margin({right:10})
        Button('提交订单', { type: ButtonType.Normal }).width(130).height(50).borderRadius(0).backgroundColor('#e9131f').fontSize(16)
          .onClick(()=>{
            promptAction.showToast({
              message: '订单提交成功！',
              duration: 2000,
              bottom:400
            });
          })
      }.width('100%').justifyContent(FlexAlign.End)

    }.height('100%')
  }
}