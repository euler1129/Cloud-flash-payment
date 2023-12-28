/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-23 09:52
 */

export default class UserModel {

  userName: string = '';
  password: string = '';
  phoneNumber: string = '';
  email: string = '';
  country: string = '';
  areaCode: string = '';

  constructor() {

  }

  public getUserName(): string {
    return this.userName;
  }

  public setUserName(userName: string): void {
    this.userName = userName;
  }

  public getPassword(): string {
    return this.password;
  }

  public setPassword(password: string): void {
    this.password = password;
  }

  public getPhoneNumber(): string {
    return this.phoneNumber;
  }

  public setPhoneNumber(phoneNumber: string): void {
    this.phoneNumber = phoneNumber;
  }

  public getEmail(): string {
    return this.email;
  }

  public setEmail(email: string): void {
    this.email = email;
  }

  public getCountry(): string {
    return this.country;
  }

  public setCountry(country: string): void {
    this.country = country;
  }

  public getAreaCode(): string {
    return this.areaCode;
  }

  public setAreaCode(areaCode: string): void {
    this.areaCode = areaCode;
  }

  private add = (x: number, y: number) => x + y;
  private multiply = (x: number, y: number) => x * y;

  public hashCode(): string {
    let str = JSON.stringify(this);
    let hash = 0;
    if (hash == 0 && str.length > 0) {
      for (let i = 0; i < str.length; i++) {
        hash = this.add(this.multiply(31, hash), str.charCodeAt(i));
      }
    }
    return hash.toString();
  }

}