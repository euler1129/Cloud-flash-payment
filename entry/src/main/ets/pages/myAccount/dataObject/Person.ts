
/**
 * 自定义一个Person类
 */

export default class Person {
  name: string
  phoneNumber: string
  memberLevel: string //01-普通会员 02-VIP 03-SVIP
  idNumber:string
  avatar: any

  constructor(name: string, phoneNumber: string, memberLevel: string, idNumber:string, avatar: any) {
    this.name = name
    this.phoneNumber = phoneNumber
    this.memberLevel = memberLevel
    this.idNumber = idNumber
    this.avatar = avatar
  }

  public setPhoneNumber(phoneNumber:string): void{
    this.phoneNumber = phoneNumber
  }

  //该方法用于获取会员等级
  getMemberLevel(memberLevel: string) {
    switch (memberLevel) {
      case '01':
        return '普通会员'
      case '02':
        return 'VIP会员';
      case '03':
        return 'SVIP会员';
      default:
        return 'XXX会员';
    }
  }

  //该方法用于格式化姓名
  formatName(name:string){
    if (!name || typeof name !== 'string') {
      return name;
    }
    let lastName = name.charAt(name.length - 1);
    let maskedName = '*'.repeat(name.length - 1) + lastName;
    return maskedName;
  }

  //该方法用于格式化电话号码
  formatPhoneNumber(phoneNumber:string){
    return phoneNumber.replace(/(\d{3})\d{4}(\d{4})/, '$1 **** $2');
  }
  //该方法用于格式化身份证号
  formatIdNumber(idNumber:string){
    return idNumber.replace(/(\d{1})\d{13}(\d{4})/, '$1*************$2');
  }

  public toJSON() {
    return {
      name: this.name,
      phoneNumber: this.phoneNumber,
      memberLevel: this.memberLevel,
      idNumber: this.idNumber,
      avatar: this.avatar
    }
  }
}