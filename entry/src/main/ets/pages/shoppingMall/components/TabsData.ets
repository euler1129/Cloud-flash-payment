export interface TabsItem {
  icon: Resource;
  iconSelected: Resource;
  text: string;
  topTitle:string;
}

export const TabsList: Array<TabsItem> = [
  {
    icon: $r('app.media.shopping_home'),
    iconSelected: $r('app.media.shopping_home_s'),
    text: '首页',
    topTitle:'云闪付商城'
  },
  {
    icon: $r('app.media.shopping_gold'),
    iconSelected: $r('app.media.shopping_gold_s'),
    text: '贵金属',
    topTitle:'钱币博物馆'
  },
  {
    icon: $r('app.media.shopping_cz'),
    iconSelected: $r('app.media.shopping_cz_s'),
    text: '惠充值',
    topTitle:'神卷神价'
  },
  {
    icon: $r('app.media.shopping_jyh'),
    iconSelected: $r('app.media.shopping_jyh_s'),
    text:'聚优惠',
    topTitle:'聚优惠专区'
  },
  {
    icon: $r('app.media.shopping_mine'),
    iconSelected: $r('app.media.shopping_mine_s'),
    text:'我的',
    topTitle:'我的'
  }
]