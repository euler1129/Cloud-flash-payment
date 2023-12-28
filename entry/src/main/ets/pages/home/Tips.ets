
@Component
export struct CouPonTips{

  @State coupons:string = "送2元券";

  build(){
    Row(){
      Column(){
        Text(this.coupons).fontSize(10).fontColor(Color.White)
      }.backgroundColor('#FF3B47').padding({top:2, left:4, bottom:2, right:4})
      .borderRadius({topLeft:6, topRight:10, bottomLeft:0, bottomRight:10})

    }.margin({top:-65,right:-110})
  }
}

@Component
export struct OtherTips{

  @Link otherTips:string ;
  @Link visible:any ;

  build(){
    Row(){
      Column(){
        Text(this.otherTips).fontSize(10).fontColor('#CF5553')
      }.backgroundColor('#FCFFFC').padding({top:2, left:4, bottom:2, right:4})
      .borderRadius({topLeft:6, topRight:10, bottomLeft:0, bottomRight:10})
    }.margin({top:-60}).visibility(this.visible)
  }
}

@Component
export struct PreferentialTips{

  @State preTips:string = "天天优惠";

  build(){
    Row(){
      Column(){
        Text(this.preTips).fontSize(10).fontColor('#CF5553')
      }.backgroundColor('#FCFFFC').padding({top:2, left:4, bottom:2, right:4})
      .borderRadius({topLeft:6, topRight:10, bottomLeft:0, bottomRight:10})
    }.margin({top:-80,right:-120})
  }
}