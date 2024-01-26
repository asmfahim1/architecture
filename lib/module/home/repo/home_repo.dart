import 'package:architecture_getx/core/utils/api_client.dart';
import 'package:architecture_getx/core/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {
  late final ApiClient apiClient;
  late final SharedPreferences sharedPreferences;

  HomeRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getData() async {
    return await apiClient.getData(AppConstants.getData);
  }
}
