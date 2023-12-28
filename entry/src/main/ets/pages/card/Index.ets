import CardManage from './components/CardManager';

@Extend(Column) function TabContentStyle(bg) {
  .width('100%')
  .height('100%')
  .justifyContent(FlexAlign.Center)
  .backgroundColor(bg)
}

@Entry
@Component
struct HomePage {
  private controller: TabsController = new TabsController()
  @State currentIndex: number = 0
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @Styles styleCss () {
    .width(26)
    .margin(4)
  }

  // tabBar的内容封装
  @Builder tabBarItem (name, index) {
    Column() {
      Image($r('app.media.icon')).width(30).margin({bottom: 6})
      Text(name)
        .fontSize(16)
        .fontColor(this.currentIndex === index ? '#36d' : '#999')
        .fontWeight(this.currentIndex === index && FontWeight.Bold)
    }
  }

  // tabContent的内容封装
  @Builder TabContentItem (content, bg) {
    Column() {
      Text(content)
        .fontColor('#fff')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
    }.TabContentStyle(bg)
  }

  build() {
    Column() {
      // tab部分
      Row() {
        Tabs({
          barPosition: BarPosition.End,
          controller: this.controller}) {
          TabContent() {
            Column() {
              // this.TabContentItem('首页-内容', Color.Pink)
              CardManage()
            }.width('100%').height('100%').backgroundColor('rgb(247, 248, 253)').justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
          }.tabBar(this.tabBarItem('卡管理', 0))
          TabContent(){

            // this.TabContentItem('社区-内容', Color.Pink)
          }.tabBar(this.tabBarItem('社区', 1))
          TabContent(){
            this.TabContentItem('财富-内容', Color.Brown)
          }.tabBar(this.tabBarItem('财富', 2))
          TabContent(){
            this.TabContentItem('生活-内容', Color.Green)
          }.tabBar(this.tabBarItem('生活', 3))
          TabContent(){
            this.TabContentItem('我的-内容', Color.Orange)
          }.tabBar(this.tabBarItem('我的', 4))
        }
        .barHeight(70)
        .animationDuration(400)
        .backgroundColor('rgb(252,241,209)')
        .onChange((index: number) => {
          this.currentIndex = index
        })
      }.layoutWeight(1).alignItems(VerticalAlign.Top)
    }
  }
}