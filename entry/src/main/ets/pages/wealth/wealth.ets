import image from '@ohos.multimedia.image'
@Entry
@Component
export default struct Wealth {
	@State arr: any[] = [
		{ icon: $r('app.media.current'), index: '0', tittle: '活期' },
		{ icon: $r('app.media.fund'), index: '1', tittle: '基金' },
		{ icon: $r('app.media.financial'), index: '2', tittle: '稳健理财' },
		{ icon: $r('app.media.Regular_selection'), index: '3', tittle: '定期精选' },
		{ icon: $r('app.media.loan'), index: '4', tittle: '借款' },
		{ icon: $r('app.media.Loan_Selection'), index: '5', tittle: '贷款精选' },
		{ icon: $r('app.media.Small_loans'), index: '6', tittle: '小微贷' },
		{ icon: $r('app.media.credit'), index: '7', tittle: '财富.借贷' },
		{ icon: $r('app.media.1'), index: '8', tittle: '个人养老金' },
		{ icon: $r('app.media.whole'), index: '9', tittle: '全部' },
	]
	@State arr1: any[] = [1, 2, 3, 4]
	@State state: boolean = true
	@State fontColor: string = '#182431'
	@State selectedFontColor: string = '#007DFF'
	@State currentIndex: number = 0
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
		Column() {
			List() {
				ListItem() {
					Column() {
						Column() {
							Row() {
								Column() {
									Row() {
										Text('金融卡总额 (元) ').fontSize(12).fontWeight(400).lineHeight(20)
										Image($r('app.media.i_eye')).size({ width: 20, height: 20 }).onClick(() => {
											this.state = !this.state
										})
									}

									Row() {
										Text('****').fontSize(20).visibility(this.state == true ? Visibility.Visible : Visibility.None)
										Text('100,000,00')
											.fontSize(20)
											.visibility(this.state == true ? Visibility.None : Visibility.Visible)
									}
								}.width('50%')

								Column() {
									Row() {
										Text('持仓总额').fontSize(12).fontWeight(400).lineHeight(20)
									}

									Row() {
										Text('****').fontSize(20).visibility(this.state == true ? Visibility.Visible : Visibility.None)
										Text('100,000,00')
											.fontSize(20)
											.visibility(this.state == false ? Visibility.Visible : Visibility.None)
									}
								}.width('50%')
							}.justifyContent(FlexAlign.SpaceBetween).width('100%')

							Row() {
								Column() {
									Row() {
										Text('信用卡待还').fontSize(12).fontWeight(400).lineHeight(20)
									}

									Blank()
									Row({}) {
										Text('****')
											.fontSize(20)
											.fontSize(20)
											.visibility(this.state == true ? Visibility.Visible : Visibility.None)
										Text('0,00')
											.fontSize(20)
											.fontSize(20)
											.visibility(this.state == false ? Visibility.Visible : Visibility.None)
									}
								}.width('50%')

								Column() {
									Row() {
										Text('最高可借').fontSize(12).fontWeight(400).lineHeight(20)
									}

									Row() {
										Text('****').fontSize(20).visibility(this.state == true ? Visibility.Visible : Visibility.None)
										Text('100,000,00')
											.fontSize(20)
											.visibility(this.state == false ? Visibility.Visible : Visibility.None)

									}
								}.width('50%')
							}.justifyContent(FlexAlign.SpaceBetween).margin({ top: 10 })
						}.width(328).backgroundImage($rawfile('wealth_topbg.png'))
						.backgroundImageSize({ width: '100%' }).margin({ top: 57 })
					}.width('100%').backgroundImage($rawfile('Union.png')).height(160)
					.backgroundImageSize({ width: '100%' })
				}

				ListItem() {
					Grid() {
						ForEach(this.arr, item => {
							GridItem() {
								Column() {
									Image(item.icon).size({ width: 32, height: 32 })
									Text(item.tittle).fontSize(12).fontWeight(700).margin({ top: 5 })
								}
							}
						}, item => item.index)
					}.columnsTemplate('1fr 1fr 1fr 1fr 1fr').margin({ top: 40 }).height(130)
				}

				ListItem() {
					Column() {
						Text('金融助手').fontSize(26).margin({ left: 10, top: 10 })
						Text('能赚又能花，立即转入活期+').fontSize(16).margin({ left: 10, top: 10 })
						Swiper() {
							Image($rawfile('zhushou.png')).width('100%')
							Image($rawfile('zhushou.png')).width('100%')
						}
						.size({ width: 298, height: 205 })
						.autoPlay(true)
						.interval(3000)
						.duration(2000)
						.indicatorStyle()
					}
					.width('100%')
					.height(294)
					.alignItems(HorizontalAlign.Center)
					.margin({ left:10,right:10, top: 10 })
					.backgroundImage($rawfile('fortune_financial_assistant.png'), ImageRepeat.NoRepeat)
					.backgroundImageSize({ width: '100%' })
					.opacity(1)
				}

				ListItem() {
					Text('精选推荐').fontSize(16).fontWeight(700)
				}.margin({ left: 16, top: 10 })

				ListItem() {
					List({ space: 20 }) {
						ForEach(this.arr1, item => {
							ListItem() {
								Column() {
									Image($rawfile('兑换_01.png')).width(180).height(93).margin({ left: 16, top: 10 })
									Column() {
										Row() {
											Text('中银季季90天滚动持有').fontSize(12).fontWeight(700)
											Text('01229').margin({ left: 13 }).fontSize(12).fontWeight(400).fontColor(' #14141440')
											Button('立即申购').onClick((event: ClickEvent) => {
											}).size({ width: 68, height: 24 }).borderRadius(20).margin({ left: 10 })
										}.margin({ top: 10, left: 10 })

										Row({ space: 10 }) {
											Text('中低风险')
												.size({ width: 60, height: 16 })
												.backgroundColor('#F2610F')
												.fontSize(10)
												.fontColor('#F78C0F')
												.textAlign(TextAlign.Center)
												.margin({ left: 16 })
											Text('双将执管')
												.size({ width: 60, height: 16 })
												.backgroundColor('#F2610F')
												.fontSize(10)
												.fontColor('#F78C0F')
												.textAlign(TextAlign.Center)
										}

										Row() {
											Text('盈利能力优于99%同类')
												.fontColor('#ED171F')
												.fontSize(18)
												.fontWeight(700)
												.margin({ left: 16, top: 5 })
										}

										Row() {
											Text('0申购率|纯债策略,利率中短债')
												.fontColor('#14141473')
												.margin({ left: 16 })
												.fontSize(10)
												.fontWeight(400)
										}.margin({ top: 5 })
									}
									.size({ width: 270, height: 115 })
									.margin({ left: 10, top: 15 })
									.justifyContent(FlexAlign.Start)
									.alignItems(HorizontalAlign.Start)
									.backgroundColor('#FFF')
									.borderRadius(12)

									Row() {
										Text('数据来源于Wind,截至至2023年23月6日')
											.fontSize(8)
											.fontWeight(400)
											.fontColor('#14141440')
											.size({ width: 141, height: 18 })
											.textAlign(TextAlign.Center
											)
									}.width('100%').margin({ top: 15 }).justifyContent(FlexAlign.Center)
								}.width('100%').height('100%').justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
							}.margin({ left: 16, top: 10 })
							.size({ width: 290, height: 276 })
							.backgroundImage($rawfile('selected_ad_bg.png'))
							.backgroundImageSize({ width: '100%' })

						}, item => item)
					}
					.listDirection(Axis.Horizontal)
					.divider({ strokeWidth: 2, startMargin: 20, endMargin: 20 })
				}

				ListItem() {
					Row() {
						Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
							TabContent() {
								Column() {
									Image($rawfile('Earnings_gains.png'))
								}.size({ width: '100%', height: '100%' }).backgroundImage($rawfile('selected_bg(1).png'))
							}.size({ width: 328, height: 350 }).tabBar(this.TabBuilder(0, '零钱收益'))

							TabContent() {
								Column() {
									Image($rawfile('Earnings_gains.png'))
								}.size({ width: 328, height: 350 }).backgroundImage($rawfile('selected_bg(1).png'))
							}.tabBar(this.TabBuilder(1, '稳健精选'))

							TabContent() {
								Column() {
									Image($rawfile('Earnings_gains.png'))
								}.size({ width: 328, height: 350 }).backgroundImage($rawfile('selected_bg(1).png'))
							}.tabBar(this.TabBuilder(2, '进击攀升'))
						}
						.vertical(false)
						.barMode(BarMode.Fixed)
						.barWidth('100%')
						.barHeight(56)
						.animationDuration(400)
						.onChange((index: number) => {
							this.currentIndex = index
						})
					}.size({ width: '90%' })

				}.width('98%').height(400)

				ListItem() {
					Text('精选信贷').fontSize(16).fontWeight(700)
				}.margin({ left: 16, top: 20, bottom: 20 })

				ListItem() {
					Column() {
						Column() {
							Text('已为9000万用户解决资金难题')
								.width('100%')
								.textAlign(TextAlign.End)
								.margin({ top: 20, right: 8 })
								.fontSize(10)
								.fontWeight(400)
								.fontColor('#141414')
						}
						.backgroundImage($rawfile('selected_bg@2x(2).png'), ImageRepeat.NoRepeat)
						.backgroundImageSize({ width: '100%', height: '100%' })
						.size({ width: 328, height: 128 })

						Row({ space: 10 }) {
							Column() {
								Row() {
									Text('信秒贷').fontSize(12).fontWeight(700).fontColor('#2A3B5D')
									Text('中信银行提供')
										.fontSize(10)
										.fontWeight(400)
										.fontColor('#f78c0f')
										.backgroundColor('#F2610F')
										.margin({ left: 10 })

								}

								Row() {
									Text('最高额度').fontSize(16).fontWeight(700).fontColor('#141414')
									Text('30万').fontSize(16).fontWeight(700).fontColor(Color.Red)
								}
								.margin({ top: 5 })

								Row() {
									Text('年化利率4.35%起').fontSize(10).fontWeight(400).fontColor('#141414')
								}.margin({ top: 10 })
							}.size({ width: 159, height: 92 })
							.borderRadius(10).backgroundColor('#FFF')
							.padding(10)

							Column() {
								Row() {
									Text('航旅贷').fontSize(12).fontWeight(700).fontColor('#2A3B5D')
									Text('华润银行提供')
										.fontSize(10)
										.fontWeight(400)
										.fontColor('#f78c0f')
										.backgroundColor('#F2610F')
										.margin({ left: 10 })

								}

								Row() {
									Text('最高额度').fontSize(16).fontWeight(700).fontColor('#141414')
									Text('20万').fontSize(16).fontWeight(700).fontColor(Color.Red)
								}
								.margin({ top: 5 })

								Row() {
									Text('年化利率5.00%起').fontSize(10).fontWeight(400).fontColor('#141414')
								}.margin({ top: 10 })
							}.size({ width: 159, height: 92 })
							.borderRadius(10).backgroundColor('#FFF')
							.padding(10)

						}.margin({ top: 10 })
					}
				}.margin({ left: 16 })

				ListItem() {
					Row() {
						Text('财富资讯').fontSize(16).fontWeight(700).width('50%')
						Text('更多')
							.fontSize(12)
							.fontWeight(400)
							.fontColor('#14141473')
							.padding({ right: 10 })
							.width('50%')
							.textAlign(TextAlign.End)
					}

				}.margin({ left: 16, top: 20, bottom: 10 }).width('95%')

				ListItem() {
					Row() {
						Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
							TabContent() {
								Column() {
									Image($rawfile('wealth_ad.png')).width('100%')
									Row({ space: 10 }) {
										Image($rawfile('wealth_list.png')).width(70).height(50).margin({ top: 5, bottom: 5 })
										Column() {
											Text('这些基金连续5年正收益')
												.fontSize(12)
												.fontWeight(700)
												.width('100%')
												.lineHeight(20)
												.textAlign(TextAlign.Start)
											Text('12-18 17:58')
												.fontSize(10)
												.fontWeight(400)
												.fontColor('#14141473')
												.width('100%')
												.textAlign(TextAlign.Start)
												.margin({ top: 20, left: 5 })
										}.width(145)
									}.size({ width: '100%', height: 61 }).margin({ top: 10, left: 16 })

									Row({ space: 10 }) {
										Image($rawfile('wealth_list.png')).width(70).height(50).margin({ top: 5, bottom: 5 })
										Column() {
											Text('窄幅震荡，三大指数收跌！')
												.fontSize(12)
												.fontWeight(700)
												.width('100%')
												.lineHeight(20)
												.textAlign(TextAlign.Start)
											Text('12-18 17:58')
												.fontSize(10)
												.fontWeight(400)
												.fontColor('#14141473')
												.width('100%')
												.textAlign(TextAlign.Start)
												.margin({ top: 20, left: 5 })
										}.width(145)
									}.size({ width: '100%', height: 61 }).margin({ top: 10, left: 16 })

									Row({ space: 10 }) {
										Image($rawfile('wealth_list.png')).width(70).height(50).margin({ top: 5, bottom: 5 })
										Column() {
											Text('我最偏爱的3种基金')
												.fontSize(12)
												.fontWeight(700)
												.width('100%')
												.lineHeight(20)
												.textAlign(TextAlign.Start)
											Text('12-18 17:58')
												.fontSize(10)
												.fontWeight(400)
												.fontColor('#14141473')
												.width('100%')
												.textAlign(TextAlign.Start)
												.margin({ top: 20, left: 5 })
										}.width(145)
									}.size({ width: '100%', height: 61 }).margin({ top: 10, left: 16 })

									Button() {
										Text('查看更多>').fontSize(10).fontWeight(400).fontColor('#14141440')
									}.onClick(() => {
									}).margin({ top: 10 }).size({ width: 72, height: 20 }).backgroundColor('#FFF')
								}.size({ width: '100%', height: '100%' })
							}.size({ width: 328, height: 350 }).tabBar(this.TabBuilder(0, '热点咨询'))

							TabContent() {
								Column() {
									Image($rawfile('Earnings_gains.png'))
								}.size({ width: 328, height: 350 }).backgroundImage($rawfile('selected_bg(1).png'))
							}.tabBar(this.TabBuilder(1, '行情解读'))

							TabContent() {
								Column() {

									Image($rawfile('Earnings_gains.png'))
								}.size({ width: 328, height: 350 }).backgroundImage($rawfile('selected_bg(1).png'))
							}.tabBar(this.TabBuilder(2, '投教课程'))
						}
						.vertical(false)
						.barMode(BarMode.Fixed)
						.barWidth('80%')
						.barHeight(56)
						.animationDuration(400)
						.onChange((index: number) => {
							this.currentIndex = index
						})
					}.size({ width: '100%' }).margin({ left: 16 })

				}.width('98%').height(420)

				ListItem() {
					Text('——  已经到底啦  ——').fontColor('#14141473').fontSize(10).fontWeight(400)
				}.width('100%')
			}
		}.width('100%').height('100%').backgroundColor('#F5F5F5').alignItems(HorizontalAlign.Center)

	}
}

