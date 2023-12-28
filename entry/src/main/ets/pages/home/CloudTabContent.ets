
import RefreshImage,{ControllSwitch} from './RefreshImage'
import CardManager from '../card/components/CardManager'
import { MyAccount } from '../myAccount/MyAccount';
import { preferential } from '../preferentialPage/preferential';
import Wealth from '../wealth/wealth'

class  ImageAttr{
   img:any ;
   title:string ;
   imgRed:any ;

  constructor(img: any, title: string, imgRed:any) {
    this.img=img;
    this.title=title;
    this.imgRed=imgRed;
  }
}


@Entry
@Component
export default   struct CloudTabContent {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  // @ts-ignore
  private  controller: TabsController = new TabsController()
  @State controllSwitch:ControllSwitch = new ControllSwitch(this.controller)
  @State imgBot:Array<ImageAttr>=[
    new ImageAttr('pages/home/image/home.png','首页','pages/home/image/home_red.png'),
    new ImageAttr('pages/home/image/preferential.png','优惠','pages/home/image/preferential_red.png'),
    new ImageAttr('pages/home/image/manage_card.png','卡管理','pages/home/image/manage_card_red.png'),
    new ImageAttr('pages/home/image/wealth.png','财富','pages/home/image/wealth_red.png'),
    new ImageAttr('pages/home/image/mine.png','我的','pages/home/image/mine_red.png')
  ];

  @Builder TabBuilder(item:ImageAttr,index:number) {
    Column() {
      Image(this.currentIndex===index?item.imgRed : item.img)
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(item.title)
        .fontColor(this.currentIndex===index?'#E74B56':'#C4C4C2')
        .fontSize(10)
        .fontWeight(500)
        //.lineHeight(14)
    }.width('100%')
  }

  build() {
    Column() {

      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        ForEach(this.imgBot,(item:ImageAttr,index:number)=>{
          TabContent() {
            if(item.title==='首页') {
                RefreshImage({controller:this.controllSwitch,currentIndex:$currentIndex})
            }else if(item.title==='优惠'){
               //Text('优惠')
              preferential()
            }else if(item.title==='卡管理'){
              // Text('卡管理')
              CardManager()
            }else if(item.title==='财富'){
              Wealth()
            }else if(item.title==='我的'){
              // Text('我的')
              MyAccount()
            }

          }.tabBar(this.TabBuilder(item,index)).margin({top:-17})
        })

      }
      .vertical(false)
      .scrollable(true)
      //.borderColor('#D4167E')
      .borderWidth(0)
      .animationDuration(500)
      //.barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index
      }).borderWidth(0)
      .width('100%')
      .height('100%').borderColor('#D4167E')
      .backgroundColor('#FFFFFF')
      if(this.currentIndex==0){
        Image('pages/home/image/lottery_draw.png').width(60).height(60)
          .zIndex(100).margin({top:-300,left:345})
      }
    }.width('100%').borderWidth(0).borderColor('#D4167E')
  }
}function CardManage() {
throw new Error('Function not implemented.');
}
