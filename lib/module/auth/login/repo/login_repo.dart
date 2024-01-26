import 'package:architecture_getx/core/utils/api_client.dart';
import 'package:architecture_getx/core/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/const_key.dart';

class LoginRepo {
  late final ApiClient apiClient;
  late final SharedPreferences sharedPreferences;

  LoginRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(Map<String, dynamic> loginBody) async {
    print('Complete url : ${AppConstants.baseUrl}${AppConstants.loginUrl}');
    return await apiClient.postData(AppConstants.loginUrl, loginBody);
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstant.TOKEN.key, token);
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.TOKEN.key);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstant.TOKEN.key) ?? "None";
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstant.TOKEN.key);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }

/*  Future<Response> logout() async {
    return await apiClient.patchData(
        AppConstants.logoutUrl, {});
  }

  Future<Response> agencyReg(AgencyRegistrationModel agencyRegBody) async {
    return await apiClient.postData(
        AppConstants.agencyRegUrl, agencyRegBody.toJson());
  }*/
}
