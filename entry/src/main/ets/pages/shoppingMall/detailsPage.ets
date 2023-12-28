import TopTitle from './components/TopTitle'
import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

interface shopItem {
  img: Resource;
  title: string;
  price: string;
  num:number;
}

@Entry
@Component
struct DetailsPage {
  scroller: Scroller = new Scroller()
  @State img: Resource = router.getParams()['img']
  @State title: string = router.getParams()['title']
  @State price: string = router.getParams()['price']
  @State oldPrice: string = router.getParams()['oldPrice']
  @State sold: string = router.getParams()['sold']

  @State isLoved:boolean = false

  @State shopCarNumber:number = 0
  @State shopList:Array<shopItem> = []

  onPageShow(){
    if(AppStorage.Get<string>('shopData') !== undefined){

      this.shopList = JSON.parse(AppStorage.Get<string>('shopData'))

      this.shopCarNumber = 0
      this.shopList.forEach((item:shopItem)=>{
        this.shopCarNumber += item.num
      })
    }
  }

  @Builder detailTitle(title) {
    Row(){
      Divider().vertical(true).strokeWidth(3).color('#ef1220').margin({right:6})
      Text(title).fontSize(18).fontWeight(FontWeight.Bold)
    }.width('100%').height(20).margin(10)
  }


  build() {
    Column(){
      TopTitle({title:'云闪付商城 商品详情'})
      Stack({alignContent: Alignment.Bottom}) {
        Scroll(this.scroller){
          Column(){
            Image(this.img).width('100%')
            Row(){
              Row(){
                Text('￥').fontSize(14).fontColor('#ba070b').fontWeight(FontWeight.Bold)
                Text(this.price).fontSize(20).fontColor('#ba070b').fontWeight(FontWeight.Bold)
                Text('￥').fontSize(12).fontColor('#999').margin({left:5})
                Text(this.oldPrice).fontSize(12).fontColor('#999')
              }.width('50%').justifyContent(FlexAlign.Start)
              Row(){
                Image($r('app.media.ic_dy')).height(20).width(20)
                Text(' 订阅').margin({right:20}).fontSize(12).fontColor('#999')
                Text('已售 '+this.sold + '+').fontSize(12).fontColor('#999')
              }.width('50%').justifyContent(FlexAlign.End).alignItems(VerticalAlign.Center)
            }.padding(10).backgroundColor('#fff')
            Row(){
              Text(this.title).fontSize(18).fontWeight(FontWeight.Bold).width('92%')
              Image(this.isLoved?$r('app.media.ic_love2'):$r('app.media.ic_love_plus')).width(16).margin({right:10}).onClick(()=>{
                this.isLoved = !this.isLoved
                promptAction.showToast({
                  message: this.isLoved?'收藏成功':'取消收藏',
                  duration: 2000,
                  bottom:400
                });
              })
            }.width('100%').padding(10).backgroundColor('#fff').justifyContent(FlexAlign.SpaceBetween)

            Text('改善干燥 沁润锁水').fontSize(14).backgroundColor('#fff').fontColor('#f44a28').fontWeight(FontWeight.Bold).width('100%').textAlign(TextAlign.Start).padding({left:10,bottom:5})

            Row(){
              Image($r('app.media.ic_shopping_detail1')).width('100%')
            }.width('100%').padding(10).backgroundColor('#fff9ef').justifyContent(FlexAlign.Center)

            Column(){
              Row(){
                Row(){
                  Text('规格').fontSize(16).fontWeight(FontWeight.Bold)
                  Text('21片').fontSize(16).margin({left:40})
                }
                Image($r('app.media.right_grey')).width(12).height(12)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(10)
              Row(){
                Divider().width('80%').color('#f6f6f6')
              }.width('100%').padding(10).justifyContent(FlexAlign.End)
              Row(){
                Row(){
                  Text('配送').fontSize(16).fontWeight(FontWeight.Bold)
                  Text('请添加配送地址').fontSize(16).margin({left:40})
                }
                Image($r('app.media.right_grey')).width(12).height(12)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(10)
            }.padding(10).margin({top:10,bottom:10}).backgroundColor('#fff').borderRadius(20)

            Row(){
              Image($r('app.media.ic_shopping_detail3')).width('100%')
            }.width('100%').padding(10).backgroundColor('#fff').justifyContent(FlexAlign.Center).borderRadius(20)

            Row(){
              Image($r('app.media.ic_shopping_detail2')).width('100%')
            }.width('100%').padding(10).margin({top:10}).backgroundColor('#fff').justifyContent(FlexAlign.Center).borderRadius(20)

            Column(){
              this.detailTitle('配送说明')
              Row(){
                Text('发货时限').fontSize(12)
                Text('48小时发货').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('配送方式').fontSize(12)
                Text('圆通').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('配送费用').fontSize(12)
                Text('包邮（新疆、西藏、青海、宁夏、甘肃除外）').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('配送范围').fontSize(12)
                Text('全国（除港澳台外）').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
            }.width('100%').padding(10).margin({top:10}).backgroundColor('#fff').borderRadius(20)

            Column(){
              this.detailTitle('包装售后')
              Row(){
                Text('包装清单').fontSize(12)
                Text('珀莱雅透亮莹润保湿面膜20片*3盒装').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('供应商名').fontSize(12)
                Text('湖州创代电子商务有限公司').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('客服电话').fontSize(12)
                Text('0571-86629566').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('服务时间').fontSize(12)
                Text('工作日9:00-18:00').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
              Row(){
                Text('售后政策').fontSize(12)
                Text('建议当面签收，如遇外包装漏液破损可拒收;签收后发现破损漏液等问题，请拍摄外包装+破损产品图，第一时间致电联系客服0571-86629566，或者添加客服微信18626875251反馈;签收超过7天视为默认无质量问题，不再享受退换服务;如不影响二次销售的产品，支持7天无理由退换，非质量问题退换的运费由客户自行承担，开封、撕标默认已使用，无质量问题不享受7天无理由退换!').width('70%').fontSize(12).fontColor('#5b5b5b').margin({left:40})
              }.width('100%').padding({left:10,top:5,bottom:5}).alignItems(VerticalAlign.Top)
            }.width('100%').padding(10).margin({top:10}).backgroundColor('#fff').borderRadius(20)

            Column(){
              this.detailTitle('图文详情')
              Image($r('app.media.bly_detail1')).width('100%')
              Image($r('app.media.bly_detail2')).width('100%')
              Image($r('app.media.bly_detail3')).width('100%')
              Image($r('app.media.bly_detail4')).width('100%')
              Image($r('app.media.bly_detail5')).width('100%')
              Image($r('app.media.bly_detail6')).width('100%')
              Image($r('app.media.bly_detail7')).width('100%')
              Image($r('app.media.bly_detail8')).width('100%')
              Image($r('app.media.bly_detail9')).width('100%')
              Image($r('app.media.bly_detail10')).width('100%')
              Image($r('app.media.bly_detail11')).width('100%')
              Image($r('app.media.bly_detail12')).width('100%')
              Image($r('app.media.bly_detail13')).width('100%')
            }.width('100%').padding(10).backgroundColor('#fff')

          }.padding({bottom:100})
        }
        Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
          Column(){
            Image($r('app.media.ic_shop')).width(22).height(22)
            Text('店铺').margin({top:5}).fontSize(12)
          }
          Column(){
            Image($r('app.media.ic_coke')).width(22).height(22)
            Text('客服').margin({top:5}).fontSize(12)
          }
          Column(){
            Badge({
              count: this.shopCarNumber,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 12, badgeSize: 12, badgeColor: Color.Red }
            }) {
              Image($r('app.media.ic_gouwuche')).width(22).height(22)
            }
            Text('购物车').margin({top:5}).fontSize(12)
          }.onClick(()=>{
            router.pushUrl({url:'pages/shoppingMall/shoppingCar'})
          })
          Button('加入购物车',{type:ButtonType.Normal}).width(140).height(50).borderRadius(5).backgroundColor('#ffb305').fontSize(14).onClick(()=>{
            this.shopCarNumber ++;

            let isHas = false;
            let num = 0;
            this.shopList.forEach((item,index)=>{
              if(item.title === this.title){
                isHas = true
                this.shopList[index].num += 1
              }
            })

            if(!isHas){
              num ++
              this.shopList.push({
                img:this.img,
                title:this.title,
                price:this.price,
                num:num
              })
            }
            AppStorage.SetOrCreate<string>('shopData', JSON.stringify(this.shopList));

            promptAction.showToast({
              message: '添加成功',
              duration: 2000,
              bottom:400
            });
          })
          Button('立即购买',{type:ButtonType.Normal}).width(140).height(50).borderRadius(5).backgroundColor('#e9131f').fontSize(14)
        }.padding({top:10,bottom:30,left:10,right:10}).backgroundColor('#f6f6f6')
      }.height('100%').padding({bottom:60}).backgroundColor('#f6f6f6')
    }.height('100%')
  }
}