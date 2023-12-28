/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-23 09:52
 */

import dataPreferences from '@ohos.data.preferences';
import Logger from '../utils/Logger';
import CommonConstants from '../constants/CommonConstants';
import UserModel from '../viewmodel/UserModel';

let context = getContext(this);
let preference: dataPreferences.Preferences;
let preferenceTemp: dataPreferences.Preferences;

/**
 * User preference model.
 */
class UserPreferenceModel {
  private userModel: UserModel = new UserModel();

  private async initUserPreferenceInstance() {
    try {
      if (!preference) {
        preference = await dataPreferences.getPreferences(context, CommonConstants.PREFERENCE_NAME);
      }
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get preferences, Cause: ${err}`);
    }
  }

  async deleteUserPreferenceInstance() {
    try {
      if (preference) {
        await dataPreferences.deletePreferences(context, CommonConstants.PREFERENCE_NAME);
      }
    } catch(err) {
      Logger.error(CommonConstants.TAG, `Failed to delete preferences, Cause: ${err}`);
    };
    preference = preferenceTemp;
  }

  private async putPreference(userModel: UserModel) {
    if (!preference) {
      await this.initUserPreferenceInstance();
    }
    try {
      await preference.put(CommonConstants.KEY_NAME, JSON.stringify(userModel));
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to put value, Cause: ${err}`);
    }
    await preference.flush();
  }

  private async getPreference() {
    let userModel = '';
    if (!preference) {
      await this.initUserPreferenceInstance();
    }
    try {
      userModel = (await preference.get(CommonConstants.KEY_NAME, '')).toString();
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get value, Cause: ${err}`);
    }
    if (userModel === '') {
      return;
    }
    return JSON.parse(userModel);
  }

  async getUserModel(): Promise<UserModel> {
    this.userModel = await this.getPreference();
    return this.userModel;
  }

  private check(userModel: UserModel): boolean {
    if ((userModel.phoneNumber !== undefined && userModel.phoneNumber !== '') ||
        (userModel.email !== undefined && userModel.email !== '') ||
        (userModel.userName !== undefined && userModel.userName !== '')) {
      return true;
    }
    return false;
  }

  writeToPreference(userModel: UserModel): Promise<void> {
    if (!this.check(userModel)) {
      return;
    }
    this.putPreference(userModel);
    return Promise.resolve();
  }

}

export default new UserPreferenceModel();