/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { PullToRefresh, PullToRefreshConfigurator } from '@ohos/pulltorefresh'
import BigImageSwiper from './BigImageSwiper'
import {CardContent,ImageRelative} from './CardContent'
import Carousel from './Carousel'
import ContentSwiper from './ContentSwiper'
import Header,{HeaderSelect} from './Header'

@Observed
export class ControllSwitch{
  controller:TabsController

  constructor(controller:TabsController) {
    this.controller=controller;
  }
}

//@Entry
@Component
export default  struct RefreshImage {
  @State  refreshText: string = '';
  private dataNumbers: string[] = ['1'];
  private dataStrings: string[] = ['我的评论'];
  @State  data: string[] = this.dataStrings;
  private scroller: Scroller = new Scroller();
  private refreshConfigurator: PullToRefreshConfigurator = new PullToRefreshConfigurator();
  @ObjectLink controller: ControllSwitch
  @Link currentIndex: number

  aboutToAppear() {
    // 设置属性
    this.refreshConfigurator
      .setHasRefresh(true) // 是否具有下拉刷新功能
      .setHasLoadMore(true) // 是否具有上拉加载功能
      .setMaxTranslate(150) // 可下拉上拉的最大距离
      .setSensitivity(12) // 下拉上拉灵敏度
      .setListIsPlacement(false) // 滑动结束后列表是否归位
      .setAnimDuration(300) // 滑动结束后，回弹动画执行时间
      .setRefreshHeight(80) // 下拉动画高度
      .setRefreshColor('#ff0000') // 下拉动画颜色
      //.setRefreshBackgroundColor('#ffbbfaf5') // 下拉动画区域背景色
      //.setRefreshTextColor('red') // 下拉加载完毕后提示文本的字体颜色
      //.setRefreshTextSize(25) // 下拉加载完毕后提示文本的字体大小
      .setRefreshAnimDuration(1000) // 下拉动画执行一次的时间
      .setLoadImgHeight(50) // 上拉图片高度
      .setLoadBackgroundColor('#F5F5F5') // 上拉动画区域背景色
      .setLoadTextColor('#141414') // 上拉文本的字体颜色
      //.setLoadTextSize(25) // 上拉文本的字体大小
      //.setLoadTextPullUp1('请继续上拉...') // 上拉1阶段文本
      //.setLoadTextPullUp2('释放即可刷新') // 上拉2阶段文本
      .setLoadTextLoading('继续上滑进入优惠') // 上拉加载更多中时的文本
  }

  build() {
    Column() {
      HeaderSelect()
      PullToRefresh({
        // 必传项，列表组件所绑定的数据
        data: $data,
        // 必传项，需绑定传入主体布局内的列表或宫格组件
        scroller: this.scroller,
        // 必传项，自定义主体布局，内部有列表或宫格组件
        customList: () => {
          // 一个用@Builder修饰过的UI方法
          this.getListView();
        },
        // 可选项，组件属性配置，具有默认值
        refreshConfigurator: this.refreshConfigurator,
        // 可选项，容器宽，默认自适应
        mWidth: '100%',
        // 可选项，容器高，默认自适应
        mHeight: '90%',
        // 可选项，下拉刷新回调
        onRefresh: () => {
          return new Promise<string>((resolve, reject) => {
            // 模拟网络请求操作，请求网络2秒后得到数据，通知组件，变更列表数据
            setTimeout(() => {
              resolve('刷新成功');
              this.data = this.dataNumbers;
            }, 2000);
          });
        },
        // 可选项，上拉加载更多回调
        onLoadMore: () => {
          return new Promise<string>((resolve, reject) => {
            // 模拟网络请求操作，请求网络2秒后得到数据，通知组件，变更列表数据
            setTimeout(() => {
              resolve('');
              this.currentIndex=1;
              this.controller.controller.changeIndex(1);
              //this.data.push("增加的条目" + this.data.length);
            }, 2000);
          });
        },
        customLoad: null,
        customRefresh: null,
      })
    }
    .width('100%')
  }

  @Builder
  private getListView() {
    List({  scroller: this.scroller }) {
      ForEach(this.data, (item: string) => {
        ListItem() {
          Column() {
            Header();
            ContentSwiper();
            BigImageSwiper()
            CardContent()
            ImageRelative()
            Carousel()
          }
          .width('100%').backgroundColor('#F5F5F5')
        }
      })
    }
    .divider({ strokeWidth: 1, color: 0x222222 })
    .edgeEffect(EdgeEffect.None) // 必须设置列表为滑动到边缘无效果
  }
}