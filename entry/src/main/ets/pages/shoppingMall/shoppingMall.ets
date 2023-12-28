import { TabsList ,TabsItem} from './components/TabsData';
import TopTitle from './components/TopTitle';
import HomeTabs from './views/HomeTabs';

@Entry
@Component
struct shoppingMall {
  @State currentIndex: number = 0;
  @State topTitle:string = '云闪付商城';
  private controller: TabsController = new TabsController();


  @Builder TabBuilder(index:number,item:TabsItem){
    Column() {
      Image(this.currentIndex === index?item.iconSelected:item.icon)
        .width(26)
        .height(26)
        .objectFit(ImageFit.Contain)

      Text(item.text)
        .fontSize(12)
        .opacity(0.8)
        .fontColor(this.currentIndex === index?'#FF0000':'#000')
        .margin({top:6})
    }.height(56)
  }

  build() {
      Column(){

        TopTitle({title:this.topTitle})

        Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
          ForEach(TabsList,(item,index)=>{
            TabContent() {
              if(index === 0){
                HomeTabs()
              }else  if(index === 1){
                Text('贵金属').width('100%').height('100%').backgroundColor(Color.Pink).fontSize(20).textAlign(TextAlign.Center)
              }else  if(index === 2){
                Text('惠充值').width('100%').height('100%').backgroundColor(Color.Red).fontSize(20).textAlign(TextAlign.Center)
              }else  if(index === 3){
                Text('聚优惠').width('100%').height('100%').backgroundColor(Color.Blue).fontSize(20).textAlign(TextAlign.Center)
              }else  if(index === 4){
                Text('我的').width('100%').height('100%').backgroundColor(Color.Green).fontSize(20).textAlign(TextAlign.Center)
              }
            }.tabBar(this.TabBuilder(index,item))
          }, item=>JSON.stringify(item))
        }.onChange((index: number) => {
          this.currentIndex = index;
          this.topTitle = TabsList[index].topTitle
        })
        .width('100%')
        .backgroundColor('#F1F3F5')
        .vertical(false)
        .barHeight(80)
        .layoutWeight(1)

      }.height('100%')
    }
}