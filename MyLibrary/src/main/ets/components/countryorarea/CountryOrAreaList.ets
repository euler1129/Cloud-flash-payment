/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-22 15:00
 */
import CountryOrAreaModel from '../../viewmode/CountryOrAreaModel'
import router from '@ohos.router';

@Preview
@Component
export struct CountryOrAreaList {

  @State dataset: any = CountryOrAreaModel.dataset;
  @State searchValue: string = '';
  @State isSelected: boolean = false;

  controller: SearchController = new SearchController();

  goBackTargetUrl: string = '';


  @Builder itemHead(text:string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(10)
  }

  @Builder itemFoot(num:number) {
    Text('共' + num + "个")
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(5)
  }

  build() {
    Column() {
      Row(){
        Column(){
          Image($r('app.media.t1_arrow_left'))
            .width(20)
        }
        .width('10%')
        .onClick(() => {
          router.back({
            url: this.goBackTargetUrl,
            params: {
              selectedCountry: '',
              selectedNumber: ''
            }
          });
        })
        Column(){
          Text('选择国家/地区')
            .height(40)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
        }
        .width('90%')
      }
      .width('100%')
      .padding({ left: 10, right: 30 })

      Row(){
        Search({ value: this.searchValue, placeholder: '输入然后搜索...', controller: this.controller })
          .searchButton('搜索')
          .width('90%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => {
            this.dataset = CountryOrAreaModel.find(value);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      List({ space: 20 }) {
        ForEach(this.dataset, group => {
          ListItemGroup({ header: this.itemHead(group.name === '常用地区' ? group.name : group.name.toUpperCase()) }) {
            ForEach(group.countries, country => {
              ListItem() {
                Row(){
                  Text(country.name)
                    .height(100)
                    .fontSize(20)
                  Text(country.number)
                    .height(100)
                    .fontSize(20)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .selectable(true)
              .onClick(() => {
                router.back({
                  url: this.goBackTargetUrl,
                  params: {
                    selectedCountry: country.name,
                    selectedNumber: country.number
                  }
                });
              })
            }, country => JSON.stringify(country))
          }
          .borderRadius(20)
          .divider({ strokeWidth: 1, color: Color.Gray })
        }, group => JSON.stringify(group))
      }
      .width('90%')
      .sticky(StickyStyle.Header|StickyStyle.Footer)
    }
    .width('100%')
    .height('100%')
    //.backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}