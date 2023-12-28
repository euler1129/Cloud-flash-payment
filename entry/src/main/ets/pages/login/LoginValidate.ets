/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 09:59
 */
import router from '@ohos.router';
import ValidateCodeGenerator from './utils/ValidateCodeGenerator';
import ValidateCodeValidator from './utils/ValidateCodeValidator';
import common from '@ohos.app.ability.common';
import { WantAgent } from '@ohos.wantAgent';
import Logger from './utils/Logger';
import notifier from './utils/Notifier';
import CommonConstants from './constants/CommonConstants';
import resourceUtil from './utils/ResourceUtil';
import UserPreferenceModel from './model/UserPreferenceModel';
import UserModel from './viewmodel/UserModel';
import { LoginPattern } from './enums/LoginPattern';

@Entry
@Component
struct LoginValidate {

  areaCode: string = '';
  phoneNumber: string = '';
  emailOrUserName: string = '';
  loginPattern: LoginPattern = LoginPattern.PHONE_NUMBER;

  @State countdownMessage: string = '';
  @State clickable: boolean = false;

  private validateCodeGenerator:ValidateCodeGenerator = new ValidateCodeGenerator();
  private validateCodeValidator: ValidateCodeValidator = new ValidateCodeValidator();

  private generatedValidateCode: string = '';
  private context = getContext(this) as common.UIAbilityContext;
  private notificationTitle: string = '';
  private wantAgentObj: WantAgent = new Object();

  private notificationTimerInstance: number = -1;
  private countdownTimerInstance: number = -1;

  prepareNotification(): void{
    notifier.openNotificationPermission();
    let bundleName = this.context.abilityInfo.bundleName;
    let abilityName = this.context.abilityInfo.name;
    notifier.createWantAgent(bundleName, abilityName).then(want => {
      this.wantAgentObj = want;
    }).catch((err: Error) => {
      Logger.error(`getWantAgent fail, err: ${JSON.stringify(err)}`);
    });
  }

  startCountdown(){
    let countdown = 60;
    this.countdownTimerInstance = setInterval(async () => {
      countdown--;
      if (countdown < 1) {
        clearInterval(this.countdownTimerInstance);
        this.countdownMessage = await this.getText($r('app.string.send'));
        return;
      }
      this.countdownMessage = `${countdown}s`;
    }, CommonConstants.COUNTDOWN_INTERVAL);
  }

  sendValidateCode(validateCode: string) {
    this.notificationTimerInstance = setTimeout(async () => {
      this.notificationTitle = `【中国银联】验证码${validateCode}，有...`;
      notifier.publishNotification(this.notificationTitle, '', this.wantAgentObj)
        .catch((err: Error) => {
          Logger.error(`[ValidateCode] publish failed,message is ${err}`);
        })
        .then(() => {
          this.startCountdown();
        });
    }, CommonConstants.WAIT_TIME);
  }

  showAccountName():string{
    if (this.loginPattern == LoginPattern.PHONE_NUMBER) {
      return this.areaCode + ' ' + this.phoneNumber;
    } else {
      return this.emailOrUserName;
    }
  }

  async getText(resource: Resource):Promise<string> {
    return await resourceUtil.getStringByResource(resource, this);
  }

  aboutToAppear() {
    this.areaCode = router.getParams()?.['areaCode'];
    this.phoneNumber = router.getParams()?.['phoneNumber'];
    this.emailOrUserName = router.getParams()?.['emailOrUserName'];
    this.loginPattern = router.getParams()?.['loginPattern'];
    this.prepareNotification();
  }

  onPageShow() {
    this.generatedValidateCode = this.validateCodeGenerator.getValidateCode(ValidateCodeValidator.MAX_LENGTH);
    this.sendValidateCode(this.generatedValidateCode);
  }

  onPageHide() {
    clearTimeout(this.notificationTimerInstance);
    clearInterval(this.countdownTimerInstance);
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.t1_arrow_left'))
          .width(20)
          .onClick(() => {
            router.back({url: 'pages/login/LoginIndex'});
          })
        Image($r('app.media.t1_new_user_register'))
          .width(100)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/registerPage/register',
              params: {
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
        Text(this.showAccountName())
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin(10)

      Row() {
        Text($r('app.string.validate_code'))
          .width(80)
          .height(35)
          .fontColor($r('app.color.validate_code'))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        TextInput({ text: '', placeholder: $r('app.string.please_input_sms_validate_code') })
          .width('66%')
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            let isLegal = this.validateCodeValidator.check(value);
            if (!isLegal) {
              return;
            }
            this.clickable = this.validateCodeValidator.match(this.generatedValidateCode, value);
          })
        Text(this.countdownMessage)
          .height(35)
          .fontColor($r('app.color.countdown_sending'))
          .fontSize(16)
          .textAlign(TextAlign.End)
          .onClick(async () => {
            if (this.countdownMessage != await this.getText($r('app.string.send'))) {
              return;
            }
            this.generatedValidateCode = this.validateCodeGenerator.getValidateCode(ValidateCodeValidator.MAX_LENGTH);
            this.sendValidateCode(this.generatedValidateCode);
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .margin(20)

      Row() {
        Button($r('app.string.login'), { type: ButtonType.Normal, stateEffect: true })
          .width('100%')
          .height(60)
          .fontColor(Color.White)
          .fontSize(22)
          .backgroundColor($r('app.color.login'))
          .borderRadius(5)
          .enabled(this.clickable)
          .onClick(() => {
            let userModel = new UserModel();
            switch (this.loginPattern){
              case LoginPattern.PHONE_NUMBER:
                userModel.setAreaCode(this.areaCode);
                userModel.setPhoneNumber(this.phoneNumber);
                break;
              case LoginPattern.EMAIL:
                userModel.setEmail(this.emailOrUserName);
                break;
              case LoginPattern.USER_NAME:
                userModel.setUserName(this.emailOrUserName);
                break;
              default:
                break;
            }
            UserPreferenceModel.writeToPreference(userModel).then(() => {
              router.pushUrl({
                url: 'pages/home/CloudTabContent',
                params: {
                }
              }, router.RouterMode.Single);
            });
          })
      }

      Row() {
        Text($r('app.string.switch_login_approach'))
          .fontColor($r('app.color.switch_login_approach'))
          .height(30)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({top:15})
      }
      .onClick(() => {
        router.pushUrl({
          url: 'pages/login/LoginApproach',
          params: {
          }
        }, router.RouterMode.Single);
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