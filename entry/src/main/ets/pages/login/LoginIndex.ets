/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 09:59
 */
import router from '@ohos.router';
import PhoneNumberValidator from './utils/PhoneNumberValidator';
import common from '@ohos.app.ability.common';
import UserPreferenceModel from './model/UserPreferenceModel';
import UserModel from './viewmodel/UserModel';
import { LoginPattern } from './enums/LoginPattern';
import UsernameOrEmailValidator from './utils/UsernameOrEmailValidator';

@Entry
@Component
struct LoginIndex {
  @State country: string = '中国大陆';
  @State areaCode: string = '+86';
  @State phoneNumber: string = '';
  @State clickable: boolean = false;

  @State loginPattern: LoginPattern = LoginPattern.PHONE_NUMBER;
  @State switchLoginPattern: boolean = false;
  @State emailOrUserName: string = '';

  private phoneNumberValidator:PhoneNumberValidator = new PhoneNumberValidator();
  private usernameOrEmailValidator:UsernameOrEmailValidator = new UsernameOrEmailValidator();

  async aboutToAppear() {
    UserPreferenceModel.getUserModel().then((userModel: UserModel) => {
      if (userModel) {
        router.pushUrl({
          url: 'pages/home/CloudTabContent',
          params: {
          }
        }, router.RouterMode.Single);
      }
    });
  }

  onPageShow() {
    let selectedCountry:string = router.getParams()?.['selectedCountry'];
    let selectedNumber:string = router.getParams()?.['selectedNumber'];
    if (selectedCountry !== undefined && selectedCountry !== '') {
      this.country = selectedCountry;
    }
    if (selectedNumber !== undefined && selectedNumber !== '') {
      this.areaCode = selectedNumber;
    }
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.t1_close'))
          .width(20)
          .onClick(() => {
            const context = getContext(this) as common.UIAbilityContext;
            context.terminateSelf();
          })
        Image($r('app.media.t1_new_user_register'))
          .width(100)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/registerPage/register',
              params: {
                areaCode: this.areaCode,
                phoneNumber: this.phoneNumber
              }
            }, router.RouterMode.Single);
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Image($r('app.media.t1_app_logo')).width(100)
      }
      .width('100%')
      .height(150)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r('app.string.country_area'))
          .width(80)
          .fontColor($r('app.color.country_area'))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(this.country)
          .width(230)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.t1_arrow_right'))
          .width(15)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/login/SelectCountryOrArea',
              params: {
                areaCode: this.areaCode,
                phoneNumber: this.phoneNumber
              }
            }, router.RouterMode.Single);
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin(10)
      .visibility(!this.switchLoginPattern ? Visibility.Visible : Visibility.None)

      Row() {
        Text(this.areaCode)
          .width(80)
          .height(35)
          .fontColor($r('app.color.area_code'))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .border({ width: { bottom: 1 } })
        TextInput({ text: this.phoneNumber, placeholder: $r('app.string.please_input_phone_number') })
          .width('77%')
          .backgroundColor(Color.White)
          .border({ width: { bottom: 1 }, radius: 0 })
          .maxLength(PhoneNumberValidator.MAX_LENGTH)
          .onChange((value: string) => {
            this.clickable = this.phoneNumberValidator.check(value);
            if (this.clickable) {
              this.phoneNumber = value;
              this.loginPattern  = LoginPattern.PHONE_NUMBER;
            }
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .margin(20)
      .visibility(!this.switchLoginPattern ? Visibility.Visible : Visibility.None)

      Row(){
        TextInput({ text: this.emailOrUserName, placeholder: $r('app.string.please_input_email_or_username') })
          .width('100%')
          .backgroundColor(Color.White)
          .border({ width: { bottom: 1 }, radius: 0 })
          .maxLength(UsernameOrEmailValidator.MAX_LENGTH)
          .onChange((value: string) => {
            this.clickable = this.usernameOrEmailValidator.check(value);
            if (this.clickable) {
              this.emailOrUserName = value;
              if (this.usernameOrEmailValidator.isEmail(this.emailOrUserName)) {
                this.loginPattern  = LoginPattern.EMAIL;
              }else{
                this.loginPattern  = LoginPattern.USER_NAME;
              }
            }
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .margin({ top: 63, bottom: 20, right: 20, left: 20})
      .visibility(this.switchLoginPattern ? Visibility.Visible : Visibility.None)

      Row() {
        Button($r('app.string.next_step'), { type: ButtonType.Normal, stateEffect: true })
          .width('100%')
          .height(60)
          .fontColor(Color.White)
          .fontSize(22)
          .backgroundColor($r('app.color.next_step'))
          .borderRadius(5)
          .enabled(this.clickable)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/login/LoginValidate',
              params: {
                areaCode: this.areaCode,
                phoneNumber: this.phoneNumber,
                emailOrUserName: this.emailOrUserName,
                loginPattern: this.loginPattern
              }
            }, router.RouterMode.Single);
          })
      }

      Row() {
        Text(!this.switchLoginPattern ? $r('app.string.email_username_login') : $r('app.string.phone_number_login'))
          .fontColor($r('app.color.email_username_login'))
          .height(30)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({top:15})
      }
      .onClick(() => {
        this.switchLoginPattern = !this.switchLoginPattern;
      })
      .width('100%')
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r('app.string.encountered_problem'))
          .fontColor($r('app.color.encountered_question'))
          .height(30)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/login/QuestionList',
              params: {
              }
            }, router.RouterMode.Single);
          })
      }
      .width('100%')
      .height('45%')
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.Center)

    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}