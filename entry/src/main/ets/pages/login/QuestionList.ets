/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 13:17
 */
import router from '@ohos.router'

@Entry
@Component
struct QuestionList {
  @State message: string = 'Do you have any questions?'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.back();
          })
      }
      .width('100%')
      .padding(10)
    }
    .height('100%')
  }

}