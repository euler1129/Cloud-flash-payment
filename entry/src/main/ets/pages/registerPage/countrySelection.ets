import router from '@ohos.router'
@Entry
@Component
struct countrySelection{

   private value: string[] = ['Z','A','B','C','D','E','F',
                              'G','H','J','K','L','M','N',
                              'P','R','S','T','W','X','Y','Z']

   private listScroller:Scroller=new Scroller();
   @State selectIndex:number=0;
   @Builder GroupHeader(k:string){
    Text(k)
      .fontWeight(FontWeight.Bolder)
      .fontColor(Color.Black)
      .fontSize(25)
  }
   @State countryList:object[]=[
      {k:"Z",
        v:[
           { country: "中国" ,tel:"+86"}
          ,{ country: "中国澳门" ,tel:"+853"}
          ,{ country: "中国台湾" ,tel:"+886"}
          ,{ country: "中国香港" ,tel:"+852"}
        ]
      },
     {k:"A",
       v:[
          { country: "阿尔巴尼亚" ,tel:"+355"}
         ,{ country: "阿尔及利亚" ,tel:"+213"}
         ,{ country: "阿富汗" ,tel:"+93"}
         ,{ country: "阿根廷" ,tel:"+54"}
         ,{ country: "阿鲁巴岛" ,tel:"+297"}
         ,{ country: "阿曼" ,tel:"+968"}
         ,{ country: "阿塞拜疆" ,tel:"+994"}
         ,{ country: "阿森松(英)" ,tel:"+247"}
         ,{ country: "埃及" ,tel:"+20"}
         ,{ country: "埃塞俄比亚" ,tel:"+251"}
         ,{ country: "爱尔兰" ,tel:"+353"}
         ,{ country: "爱沙尼亚" ,tel:"+372"}
         ,{ country: "安道尔" ,tel:"+376"}
         ,{ country: "安哥拉" ,tel:"+244"}
         ,{ country: "安圭拉岛(英)" ,tel:"+1264"}
         ,{ country: "安提瓜和巴布达" ,tel:"+1268"}
         ,{ country: "奥地利" ,tel:"+43"}
         ,{ country: "澳大利亚" ,tel:"+61"}
       ]
     },
     {k:"B",
       v:[
          { country: "巴巴多斯" ,tel:"+1246"}
         ,{ country: "巴布亚新几内亚" ,tel:"+675"}
         ,{ country: "巴哈马国" ,tel:"+1242"}
         ,{ country: "巴基斯坦" ,tel:"+92"}
         ,{ country: "巴拉圭" ,tel:"+595"}
         ,{ country: "巴林" ,tel:"+973"}
         ,{ country: "巴拿马" ,tel:"+507"}
         ,{ country: "巴西" ,tel:"+55"}
         ,{ country: "白俄罗斯" ,tel:"+375"}
         ,{ country: "百慕大群岛(英)" ,tel:"+1441"}
         ,{ country: "保加利亚" ,tel:"+359"}
         ,{ country: "贝宁" ,tel:"+229"}
         ,{ country: "比利时" ,tel:"+32"}
         ,{ country: "冰岛" ,tel:"+354"}
         ,{ country: "波多黎各(美)" ,tel:"+1"}
         ,{ country: "波兰" ,tel:"+48"}
         ,{ country: "波斯尼亚和黑塞哥维那" ,tel:"+387"}
         ,{ country: "玻利维亚" ,tel:"+591"}
         ,{ country: "伯利兹" ,tel:"+501"}
         ,{ country: "博茨瓦纳" ,tel:"+267"}
         ,{ country: "不丹" ,tel:"+975"}
         ,{ country: "布基纳法索" ,tel:"+226"}
         ,{ country: "布隆迪" ,tel:"+257"}
       ]
     },
     {k:"C",
       v:[
          { country: "朝鲜" ,tel:"+850"}
         ,{ country: "赤道几内亚" ,tel:"+240"}
       ]
     },
     {k:"D",
       v:[
          { country: "丹麦" ,tel:"+45"}
         ,{ country: "德国" ,tel:"+49"}
         ,{ country: "东萨摩亚(美)" ,tel:"+1684"}
         ,{ country: "多哥" ,tel:"+228"}
         ,{ country: "多米尼加共和国" ,tel:"+1809"}
         ,{ country: "多米尼克国" ,tel:"+1767"}
       ]
     },
     {k:"E",
       v:[
         { country: "俄罗斯" ,tel:"+7"}
         ,{ country: "厄瓜多尔" ,tel:"+593"}
         ,{ country: "厄立特里亚" ,tel:"+291"}
       ]
     },
     {k:"F",
       v:[
         { country: "法国" ,tel:"+33"}
         ,{ country: "法罗群岛(丹)" ,tel:"+298"}
         ,{ country: "法属波里尼西亚" ,tel:"+689"}
         ,{ country: "梵蒂冈" ,tel:"+14397"}
         ,{ country: "菲律宾" ,tel:"+63"}
         ,{ country: "斐济" ,tel:"+679"}
         ,{ country: "芬兰" ,tel:"+358"}
         ,{ country: "佛得角" ,tel:"+238"}
         ,{ country: "福克兰群岛" ,tel:"+500"}
       ]
     },
     {k:"G",
       v:[
          { country: "冈比亚" ,tel:"+220"}
         ,{ country: "刚果" ,tel:"+242"}
         ,{ country: "哥伦比亚" ,tel:"+57"}
         ,{ country: "哥斯达黎加" ,tel:"+506"}
         ,{ country: "格林纳达" ,tel:"+1473"}
         ,{ country: "格陵兰岛" ,tel:"+299"}
         ,{ country: "格鲁吉亚" ,tel:"+995"}
         ,{ country: "古巴" ,tel:"+53"}
         ,{ country: "瓜德罗普岛(法)" ,tel:"+590"}
         ,{ country: "关岛(美)" ,tel:"+1671"}
         ,{ country: "圭亚那" ,tel:"+592"}
       ]
     },
     {k:"H",
       v:[
          { country: "哈萨克斯坦" ,tel:"+7"}
         ,{ country: "海地" ,tel:"+509"}
         ,{ country: "韩国" ,tel:"+82"}
         ,{ country: "荷兰" ,tel:"+31"}
         ,{ country: "荷属安的列斯群岛" ,tel:"+599"}
         ,{ country: "洪都拉斯" ,tel:"+504"}
       ]
     },
     {k:"J",
       v:[
          { country: "基里巴斯" ,tel:"+686"}
         ,{ country: "吉布提" ,tel:"+253"}
         ,{ country: "吉尔吉斯斯坦" ,tel:"+996"}
         ,{ country: "几内亚" ,tel:"+224"}
         ,{ country: "几内亚比绍" ,tel:"+245"}
         ,{ country: "加拿大" ,tel:"+1"}
         ,{ country: "加纳" ,tel:"+233"}
         ,{ country: "加蓬" ,tel:"+241"}
         ,{ country: "柬埔塞" ,tel:"+855"}
         ,{ country: "捷克" ,tel:"+420"}
         ,{ country: "津巴布韦" ,tel:"+263"}
       ]
     },
     {k:"K",
       v:[
          { country: "喀麦隆" ,tel:"+237"}
         ,{ country: "卡塔尔" ,tel:"+974"}
         ,{ country: "开曼群岛(英)" ,tel:"+1345"}
         ,{ country: "科科斯岛" ,tel:"+61"}
         ,{ country: "科克群岛(新)" ,tel:"+682"}
         ,{ country: "科摩罗" ,tel:"+269"}
         ,{ country: "科特迪瓦" ,tel:"+225"}
         ,{ country: "科威特" ,tel:"+965"}
         ,{ country: "克罗地亚" ,tel:"+385"}
         ,{ country: "肯尼亚" ,tel:"+254"}
       ]
     },
     {k:"L",
       v:[
          { country: "拉脱维亚" ,tel:"+371"}
         ,{ country: "莱索托" ,tel:"+266"}
         ,{ country: "老挝" ,tel:"+856"}
         ,{ country: "黎巴嫩" ,tel:"+961"}
         ,{ country: "立陶宛" ,tel:"+370"}
         ,{ country: "利比里亚" ,tel:"+231"}
         ,{ country: "利比亚" ,tel:"+218"}
         ,{ country: "列支敦士登" ,tel:"+423"}
         ,{ country: "留尼汪岛" ,tel:"+262"}
         ,{ country: "卢森堡" ,tel:"+352"}
         ,{ country: "卢旺达" ,tel:"+250"}
         ,{ country: "罗马尼亚" ,tel:"+40"}
       ]
     },
     {k:"M",
       v:[
         { country: "马达加斯加" ,tel:"+261"}
         ,{ country: "马尔代夫" ,tel:"+960"}
         ,{ country: "马耳他" ,tel:"+356"}
         ,{ country: "马拉维" ,tel:"+265"}
         ,{ country: "马来西亚" ,tel:"+60"}
         ,{ country: "马里" ,tel:"+223"}
         ,{ country: "马里亚纳群岛" ,tel:"+1670"}
         ,{ country: "马其顿" ,tel:"+389"}
         ,{ country: "马绍尔群岛" ,tel:"+692"}
         ,{ country: "马提尼克(法)" ,tel:"+596"}
         ,{ country: "马约特岛" ,tel:"+262"}
         ,{ country: "毛里求斯" ,tel:"+230"}
         ,{ country: "毛里塔尼亚" ,tel:"+222"}
         ,{ country: "美国" ,tel:"+1"}
         ,{ country: "蒙古" ,tel:"+976"}
         ,{ country: "蒙特塞拉特岛(英)" ,tel:"+1664"}
         ,{ country: "孟加拉国" ,tel:"+880"}
         ,{ country: "秘鲁" ,tel:"+51"}
         ,{ country: "密克罗尼西亚(美)" ,tel:"+691"}
         ,{ country: "缅甸" ,tel:"+95"}
         ,{ country: "摩尔多瓦" ,tel:"+373"}
         ,{ country: "摩洛哥" ,tel:"+212"}
         ,{ country: "摩纳哥" ,tel:"+377"}
         ,{ country: "莫桑比克" ,tel:"+258"}
         ,{ country: "墨西哥" ,tel:"+52"}
       ]
     },
     {k:"N",
       v:[
         { country: "纳米比亚" ,tel:"+264"}
         ,{ country: "南非" ,tel:"+27"}
         ,{ country: "南斯拉夫" ,tel:"+381"}
         ,{ country: "瑙鲁" ,tel:"+674"}
         ,{ country: "尼加拉瓜" ,tel:"+505"}
         ,{ country: "尼泊尔" ,tel:"+977"}
         ,{ country: "尼日尔" ,tel:"+227"}
         ,{ country: "尼日利亚" ,tel:"+234"}
         ,{ country: "纽埃岛(新)" ,tel:"+683"}
         ,{ country: "挪威" ,tel:"+47"}
         ,{ country: "诺福克岛(澳)" ,tel:"+672"}
       ]
     },
     {k:"P",
       v:[
         { country: "帕劳(美)" ,tel:"+680"}
         ,{ country: "葡萄牙" ,tel:"+351"}
       ]
     },
     {k:"R",
       v:[
         { country: "日本" ,tel:"+81"}
         ,{ country: "瑞典" ,tel:"+46"}
         ,{ country: "瑞士" ,tel:"+41"}
       ]
     },
     {k:"S",
       v:[
          { country: "萨尔瓦多" ,tel:"+503"}
         ,{ country: "塞拉利昂" ,tel:"+232"}
         ,{ country: "塞内加尔" ,tel:"+221"}
         ,{ country: "塞浦路斯" ,tel:"+357"}
         ,{ country: "塞舌尔" ,tel:"+248"}
         ,{ country: "桑给巴尔" ,tel:"+259"}
         ,{ country: "沙特阿拉伯" ,tel:"+966"}
         ,{ country: "圣诞岛" ,tel:"+61"}
         ,{ country: "圣多美和普林西比" ,tel:"+239"}
         ,{ country: "圣赫勒拿" ,tel:"+290"}
         ,{ country: "圣克里斯托弗和尼维斯" ,tel:"+1869"}
         ,{ country: "圣卢西亚" ,tel:"+1758"}
         ,{ country: "圣马力诺" ,tel:"+378"}
         ,{ country: "圣皮埃尔岛及密克隆岛" ,tel:"+508"}
         ,{ country: "圣文森特岛(英)" ,tel:"+1784"}
         ,{ country: "斯里兰卡" ,tel:"+94"}
         ,{ country: "斯洛伐克" ,tel:"+421"}
         ,{ country: "斯洛文尼亚" ,tel:"+386"}
         ,{ country: "斯威士兰" ,tel:"+268"}
         ,{ country: "苏丹" ,tel:"+249"}
         ,{ country: "苏里南" ,tel:"+597"}
         ,{ country: "所罗门群岛" ,tel:"+677"}
         ,{ country: "索马里" ,tel:"+252"}
       ]
     },
     {k:"T",
       v:[
          { country: "塔吉克斯坦" ,tel:"+992"}
         ,{ country: "泰国" ,tel:"+66"}
         ,{ country: "坦桑尼亚" ,tel:"+255"}
         ,{ country: "汤加" ,tel:"+676"}
         ,{ country: "特克斯和凯科斯群岛(英)" ,tel:"+1649"}
         ,{ country: "特立尼达和多巴哥" ,tel:"+1868"}
         ,{ country: "突尼斯" ,tel:"+216"}
         ,{ country: "图瓦卢" ,tel:"+688"}
         ,{ country: "土耳其" ,tel:"+90"}
         ,{ country: "土库曼斯坦" ,tel:"+993"}
       ]
     },
     {k:"W",
       v:[
         { country: "瓦努阿图" ,tel:"+678"}
         ,{ country: "危地马拉" ,tel:"+502"}
         ,{ country: "维尔京群岛(英)" ,tel:"+1340"}
         ,{ country: "委内瑞拉" ,tel:"+58"}
         ,{ country: "乌干达" ,tel:"+256"}
         ,{ country: "乌克兰" ,tel:"+380"}
         ,{ country: "乌拉圭" ,tel:"+598"}
         ,{ country: "乌兹别克斯坦" ,tel:"+998"}
       ]
     },
     {k:"X",
       v:[
          { country: "西班牙" ,tel:"+34"}
         ,{ country: "西萨摩亚" ,tel:"+685"}
         ,{ country: "希腊" ,tel:"+30"}
         ,{ country: "新加坡" ,tel:"+65"}
         ,{ country: "新喀里多尼亚群岛(法)" ,tel:"+687"}
         ,{ country: "新西兰" ,tel:"+64"}
         ,{ country: "匈牙利" ,tel:"+36"}
         ,{ country: "叙利亚" ,tel:"+963"}
       ]
     },
     {k:"Y",
       v:[
         { country: "牙买加" ,tel:"+1876"}
         ,{ country: "亚美尼亚" ,tel:"+374"}
         ,{ country: "也门" ,tel:"+967"}
         ,{ country: "伊拉克" ,tel:"+964"}
         ,{ country: "伊郎" ,tel:"+98"}
         ,{ country: "以色列" ,tel:"+972"}
         ,{ country: "意大利" ,tel:"+39"}
         ,{ country: "印度" ,tel:"+91"}
         ,{ country: "印度尼西亚" ,tel:"+62"}
         ,{ country: "英国" ,tel:"+44"}
         ,{ country: "英国" ,tel:"+44"}
         ,{ country: "约旦" ,tel:"+962"}
         ,{ country: "越南" ,tel:"+84"}
       ]
     },
     {k:"Z",
       v:[
          { country: "赞比亚" ,tel:"+260"}
         ,{ country: "乍得" ,tel:"+235"}
         ,{ country: "直布罗陀(英)" ,tel:"+350"}
         ,{ country: "智利" ,tel:"+56"}
         ,{ country: "中非" ,tel:"+236"}
       ]
     }
   ]

   build(){
       Column(){
          Row(){
            Image($r('app.media.ic_back'))
              .width(30)
              .height(30)
              .margin({right:80})
              .onClick(()=>{
                  router.back();
              })
            Text("选择国家/地区")
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
          }.width('94%')
          .justifyContent(FlexAlign.Start)
          .margin({top:15})

         Stack({alignContent:Alignment.TopEnd}){
           List({space:15,scroller:this.listScroller}){
             ForEach(this.countryList,(CountryItem)=>{
               ListItemGroup({header:this.GroupHeader(CountryItem.k)})
               {
                 ForEach(CountryItem.v,(item)=>{
                   ListItem(){
                     Row(){
                       Text(item.country)
                         .fontSize(20)
                         .fontColor(Color.Gray)
                       Text(item.tel)
                         .fontSize(20)
                         .fontColor(Color.Gray)
                     }.width('100%')
                     .padding({top:5,right:30})
                     .justifyContent(FlexAlign.SpaceBetween)
                     .onClick(()=>{
                       globalThis.country=item.country;
                       globalThis.tel=item.tel;
                       router.back({
                          url:'pages/registerPage/register'
                       })
                     })
                   }
                 },(item)=>{
                   return item.country;
                 })
               }
             },(CountryItem,index)=>{
               return index+""})
           }
           .margin({left:10,top:10,bottom:50})
           .edgeEffect(EdgeEffect.Fade) //滑动效果
           .onScrollIndex((index:number)=>{
             this.selectIndex=index;
           })

           AlphabetIndexer({arrayValue:this.value,selected:0 })
             .selected(this.selectIndex) //设置选中项索引值。
             .margin({top:15})
             .onSelect((index:number)=>{
               this.listScroller.scrollToIndex(index)
               console.log("index="+index);
             })
         }
       }
        .width('100%')
        .height('100%')
   }
}