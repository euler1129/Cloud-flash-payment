/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 16:46
 */

export default class ValidateCodeGenerator {
  constructor() {

  }

  private getRandom(): string{
    return Math.floor(Math.random() * 10).toString();
  }

  getValidateCode(length: number): string {
    let generatedDigits = [];
    while (generatedDigits.length != length){
      let digit = this.getRandom();
      generatedDigits.push(digit);
    }
    return generatedDigits.join('');
  }

}