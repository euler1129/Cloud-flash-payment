/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 18:52
 */
import wantAgent, { WantAgent } from '@ohos.wantAgent';
import notification from '@ohos.notificationManager';
import Logger from './Logger';
import CommonConstants from '../constants/CommonConstants';

class Notifier{

  constructor() {
  }

  createWantAgent(bundleName: string, abilityName: string): Promise<WantAgent> {
    let wantAgentInfo = {
      wants: [
        {
          bundleName: bundleName,
          abilityName: abilityName
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
    };
    return wantAgent.getWantAgent(wantAgentInfo);
  }

  publishNotification(title: string, content: string, wantAgentObj: WantAgent): Promise<void> {
    let notificationRequest: notification.NotificationRequest = {
      id: CommonConstants.NOTIFICATION_ID,
      slotType: notification.SlotType.SERVICE_INFORMATION,
      content: {
        contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: `${title}`,
          text: '',
          additionalText: `Test`
        }
      },
      wantAgent: wantAgentObj
    };
    return notification.publish(notificationRequest);
  }

  openNotificationPermission() {
    notification.requestEnableNotification().then(() => {
      Logger.info('Enable notification success');
    }).catch((err) => {
      Logger.error('Enable notification failed because ' + JSON.stringify(err));
    });
  }

}

export default new Notifier();