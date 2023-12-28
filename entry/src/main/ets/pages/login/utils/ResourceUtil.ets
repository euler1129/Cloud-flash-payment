/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-21 18:46
 */
import Logger from './Logger';

class ResourceUtil {
  constructor() {

  }

  async getStringByResource(resource: Resource, component: Object): Promise<string> {
    if (!resource) {
      Logger.error('getStringByRes resource is invalid');
      return '';
    }
    let string = await getContext(component).resourceManager.getStringValue(resource.id);
    return string;
  }

}

export default  new ResourceUtil();