import pageHeader from './components/publicComp/pageHeader'
import router from '@ohos.router'

interface obj {
  logo?: Resource
  name?: string
  explain?: string
}

@Entry
@Component
struct CardDetail {
  @State @Watch('getRouterParams') routerParams: obj = router.getParams()
  @State logo: Resource = null
  @State name: string = ''
  @State explain: string = ''

  getRouterParams () {
    this.logo = this.routerParams.logo
    this.name = this.routerParams.name
    this.explain = this.routerParams.explain
  }

  build() {
      Column() {
        pageHeader({ title: '公共页面'})
        Column({space: 20}) {
          if (this.routerParams?.logo) {
            Row() {
              Image(this.routerParams.logo).width(100)
            }
          }
          if (this.routerParams?.name) {
            Row() {
              Text(this.routerParams.name).fontSize(30).fontWeight(FontWeight.Bold)
            }.justifyContent(FlexAlign.Center)
          }

          if (this.routerParams?.explain) {
            Row() {
              Text('描述： ').fontSize(24).fontWeight(FontWeight.Bold)
              Text(this.routerParams.explain).fontSize(24).fontWeight(FontWeight.Bold).fontColor(Color.Red)
            }
          }
        }.layoutWeight(1).justifyContent(FlexAlign.Center)

      }
      .width('100%')
      .height('100%')
      .padding({left: 16, right: 16})
  }
}