
import router from '@ohos.router'
@Component
export struct homeSelection{


  private listScroller:Scroller=new Scroller();
  @State tIndex:number=0;

  @Builder GroupHeader(k:string){
    Text(k)
      .fontWeight(FontWeight.Bolder)
      .fontColor(Color.Black)
      .fontSize(25)
      .margin({bottom:10})
  }
  @State city:object[]=[
     {k:'B',v:[{city:"保定"},{city:"北京"}]}
    ,{k:'C',v:[{city:"常州"},{city:"成都"},{city:"长春"},{city:"长沙"}]}
    ,{k:'D',v:[{city:"大连"},{city:"东莞"}]}
    ,{k:'F',v:[{city:"佛山"},{city:"福州"}]}
    ,{k:'G',v:[{city:"广州"},{city:"贵阳"}]}
    ,{k:'H',v:[{city:"哈尔滨"},{city:"杭州"},{city:"合肥"},{city:"惠州"}]}
    ,{k:'J',v:[{city:"济南"},{city:"嘉兴"},{city:"金华"}]}
    ,{k:'K',v:[{city:"昆明"}]}
    ,{k:'L',v:[{city:"临沂"}]}
    ,{k:'N',v:[{city:"南昌"},{city:"南京"},{city:"南宁"},{city:"南通"},{city:"宁波"}]}
    ,{k:'Q',v:[{city:"青岛"},{city:"泉州"}]}
    ,{k:'S',v:[{city:"上海"},{city:"绍兴"},{city:"深圳"},{city:"沈阳"},{city:"石家庄"},{city:"苏州"}]}
    ,{k:'T',v:[{city:"台州"},{city:"太原"},{city:"天津"}]}
    ,{k:'W',v:[{city:"潍坊"},{city:"温州"},{city:"无锡"},{city:"武汉"}]}
    ,{k:'X',v:[{city:"厦门"},{city:"西安"},{city:"徐州"}]}
    ,{k:'Y',v:[{city:"烟台"}]}
    ,{k:'Z',v:[{city:"郑州"},{city:"中山"},{city:"重庆"},{city:"珠海"}]}
  ]

  @State popularCity:object[]=[
    {city:"北京"},{city:"上海"},{city:"深圳"},
    {city:"广州"},{city:"青岛"},{city:"武汉"},
    {city:"天津"}
  ]

  private value: string[] = ['热','B','C','D','F','G','H'
                            ,'J','K','L','N','Q','S','T','W','X','Y','Z']
build(){
      Stack({alignContent:Alignment.TopEnd}){

        List({space:15,scroller:this.listScroller}){
          ListItemGroup({header:this.GroupHeader("热门城市")})
          {
              ListItem(){
                Grid(){
                  ForEach(this.popularCity,(item)=>{
                      GridItem(){
                        Row(){
                          Text(item.city)
                            .fontSize(20)
                            .fontColor(Color.Red)
                            .height(30)
                            .onClick(()=>{
                              AppStorage.SetOrCreate('currentCity', item.city),
                              router.back()
                            })
                        }.justifyContent(FlexAlign.Start)
                        .width("100%")

                      }
                  })
                }.width("100%")
                .height("100")
                .columnsTemplate("1fr 1fr 1fr")
                .rowsTemplate("1fr 1fr 1fr")
              }

          }

          ForEach(this.city,(CityItem)=>{
            ListItemGroup({header:this.GroupHeader(CityItem.k)})
            {
              ForEach(CityItem.v,(item)=>{
                ListItem(){
                  Row(){
                    Text(item.city)
                      .fontSize(20)
                      .fontColor(Color.Gray)
                      .height(30)
                  }.width('100%')
                  .padding({top:5,right:30})
                  .justifyContent(FlexAlign.SpaceBetween)
                  .onClick(()=>{
                    AppStorage.SetOrCreate('currentCity', item.city),
                    router.back()
                  })
                }
              },(item)=>{
                return item.city;
              })
            }
          },(CityItem,index)=>{
            return index+""})
        }
        .margin({left:10,top:10,bottom:50})
        .edgeEffect(EdgeEffect.Fade) //滑动效果
        .onScrollIndex((index:number)=>{
          this.tIndex=index;
        })

        AlphabetIndexer({arrayValue:this.value,selected:0 })
          .selected(this.tIndex) //设置选中项索引值。
          .margin({top:15})
          .onSelect((index:number)=>{
            this.listScroller.scrollToIndex(index)
            console.log("index="+index);
          })

      }.width('100%')
       .height('95%')
  }
}