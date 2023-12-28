import notification from '@ohos.notificationManager';

export function myNotification() {

  const range = ["0","1","2","3","4","5","6","7","8","9"]
  const strList = [];
  for (let i = 0; i < 6; i++) {
    const randomStr = range[Math.floor(Math.random() * 10)];
    strList.push(randomStr);
  }
  globalThis.globalRound=strList[0]+''+strList[1]+''
                        +strList[2]+''+strList[3]+''
                        +strList[4]+''+strList[5];

  /**************************************************************/
  /**************************************************************/
  /**************************************************************/

  var notificationRequest  = { // 描述通知的请求
    id: 1, // 通知ID
    slotType: notification.SlotType.SOCIAL_COMMUNICATION,//社交类型。

    content: { // 通知内容
      contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
      normal: { // 基本类型通知内容

        title: globalThis.globalPhone,
        text: '[中国银联]验证码'+globalThis.globalRound
        +',有效期5分钟。您正在登录云闪付APP。请勿将短信验证码告知他人。',
        //additionalText: '通知附加内容', // 通知附加内容，是对通知内容的补充。
      },

    }
  }
  notification.publish(notificationRequest).then(() => { // 发布通知
    console.info('publish success');
   }).catch((err)=>{
     console.info(err);
   });

}