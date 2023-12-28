/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 15:44
 */
import Validator from './Validator';

export default class PhoneNumberValidator implements Validator {

  static readonly MAX_LENGTH:number = 11;
  private readonly regex:any = /^(1[3456789]\d{9})$/;

  constructor() {

  }

  check(value: string): boolean {
    if (value === "" || value.trim() === "" || value.length < PhoneNumberValidator.MAX_LENGTH) {
      return false;
    }
    return this.regex.test(value);
  }

}

