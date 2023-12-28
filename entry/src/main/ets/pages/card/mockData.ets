// 已添加的银行卡信息
const addDoneCardInfo = [
  {
    type: 'depositCard',
    typeName: '储蓄卡',
    cardList: [
      {
        id: 'depositCard_1',
        img: $r('app.media.auth_card_default_card'),
        cardName: '工商银行',
        cardNum: '2242',
        money: '2000',
        isTransfer: true
      },
      {
        id: 'depositCard_2',
        img: $r('app.media.auth_card_default_card_ec'),
        cardName: '建设银行',
        cardNum: '5917',
        money: '3000',
        isTransfer: false
      },
      {
        id: 'depositCard_3',
        img: $r('app.media.auth_card_default_card'),
        cardName: '工商银行',
        cardNum: '2242',
        money: '2000',
        isTransfer: true
      },
      {
        id: 'depositCard_4',
        img: $r('app.media.auth_card_default_card_ec'),
        cardName: '建设银行',
        cardNum: '5917',
        money: '3000',
        isTransfer: false
      },
      {
        id: 'depositCard_5',
        img: $r('app.media.auth_card_default_card_ec'),
        cardName: '建设银行',
        cardNum: '5917',
        money: '3000',
        isTransfer: false
      }
    ]
  },
  {
    type: 'creditCard',
    typeName: '信用卡',
    cardList: [
      // {
      //   id: 'creditCard_1',
      //   img: $r('app.media.auth_card_default_card_ec'),
      //   cardName: '建设银行',
      //   cardNum: '5917',
      //   money: '4000',
      //   isTransfer: true
      // }
    ]
  }
]

// card_func_1
// 银行卡功能列表
const cardFunctionList = [
  {
    key: 'itemList1',
    list: [
      {
        icon: $r("app.media.card_function_1"),
        name: '一键查卡',
        key: 'itemList1_f1'
      },
      {
        icon: $r("app.media.card_function_2"),
        name: '预约转账',
        key: 'itemList1_f2'
      },
      {
        icon: $r("app.media.card_function_3"),
        name: '信用卡还款',
        key: 'itemList1_f3',
        desc: '0手续费'
      },
      {
        icon: $r("app.media.card_function_4"),
        name: '申请信用卡',
        key: 'itemList1_f4'
      },
      {
        icon: $r("app.media.card_function_2"),
        name: '交易记录',
        key: 'itemList1_f5'
      }
    ],
  },
  {
    key: 'itemList2',
    list: [
      {
        icon: $r("app.media.card_function_2"),
        name: '余额查询',
        key: 'itemList2_f1'
      },
      {
        icon: $r("app.media.card_function_1"),
        name: '转账',
        key: 'itemList2_f2'
      },
      {
        icon: $r("app.media.card_function_4"),
        name: '发红包',
        key: 'itemList2_f3'
      },
      {
        icon: $r("app.media.card_function_2"),
        name: '权益精选',
        key: 'itemList2_f4'
      },
      {
        icon: $r("app.media.card_function_3"),
        name: '安全中心',
        key: 'itemList2_f5'
      }
    ],
  }
]

// Part1-卡展示区数据
const sendShowCardAreaData = {
  addDoneCardInfo, // 已添加的银行卡信息
  cardFunctionList, // 银行卡功能列表
  advertisingTop: '交房租、还贷款、转亲友、个人资金管理？快来体验实...', // 顶部广告
  advertisingCenter: '快来体验一键查卡，便携查询您名下全部银行卡' // 中间广告
}

// Part2-申请银行卡数据
const sendCardImgList = [
  {
    key: '1',
    title: '招商星座守护信用卡',
    desc: '刷卡达标享时尚拉杆箱',
    img: $r('app.media.apply_card_1')
  },
  {
    key: '2',
    title: '交行标准信用卡',
    desc: '达标享120元还款红包',
    img: $r('app.media.apply_card_2')
  },
  {
    key: '3',
    title: '建行龙卡正青春信用卡',
    desc: '达标领158元券包',
    img: $r('app.media.apply_card_3')
  },
  {
    key: '4',
    title: '中信银行i白金信用卡',
    desc: '达标9积分可兑星巴克',
    img: $r('app.media.apply_card_4')
  },
  {
    key: '5',
    title: '浦发无界信用卡',
    desc: '刷卡达标最高得红包、消费券',
    img: $r('app.media.apply_card_5')
  },
  {
    key: '6',
    title: '平安携程白金信用卡',
    desc: '新户达标领时尚拉杆箱',
    img: $r('app.media.apply_card_6')
  }
]

// Part3-绑定有优惠
const sendBindCardInfo = {
  bindCardList1: [
    {
      logo: $r('app.media.icon_bank_2'),
      name: '北京银行信用卡',
      desc: '最高88元券',
      key: 'bindCardList1_1'
    },
    {
      logo: $r('app.media.icon_bank_1'),
      name: '民泰银行信用卡',
      desc: '5元还款券',
      key: 'bindCardList1_2'
    },
    {
      logo: $r('app.media.icon_bank_1'),
      name: '杭州银行信用卡',
      desc: '5元还款券',
      key: 'bindCardList1_3'
    },
    {
      logo: $r('app.media.icon_bank_2'),
      name: '长沙银行信用卡',
      desc: '10元还款券',
      key: 'bindCardList1_4'
    }
  ],
  bindCardList2: [
    {
      img: $r('app.media.popup_5'),
      logo: $r('app.media.icon_bank_2'),
      title: '首绑农行信用卡',
      desc: '送5元优惠券',
      key: 'bindCardList2_1'

    },
    {
      img: $r('app.media.popup_8'),
      logo: $r('app.media.icon_bank_1'),
      title: '首绑桂行信用卡',
      desc: '送8.8元优惠券',
      key: 'bindCardList2_2'
    }
  ]
}

//Part4-热门卡权益
const sendHotCardList = [
  {
    img: $r('app.media.hot_card_1'),
    title: '国内机场贵宾',
    logo: $r('app.media.yinlian'),
    desc: '中国银联·钻石卡/...',
    key: 'hot_card_1'
  },
  {
    img: $r('app.media.hot_card_2'),
    title: '高铁贵宾权益',
    logo: $r('app.media.yinlian'),
    desc: '中国银联·钻石卡/...',
    key: 'hot_card_2'
  },
  {
    img: $r('app.media.hot_card_3'),
    title: '礼兵车接送机',
    logo: $r('app.media.yinlian'),
    desc: '中国银联·钻石卡/...',
    key: 'hot_card_3'
  },
  {
    img: $r('app.media.hot_card_4'),
    title: '酒店餐饮',
    logo: $r('app.media.yinlian'),
    desc: '中国银联·钻石卡/...',
    key: 'hot_card_4'
  },
  {
    img: $r('app.media.hot_card_5'),
    title: '游泳健身礼遇',
    logo: $r('app.media.yinlian'),
    desc: '中国银联·钻石卡/...',
    key: 'hot_card_5'
  }
]



export { sendShowCardAreaData, sendCardImgList, sendBindCardInfo, sendHotCardList }