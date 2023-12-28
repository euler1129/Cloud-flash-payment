/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-26 19:39
 */
import { SelectPictureOrFile_TakePhoto } from 'mylibrary/src/main/ets/components/picture_file_photo/SelectPictureOrFile_TakePhoto'

@Entry
@Component
struct SelectPictureOrFile_TakePhoto_TestPage {

  build() {
    Column(){
      SelectPictureOrFile_TakePhoto()
    }
    .width('100%')
    .height('100%')
  }

}