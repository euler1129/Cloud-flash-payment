import router from '@ohos.router';
@Component
export struct foreignSelection{
    private controller: TabsController = new TabsController();

    @State tIndex:number=0;
    @State tIndex2:number=0;



    @Builder tabBuild(title:string,targetIndex:number){
        Row(){
            Text(title)
                .fontSize((this.tIndex==targetIndex)?25:20)
                .fontColor((this.tIndex==targetIndex)?Color.Red:Color.Black)
           }.width("100%")
           .height("100%")
           .onClick(()=>{
               this.tIndex2=this.tIndex;
               if(targetIndex>=0){
                   this.tIndex=targetIndex;
                   this.controller.changeIndex(targetIndex);
               }else{
                   targetIndex=this.tIndex2;
               }

               console.log("tIndex="+this.tIndex+"\ttargetIndex="+targetIndex)
           })


    }

    @Builder GroupHeader(k:string){
        Text(k)
            .fontWeight(FontWeight.Bolder)
            .fontColor(Color.Black)
            .fontSize(25)
            .margin({bottom:10})
    }

    //数组遍历
    @Builder myList(arr:object[]){List({space:15})
        {ForEach(arr, (cityList) => {
            ListItemGroup({ header: this.GroupHeader(cityList.k) }) {
                ForEach(cityList.v, (item) => {
                    ListItem() {
                        Row() {
                            Text(item.city)
                                .fontSize(22)
                                .fontColor(Color.Gray)
                                .onClick(()=>{
                                    AppStorage.SetOrCreate('currentCity', item.city),
                                    router.back()
                                })
                        }.width('100%')
                        .padding({ bottom: 15 })
                        .justifyContent(FlexAlign.SpaceBetween)

                    }
                }, (item) => {
                    return item.city;
                })
            }
        }, (CountryItem, index) => {
            return index + ""
        })
        }.edgeEffect(EdgeEffect.Fade) //滑动效果
        .width("100%")
        .margin({bottom:50})
    }

    @State gangaotai:object[]=[
        {k:"香港",v:[{city:"香港"}]},
        {k:"澳门",v:[{city:"澳门"}]},
        {k:"台湾",v:[{city:"台湾"}]}
    ]
    @State yz:object[]=[
        {k:"朝鲜",v:[{city:"朝鲜"}]},
        {k:"韩国",v:[{city:"韩国"}]},
        {k:"日本",v:[{city:"日本"}]},
        {k:"马来西亚",v:[{city:"马来西亚"}]}
    ]
    @State oz:object[]=[
        {k:"德国",v:[{city:"德国"}]},
        {k:"法国",v:[{city:"法国"}]},
        {k:"英国",v:[{city:"英国"}]},
        {k:"德国",v:[{city:"德国"}]},
        {k:"俄罗斯",v:[{city:"俄罗斯"}]},
        {k:"意大利",v:[{city:"意大利"}]},
        {k:"希腊",v:[{city:"希腊"}]},
        {k:"丹麦",v:[{city:"丹麦"}]},
        {k:"葡萄牙",v:[{city:"葡萄牙"}]},
        {k:"西班牙",v:[{city:"西班牙"}]},
    ]
    @State bmz:object[]=[
        {k:"美国",v:[{city:"美国"}]},
        {k:"加拿大",v:[{city:"加拿大"}]},
        {k:"墨西哥",v:[{city:"墨西哥"}]}
    ]
    @State nmz:object[]=[
        {k:"巴西",v:[{city:"巴西"}]},
        {k:"智利",v:[{city:"智利"}]}
    ]

    build(){
        Tabs({barPosition:BarPosition.Start,controller:this.controller}){
            TabContent(){
                Column(){
                    this.myList(this.gangaotai)
                }.height('100%')
                .margin({left:20,top:20})
                .alignItems(HorizontalAlign.Start)
            }.tabBar(this.tabBuild("港澳台",0))
            TabContent(){
                Column(){
                    this.myList(this.yz)
                }.height('100%')
                .margin({left:20,top:20})
                .alignItems(HorizontalAlign.Start)
            }.tabBar(this.tabBuild("亚洲",1))
            TabContent(){
                Column(){
                    this.myList(this.oz)
                }
                .width('100%')
                .height('100%')
                //.backgroundColor(Color.Red)
                .margin({left:20,top:20})
                .alignItems(HorizontalAlign.Start)
            }.tabBar(this.tabBuild("欧洲",2))
            TabContent(){
                Column(){
                    this.myList(this.bmz)
                }.height('100%')
                .margin({left:20,top:20})
                .alignItems(HorizontalAlign.Start)
            }.tabBar(this.tabBuild("北美洲",3))
            TabContent(){
                Column(){
                    this.myList(this.nmz)
                }.height('100%')
                .margin({left:20,top:20})
                .alignItems(HorizontalAlign.Start)
            }.tabBar(this.tabBuild("南美洲",4))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
            TabContent(){Text("")}.tabBar(this.tabBuild("",-1))
        }.vertical(true) //纵向Tabs
        .scrollable(false) //不可以滑动切换
        .animationDuration(0) //动画时长
        .height('95%')
        .barWidth(100)

    }

}