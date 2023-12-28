import { TabsList,TabsItem } from './components/TabsData'
import TopTitle from './components/TopTitle'
import router from '@ohos.router'

interface shopItem {
  img: Resource;
  title: string;
  price: string;
  num:number;
}


@Entry
@Component
struct shoppingCar{
  @State shopData:Array<shopItem> = []

  onPageShow(){
    if(AppStorage.Get<string>('shopData') !== undefined){
      // console.log(AppStorage.Get<string>('shopData'))
      this.shopData = JSON.parse(AppStorage.Get<string>('shopData'))
    }
  }

  changePriceAll(){
    let s = 0;
    this.shopData.forEach(item=>{
      s+=item.num * Number(item.price)
    })
    return s.toString()
  }

  changeSum(){
    let s = 0;
    this.shopData.forEach(item=>{
      s+=item.num
    })
    return s
  }

  saveShopNumber(title,type){
    this.shopData.forEach((item,index)=>{
      if(item.title === title){
        const data = JSON.parse(JSON.stringify(this.shopData))
        if(type === 'add'){
          data[index].num ++
        }else if(type === 'sub'){
          data[index].num --
        }
        this.shopData=data
      }
    })
    AppStorage.SetOrCreate<string>('shopData', JSON.stringify(this.shopData));
  }

  build(){
    Column(){
      TopTitle({title:'购物车'})

      Scroll(){
        Column(){

          // 地址栏
          Image($r('app.media.divider_icon2')).width('100%').height(4)
          Row(){
            Row(){
              Image($r('app.media.location_icon')).width(20).height(20)
              Text('配送至：').margin({left:10}).fontSize(14)
              Text('上海市上海市闵行区漕河泾科汇大厦').fontSize(12)
            }
            Image($r('app.media.func_right_small_arrow')).width(12).height(12)
          }.width('100%').padding(10).backgroundColor('#fff').justifyContent(FlexAlign.SpaceBetween)

          // 全部商品
          Column(){
            ForEach(this.shopData,(item:shopItem,index)=>{
              // 店铺
              Row(){
                Row(){
                  Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
                    .selectedColor('#ba070b')
                    .select(true)
                    .onChange((value: boolean) => {})
                  Image($r('app.media.ic_shop')).width(20).height(20).margin({left:15})
                  Text('珀莱雅官方旗舰店').margin({left:10}).fontSize(14).fontWeight(FontWeight.Bold)
                }
                Image($r('app.media.func_right_small_arrow')).width(12).height(12)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)

              // 商品信息
              Row(){
                Row(){
                  Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
                    .selectedColor('#ba070b')
                    .select(true)
                    .onChange((value: boolean) => {})
                }
                Image(item.img).width(100).height(100)
                Column(){
                  Text(item.title).maxLines(2).textOverflow({overflow:TextOverflow.Ellipsis})
                  Text('21片').backgroundColor('#f5f5f5').fontSize(12).padding({top:2,bottom:2,left:5,right:5}).borderRadius(5).margin({top:10,bottom:5})
                  Row(){
                    Row(){
                      Text('￥').fontSize(12).fontColor('#ba070b').fontWeight(FontWeight.Bold)
                      Text(item.price).fontSize(16).fontColor('#ba070b').fontWeight(FontWeight.Bold)
                    }
                    Counter() {
                      Text(item.num.toString())
                    }
                    .onInc(() => {
                      this.saveShopNumber(item.title,'add')
                    })
                    .onDec(() => {
                      this.saveShopNumber(item.title,'sub')
                    })

                  }.width("100%").justifyContent(FlexAlign.SpaceBetween)
                }.layoutWeight(1).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.SpaceBetween).margin({left:10})
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            },(item:shopItem)=>JSON.stringify(item))
          }.width('100%').padding(10).backgroundColor('#fff').borderRadius(15).margin({top:10})



        }.width('100%').height('100%')
      }.backgroundColor('#f8f8f8').width('100%').padding(10).layoutWeight(1)

      Column(){
        Row(){
          Row(){
            Text('全选').backgroundColor('#ff0000').fontColor('#fff').fontSize(14).padding(10).borderRadius(5).margin({left:10})
            Text('编辑').backgroundColor('#fff').fontSize(14).padding(10).border({width:1,color:'#999'}).borderRadius(5).margin({left:10})
          }
          Row(){
            Text(`已选${this.changeSum()}件，合计`)
            Text('￥').fontSize(12).fontColor('#ba070b').fontWeight(FontWeight.Bold)
            Text(this.changePriceAll()).fontSize(20).fontColor('#ba070b').fontWeight(FontWeight.Bold).margin({right:10})
            Button('去结算',{type:ButtonType.Normal}).width(120).height(60).borderRadius(0).backgroundColor('#e9131f').fontSize(16).onClick(()=>{
              router.pushUrl({
                url:'pages/shoppingMall/confirmOrder'
              })
            })
          }
        }.width('100%').backgroundColor('#fff').justifyContent(FlexAlign.SpaceBetween)
        Divider().color('#f8f8f8')
        Flex({justifyContent:FlexAlign.SpaceAround}){
          ForEach(TabsList,(item:TabsItem,index)=>{
            Column() {
              Image(item.icon)
                .width(26)
                .height(26)
                .objectFit(ImageFit.Contain)

              Text(item.text)
                .fontSize(12)
                .opacity(0.8)
                .fontColor('#000')
                .margin({top:6})
            }.height(56)
          },(item:TabsItem) => JSON.stringify(item))
        }.width('100%').padding(10)
      }.width('100%')
    }.height('100%')
  }
}