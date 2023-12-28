/**
 * 我的--会员中心
 */
import MemberItem from '../dataObject/MemberItem'
import { MemberItemList } from '../dataObject/MemberItemList'

@Entry
@Component
export default struct  MemeberItemList1{
  scroller: Scroller = new Scroller()
  @Builder itemFoot() {
    Column() {
      Text(`暂无更多数据`).width('100%').fontSize(14).fontColor('#999').margin(20)
    }
  }

  build() {
    Column() {
      WaterFlow({ footer: this.itemFoot.bind(this), scroller: this.scroller }) {
        // FlowItem(){Image($r('app.media.ic_recommend'))}.height('250vp')
        ForEach(MemberItemList ,item=>{
          FlowItem(){
            MemberItem({img:item.img,title:item.title,price:item.price,sold:item.sold})
          }.width('100%').height('290vp')
        })
      }
      .columnsTemplate("1fr 1fr")
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .columnsGap(10) // 列间距
      .rowsGap(10) // 行间距
      .onReachStart(() => { // 瀑布流组件到达起始位置时触发。
        console.info("onReachStart")
      })
      .onReachEnd(() => { // 瀑布流组件到底末尾位置时触发。
        console.info("onReachEnd")
      })
      .backgroundColor('#f2f2f2')
      .width('100%')
      .height('100%')
      .layoutDirection(FlexDirection.Column)
    }
  }
}