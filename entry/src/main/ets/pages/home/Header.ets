import display from '@ohos.display';
import router from '@ohos.router';
import { PreferentialTips,OtherTips } from './Tips';

@Component
export default  struct Header{

  @State customPopup: boolean = false

  @State otherTips:string = '';
  @State visible:any = Visibility.None;

  aboutToAppear(){
    let displayClass = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      console.info(' to obtain : ' + JSON.stringify(displayClass));
    } catch (exception) {
      console.error('Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
    }
  }

  @Builder popupBuilder() {
    Row({ space: 2 }) {
      Text('提示').fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build(){
    Column(){

      Row(){
        Column(){
          //Image($r('app.media.collection_and_payment')).width(45)
          Image('pages/home/image/collection_and_payment.png').width(45)
          Text('收付款').fontColor(Color.White).fontWeight(FontWeight.Medium)
            .margin({top:8})
        }.onClick(() => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Top,
          popupColor: Color.Yellow,
          enableArrow: true,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        })
        Column(){
          Image('pages/home/image/travel.png').width(45)
          PreferentialTips()
          Text('出行').fontColor(Color.White).fontWeight(FontWeight.Medium)
            .margin({top:8})
        }
        Column(){
          Image('pages/home/image/sacn_it.png').width(45)
          Text('扫一扫').fontColor(Color.White).fontWeight(FontWeight.Medium)
            .margin({top:8})
        }
        Column(){
          Image('pages/home/image/transfer_accounts.png').width(45)
          Text('转账').fontColor(Color.White).fontWeight(FontWeight.Medium)
            .margin({top:8})
        }
      }.justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .margin({top:20})

      Image('pages/home/image/header_bg.png').width('100%')
        .margin({top:-120})
        .zIndex(-10)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/home/publish/CloudPublish'
          })
        })
    }.width('100%')

  }

}

@Component
export struct HeaderSelect{
  @State citys:string[]=['上海', '北京', '广州', '深圳']
  @State city:string='上海'
    build(){
      Row(){
        Text(this.city).fontColor(Color.White).margin({left:20})
        Image('pages/home/image/drop_down.png').width(18).height(18)
        Select([{value:'上海'},
          {value:'北京',},
          {value:'广州'},
          {value:'深圳'}])
          .selected(2)
          .value('上海')
          .font({size: 30, weight:400, family: 'serif',  })
          .selectedOptionFont({size: 40, weight: 500, family: 'serif', style: FontStyle.Normal })
          .optionFont({size: 18, weight: 300, family: 'serif', style: FontStyle.Normal, })
          .opacity(0)
          .margin({left:-50})
          .onSelect((index:number)=>{
            //console.info("Select:" + index)
            this.city = this.citys[index];
          })
        Search({  placeholder: 'K11' })
          .searchButton('搜索')
          .width('60%')
          .height(30)
          .backgroundColor(Color.White)
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 40, weight: 400 })
          .margin({left:-35})
        Text('搜索').fontColor('#C4337B').margin({left:-48})
        Image('pages/home/image/message.png').width(30).margin({left:10})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/home/message/Service'
            })
          })
        Image('pages/home/image/plus.png').width(20).margin({left:10})
      }.backgroundColor('#D4167E')
      .margin({top:-10})
      //.backgroundImage($r('app.media.search_background'))
      .width('100%')
    }
}