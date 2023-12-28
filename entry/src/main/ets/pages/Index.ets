@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Circle()
          .width(6)
          .height(6)
          //.co(Color.Red)
          .fillOpacity(0)
          .strokeWidth(3)
          .stroke(Color.Red)
      }
      .width('100%')
    }
    .height('100%')
  }
}