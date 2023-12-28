/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-23 19:09
 */
import Validator from './Validator';

export default class UsernameOrEmailValidator implements Validator {

  static readonly MAX_LENGTH:number = 30;
  private readonly regex: any = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;

  constructor() {

  }

  check(value: string): boolean {
    if (value === "" || value.trim() === "") {
      return false;
    }
    if (value.includes('@')) {
      return this.isEmail(value);
    }
    return true;
  }

  isEmail(value: string): boolean {
    return this.regex.test(value);
  }

}