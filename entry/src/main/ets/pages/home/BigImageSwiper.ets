class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Component
export default  struct BigImageSwiper {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([1, 2,3,4,5])

  build() {

    Column() {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          ImageSwiper()
        }, item => item)
      }
      .autoPlay(true)
      .interval(3000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)

    }.width('100%')
  }
}

@Component
struct ImageSwiper{
  @State fontSize:number=10
  @State mwidth:number=30
  build(){
    Column(){
        Image('pages/home/image/cloud_index_ad.png').width('90%')
    }.width('100%').height(91).margin({top:8})


  }
}