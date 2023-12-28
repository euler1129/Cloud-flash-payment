import router from '@ohos.router';

@Component
	//优惠页面
export struct preferential {

	@StorageLink('currentCity') @Watch('watchCurrentCardNum') currentCity1: string = '';
	watchCurrentCardNum() {
		this.city= this.currentCity1 ||"上海"

	}
	@State city:string="上海";

	aboutToAppear(){
		this.load();
	}

	load() {
		setInterval(() => {
			if (this.mySearchValue != '') {
				this.time = -1;
			} else {
				if (this.time == 3) {
					this.mySearchPlaceholder = "汇率优惠"
				} else if (this.time == 2) {
					this.mySearchPlaceholder = "校园超市"
				} else if (this.time == 1) {
					this.mySearchPlaceholder = "星巴克满减20元"
				}
				this.time--;
				if (this.time == 0) {
					this.time = 3;
				}
			}
		}, 3000)


	}

	//快捷登入
	@State item_shortcuts: object[] = [
		{ name: "银联优惠日", icon: $r("app.media.dis_UnionPay") },
		{ name: "神眷必购", icon: $r("app.media.dis_goodScroll") },
		{ name: "限时秒杀", icon: $r("app.media.dis_limitedtime") },
		{ name: "微信福利", icon: $r("app.media.dis_weChat") },
		{ name: "餐饮优惠", icon: $r("app.media.dis_dining") }
	]
	//推荐
	@State item_recommend: object[] = [
		{ Key: 1, title: "满100减30", add_title: "来伊份上海市制..." },
		{ Key: 2, title: "满30元享8折", add_title: "仅限京东、美团..." },
		{ Key: 3, title: "满30元减6元", add_title: "制定门店" }
	]

	//搜索框
	@State time: number = 3;
	@State mySearchPlaceholder: string = "汇率优惠";
	@State mySearchValue: string = ''
	@State fontColor: string = '#182431'
	@State selectedFontColor: string = '#007DFF'
	@State currentIndex: number = 0
	@State currentIndex1: number = 0
	private controller: TabsController = new TabsController()
	scroller: Scroller = new Scroller()

	@Builder TabBuilder(index: number, name: string) {
		Column() {
			Text(name)
				.fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
				.fontSize(16)
				.fontWeight(this.currentIndex === index ? 500 : 400)
				.lineHeight(22)
				.margin({ top: 17, bottom: 7 })
			Divider()
				.strokeWidth(2)
				.color('#FF9396')
				.opacity(this.currentIndex === index ? 1 : 0)
		}.width('100%')
	}



	build() {
		Scroll() {
			Column() {
				//头部
				Column() {
					Row() {
						//城市切换
						Row() {
							Text(`${this.city}`)
								.fontColor(Color.White)
								.fontSize(20)
							Image($r("app.media.arrow_white_down"))
								.width('50%')
								.height('10%')
						}.width('15%')
						.justifyContent(FlexAlign.Start)
						.onClick(() => {
							router.pushUrl({
								url: "pages/preferentialPage/citySelection"
							})
						})
						//.backgroundColor(Color.Blue)
						//搜索框
						Search({ placeholder: this.mySearchPlaceholder, value: this.mySearchValue })
							.searchButton("搜索")
							.placeholderColor(Color.White)
							.width("65%")
							.height(40)
						//按钮
						Button() {
							Image($r("app.media.applet_wallet_change")).width(25)
						}.width("10%").backgroundColor('transparent')
						//按钮
						Button() {
							Image($r("app.media.add_white")).width(25)
						}.width("10%").backgroundColor('transparent')
					}
					.width('100%')
					.height(50)
					.justifyContent(FlexAlign.SpaceBetween)
					.alignItems(VerticalAlign.Center)
					.margin({ top: 10 })

					Row() {
						Column() {
							Row() {
								Text("已省")
									.fontSize(16)
									.fontWeight(FontWeight.Bolder)
									.fontStyle(FontStyle.Italic)
								Text("开62VPN省更多")
									.fontSize(14)
									.fontWeight(FontWeight.Bolder)
									.fontStyle(FontStyle.Italic)
									.fontColor(Color.White)
									.backgroundColor(Color.Blue)
							}

							Text("￥9999999".replace(/(\d)(?=(?:\d{3})+$)/g, '$1,'))
						}.justifyContent(FlexAlign.SpaceBetween)
						.height("60%")
						.margin({ right: 5 })

						Column() {
							Text("优惠券").fontSize(18)
							Text("100")
						}.justifyContent(FlexAlign.SpaceBetween)
						.height("60%")

						Column() {
							Text("可用红包").fontSize(18)
							Text("￥8888.88".replace(/(\d{1,3})(?=(\d{3})+(?:\.))/g, '$1,'))
						}.justifyContent(FlexAlign.SpaceBetween)
						.height("60%")

						Column() {
							Text("可用积点").fontSize(18)
							Text("1234".replace(/(\d{1,3})(?=(\d{3}))/g, '$1,'))
						}.justifyContent(FlexAlign.SpaceBetween)
						.height("60%")
					}
					.width('95%')
					.height(80)
					.alignItems(VerticalAlign.Top)
					.justifyContent(FlexAlign.SpaceBetween)
					.backgroundColor(Color.White)
					.borderRadius(10)
					.border({ width: { top: "2px" }, color: { top: Color.Gray } })
					//.border({width:"5px",color:Color.Black})
					.margin({ top: 10 })
				}
				.width('100%')
				.height(100)
				.justifyContent(FlexAlign.SpaceBetween)
				.backgroundImage($rawfile('pre_topred_bg.png'), ImageRepeat.NoRepeat)
				.backgroundImageSize({ width: "100%" })

				//快捷功能入库区
				Row() {
					List() {
						ForEach(this.item_shortcuts, (item) => {
							ListItem() {
								Column() {
									Image(item.icon)
										.height(50)
										.width(50)
									Text(item.name)
										.fontSize(14)
										.fontWeight(FontWeight.Bold)

								}.height("100%")
								.width("20%")
								.alignItems(HorizontalAlign.Center)
								.justifyContent(FlexAlign.SpaceEvenly)
							}
						}, (item, index) => {
							return index + ""
						})
					}.listDirection(Axis.Horizontal)
					.width("100%")
				}
				.justifyContent(FlexAlign.SpaceBetween)
				.height(100)
				.width('95%')
				.margin({ top: 50 })

				//轮播
				Row() {
					Swiper() {
						Image($r("app.media.pre_1"))
						Image($r("app.media.pre_2"))
						Image($r("app.media.pre_3"))
						Image($r("app.media.pre_4"))
					}
					.autoPlay(true)
					.interval(5000)
					.vertical(false) //是否为纵向滑动。
					.loop(true)
					.indicator(true) //是否启用导航点指示器。
					.indicatorStyle({
						selectedColor: Color.Red,
						color: Color.Gray,
						mask: true,
						size: 20
					})
				}.justifyContent(FlexAlign.SpaceBetween)
				.height(100)
				.width('95%')
				.margin({ top: 20 })

				//推荐
				Column() {
					Row() {
						Text("熱門優惠")
							.fontSize(25)
							.fontWeight(FontWeight.Bold)
						Button("更多 >")
							.backgroundColor(Color.White)
							.fontSize(18)
							.fontColor(Color.Gray)

					}.justifyContent(FlexAlign.SpaceBetween)
					.width("100%")
					.height(40)
					.margin({ top: 10, bottom: 10 })

					Row() {
						List() {
							ForEach(this.item_recommend, (item) => {
								ListItem() {
									Column() {
										Row() {
											Text(item.title)
												.fontColor(Color.Red)
												.fontSize(18)
												.fontWeight(FontWeight.Normal)
												.margin({ top: 5 })
										}.width("100%")
										.height(70)
										.alignItems(VerticalAlign.Top)
										.justifyContent(FlexAlign.Start)

										Row() {
											Text(item.add_title)
												.fontColor(Color.Gray)
												.fontSize(14)
										}.width("100%")
										.height(20)
										.alignItems(VerticalAlign.Center)
										.justifyContent(FlexAlign.Start)

										Divider();
										Row() {
											Image($r('app.media.item_icon'))
												.width('20%')
												.height('40%')
											Text("中国银联")
												.fontColor(Color.Gray)
												.margin({ left: 5 })
										}.width("100%")
										.height(40)
										.justifyContent(FlexAlign.Start)

									}
									.height("100%")
									.width("31%")
									.backgroundColor(Color.White)
									.margin(2)
									.justifyContent(FlexAlign.SpaceBetween)
								}
							}, (item, index) => {
								return index + ""
							})
						}.listDirection(Axis.Horizontal) //横向
					}
					.justifyContent(FlexAlign.SpaceEvenly)
					.width("100%")
					.height(130)
					//.backgroundColor(Color.Red)
				}
				.alignItems(HorizontalAlign.Center)
				.height(210)
				.width('95%')
				.margin({ top: 20 })
				.linearGradient({
					direction: GradientDirection.Right
				, colors: [['rgb(227,180,147)', 0.2], ['rgb(255,210,190)', 0.8], ['rgb(255,211,206)', 1.0]]
				})

				Row() {
					Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
						TabContent() {
							Column() {
								Row() {
									Column() {
										Text('精选').fontSize(10).fontWeight(400).margin({ top: 5 }).fontColor('#ED171F')
										Text('享海量优惠').fontSize(8).fontWeight(400).fontColor('#ED171F')
									}.size({ width: 60, height: 37 }).backgroundColor('#FFFAEE')

									Column() {
										Text('美食').fontSize(10).fontWeight(400).margin({ top: 5 })
										Text('美食大放价').fontSize(8).fontWeight(400)
									}.size({ width: 60, height: 37 }).backgroundColor('#FFFAEE')

									Column() {
										Text('购物').fontSize(10).fontWeight(400).margin({ top: 5 })
										Text('双十二大促').fontSize(7).fontWeight(400)
									}.size({ width: 60, height: 37 }).backgroundColor('#FFFAEE')

									Column() {
										Text('生活').fontSize(10).fontWeight(400).margin({ top: 5 })
										Text('享受生活').fontSize(8).fontWeight(400)
									}.size({ width: 60, height: 37 }).backgroundColor('#FFFAEE')
								}.size({ width: '100%', height: 37 }).justifyContent(FlexAlign.SpaceAround)

								Column() {
									Row() {
										Image($rawfile('pre_select_ad01.png')).width(159).height(212)
										Image($rawfile('pre_select_ad02.png')).width(159).height(212).margin({ left: 10 })
									}.width('100%').height(212).justifyContent(FlexAlign.SpaceAround)

									Row() {
										Column() {
											Image($rawfile('pre_select_ad03.png')).width(159).height(212)
											Text('建行商户消费季超市满60').fontColor('#141414').fontSize(12).fontWeight(700)
											Text('元减25元').fontColor('#141414').fontSize(12).fontWeight(700)
											Row() {
												Image($r('app.media.yinlian')).size({ height: 8, width: 6 })
												Text('中国银联').lineHeight(18).fontSize(10).fontWeight(400)
											}.width('80%')
										}.width('48%')
										Column() {
											Image($rawfile('pre_select_ad04.png')).width(159).height(212)
											Text('建行商户消费季超市满60').fontColor('#141414').fontSize(12).fontWeight(700)
											Text('元减25元').fontColor('#141414').fontSize(12).fontWeight(700)
											Row() {
												Image($r('app.media.yinlian')).size({ height: 8, width: 6 })
												Text('￥9.9').lineHeight(18).fontSize(14).fontWeight(400).fontColor('#ED171F')
											}.width('80%')
										}.width('48%')
									}.width('100%').height(260).justifyContent(FlexAlign.SpaceAround).margin({top:10})
								}
							}.height('100%')

						}.tabBar(this.TabBuilder(0, '推荐')).height('100%')

						TabContent() {

						}.tabBar(this.TabBuilder(1, '商家'))

					}
					.vertical(false)
					.barMode(BarMode.Fixed)
					.barWidth('100%')
					.barHeight(56)
					.animationDuration(400)
					.onChange((index: number) => {
						this.currentIndex = index
					})
				}.size({ width: '100%', height: '100%' }).margin({left:16})

			}.width("100%")


		}
		.backgroundColor(' #F5F5F5')
		.width("100%")
		.scrollable(ScrollDirection.Vertical) //仅支持竖直方向滚动。
		.scrollBar(BarState.Auto) //设置滚动条状态
		.edgeEffect(EdgeEffect.Spring) //设置滑动效果
	}
}