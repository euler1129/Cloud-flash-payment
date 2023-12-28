// 卡展示区
interface showCardAreaDataType {
  addDoneCardInfo?: Array<any>
  cardFunctionList?: Array<any>
  advertisingTop?: string
  advertisingCenter?: string
}

// 申请银行卡
interface applyCardDataType {
  key: string
  title: string
  desc: string
  img: Resource
}

// 绑卡有优惠
interface bindCardDataType1 {
  logo: Resource
  name: string
  desc: string
  key: string
}
interface bindCardDataType2 {
  img: Resource
  logo: Resource
  title: string
  desc: string
  key: string
}

interface bindCardDataType {
  bindCardList1?: Array<bindCardDataType1>
  bindCardList2?: Array<bindCardDataType2>
}

// 热门卡权益
interface hotCardDataType {
  img: Resource
  title: string
  logo: Resource
  desc: string
  key: string
}

export {showCardAreaDataType, applyCardDataType, bindCardDataType1, bindCardDataType2, bindCardDataType, hotCardDataType}