import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';

// export async function takePhoto() { //打开相机
//   await abilityAccessCtrl.createAtManager()
//     .requestPermissionsFromUser(getContext(this), ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA'])
//   let context = getContext(this) as common.UIAbilityContext
//   let result = await context.startAbilityForResult({ action: "ohos.want.action.imageCapture" })
//   // return result.want.uri
//   console.log('照片', JSON.stringify(result.want))
//   const randomNum = (Math.random()*9+1)*1000000000000000000 + '' // 随机生成19位数字
//   return randomNum.replace(/(.{4})/g, "$1 ")
// }


export async function takePhoto() {
let context = getContext() as common.UIAbilityContext
  let want = {
    'uri': '',
    'action': "ohos.want.action.imageCapture",
    'parameters': {},
  };
  return context.startAbilityForResult(want)
    .then((result) => {
      if (result.resultCode === 0 && result.want && result.want.uri ) {
        //拍照成功
        console.log('拍照成功', result.want.uri)
        // return result.want.uri;
        // 模拟返回卡片
        const randomNum = (Math.random()*9+1)*1000000000000000000 + '' // 随机生成19位数字
        return randomNum.replace(/(.{4})/g, "$1 ")
      }
    }).catch((error) => {
      console.log(this.TAG, `startAbility error , ${JSON.stringify(error)}`);
      return error;
    })
}

// // 本地图片转base64编码
// export function changeBase64(url) {
//   var imgSrc = url; // 图片本地路劲
//   var image = new Image()
//   image.src = imgSrc
//   image.onload = () => {
//     var canvas = document.createElement("canvas")
//     canvas.width = image.width
//     canvas.height = image.height
//     var ctx = canvas.getContext("2d")
//     ctx.drawImage(image, 0, 0, image.width, image.height)
//     var ext = image.src.substring(image.src.lastIndexOf(".") + 1).toLowerCase()
//     var dataUrl = canvas.toDataURL("image/" + ext)
//     var base64 = JSON.parse(JSON.stringify(dataUrl)) // 这里就是转化成的编码
//   }
// }