/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-26 14:55
 */
import MediaHelper from '../../utils/MediaHelper';
import MediaModel from '../../viewmode/MediaModel';
import common from '@ohos.app.ability.common';
import { MediaOption } from '../../enums/MediaOption';
import router from '@ohos.router';
import http from '@ohos.net.http';

//@Entry
@Preview
@Component
export struct SelectPictureOrFile_TakePhoto {
  @State cardNumber: string = '8888 8888 8888 8888';
  @State mediaModel: MediaModel = new MediaModel();
  private mediaHelper: MediaHelper = new MediaHelper(getContext());

  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  imageUrl: string = '';

  @Builder
  buildPictureOrFile_TakePhoto(){
    Row() {
      Column() {
        Text('选择图片')
          .textAlign(TextAlign.Center)
          .width(200)
          .fontSize(16)
          .padding(10)
          .margin(20)
          .border({ width: 0.5, color: '#ff38f84b', radius: 15 })
          .onClick(() => {
            this.handleClick(MediaOption.Picture)
          })

        Text('选择文件')
          .textAlign(TextAlign.Center)
          .width(200)
          .fontSize(16)
          .padding(10)
          .margin(20)
          .border({ width: 0.5, color: '#ff38f84b', radius: 15 })
          .onClick(() => {
            this.handleClick(MediaOption.File)
          })

        Text('拍照')
          .textAlign(TextAlign.Center)
          .width(200)
          .fontSize(16)
          .padding(10)
          .margin(20)
          .border({ width: 0.5, color: '#ff38f84b', radius: 15 })
          .onClick(() => {
            this.handleClick(MediaOption.TakePhoto)
          })

        Divider()
          .width('100%')
          .height(0.5)
          .color('#ff99f6a2')
          .margin({ top: 20 })
          .padding({ left: 20, right: 20 })

        Text(`文件名称: ${this.mediaModel.getFileName() ? this.mediaModel.getFileName() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Text(`文件大小: ${this.mediaModel.getFileSize() ? this.mediaModel.getFileSize() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Text(`文件类型: ${this.mediaModel.getFileType() ? this.mediaModel.getFileType() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Text(`文件URI: ${this.mediaModel.getLocalUrl() ? this.mediaModel.getLocalUrl() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        // Image(this.mediaModel.getLocalUrl())
        //   .width(300)
        //   .height(300)
        //   .backgroundColor(Color.Grey)
      }
      .width('100%')
      //.height('100%')
    }
    //.height('100%')
  }

  build() {
    Column(){
      Row() {
        this.buildPictureOrFile_TakePhoto()
      }
      .width('100%')
      //.height('90%')
      Row(){
        Canvas(this.context)
          .width(300)
          .height(200)
          .backgroundColor('#ffff00')
          .onReady(() =>{
            this.context.fillRect(0,0,300,200);


          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      Row() {
        Text(this.cardNumber)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.Center)
      Row() {
        Button('Take Number!')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.takeNumber();
          })
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }

  async handleClick(option: MediaOption) {
    let mediaModel: MediaModel;
    switch (option) {
      case MediaOption.Picture:
        mediaModel = await this.mediaHelper.selectPicture();
        break;
      case MediaOption.File:
        mediaModel = await this.mediaHelper.selectFile();
        break;
      case MediaOption.TakePhoto:
        mediaModel = await this.mediaHelper.takePhoto(getContext() as common.UIAbilityContext);
        break;
      default:
        break;
    }

    if (mediaModel) {
      this.mediaModel = mediaModel;
      this.imageUrl = mediaModel.getLocalUrl();
      this.context.drawImage(new ImageBitmap(this.imageUrl), 0, 0, 300, 200);
      console.log('data url: ', this.context.toDataURL());
    }
  }

  takeNumber(){
    let httpRequest = http.createHttp();
    httpRequest.request("https://eolink.o.apispace.com/bankcard/bankcard",
      {
        method: http.RequestMethod.POST,
        header: {
          'Content-Type': 'application/json',
          'X-APISpace-Token': 'bx2w0rl08v4zg4vf5nkfuhn3zpleit9n'
        },
        extraData: {
          "image": this.context.toDataURL(),
        },
      },
      (err: any, data: any) => {
        if (!err && data.result) {
          console.info('data:' + JSON.stringify(data.result));
          let result = JSON.parse(data.result);
          if (result.msg === 'success') {
            this.cardNumber = this.format(result.data.result[0].number);
          } else {
            this.cardNumber = data.result.msg_zh;
          }
        } else {
          console.info('error:' + JSON.stringify(err));
          this.cardNumber = JSON.stringify(err);
        }
      }
    );
  }

  format(number: string): string{
    let temp = "";
    for (let index = 0; index < number.length; index++) {
      let ch = number[index];
      if (index + 1 % 4 === 0) {
        temp = temp + " ";
      }
      temp = temp + ch;
    }
    return temp;
  }

}

