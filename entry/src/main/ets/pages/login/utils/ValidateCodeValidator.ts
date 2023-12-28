/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 15:48
 */
import Validator from './Validator';

export default class ValidateCodeValidator implements Validator {

  static readonly MAX_LENGTH:number = 6;
  readonly regex:any = /^(\d{6})$/;

  constructor() {

  }

  check(value: string): boolean {
    if (value === "" || value.trim() === "" || value.length < ValidateCodeValidator.MAX_LENGTH) {
      return false;
    }
    return this.regex.test(value);
  }

  match(generatedValidateCode: string, inputtedValidateCode: string): boolean{
    return generatedValidateCode === inputtedValidateCode;
  }

}