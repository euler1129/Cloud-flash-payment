import router from '@ohos.router'
import { foreignSelection } from './foreignSelection';
import { homeSelection } from './homeSelection';


@Component
@Entry
struct citySelection{

  private controller: TabsController = new TabsController();

  @State tIndex:number=0;

  @Builder tabBuild(title:string,targetIndex:number){

    Text(title)
      .fontSize((this.tIndex==targetIndex)?25:20)
      .fontColor((this.tIndex==targetIndex)?Color.Black:Color.Gray)
      .onClick(()=>{
           this.tIndex=targetIndex;
           this.controller.changeIndex(targetIndex)
      })
  }

  build(){
    Column(){
      Row(){
        Image($r('app.media.ic_back'))
          .width(30)
          .height(30)
          .margin({right:80})
          .onClick(()=>{
            router.back();
          })
        Text("选择城市")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }.width('94%')
      .justifyContent(FlexAlign.Start)
      .margin({top:15,bottom:15})

       Tabs({barPosition:BarPosition.Start,controller:this.controller}){
         //国内
         TabContent(){
           homeSelection();
         }.tabBar(this.tabBuild("国内城市",0));

         //国外/国际城市
         TabContent(){
           foreignSelection();
         }.tabBar(this.tabBuild("国外/国际城市",1))
       }.scrollable(false) //不可滑动切换页面
        .barMode(BarMode.Fixed) //平分
        .animationDuration(0) //动画时长
    }.width("100%")
    .height("100%")

  }
}