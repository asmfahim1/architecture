import 'package:architecture_getx/core/utils/api_client.dart';
import 'package:architecture_getx/core/utils/app_constants.dart';
import 'package:architecture_getx/module/auth/login/controller/login_controller.dart';
import 'package:architecture_getx/module/auth/login/repo/login_repo.dart';
import 'package:architecture_getx/module/home/controller/home_controller.dart';
import 'package:architecture_getx/module/home/repo/home_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  //shared preference
  Get.lazyPut(() => sharedPreferences, fenix: true);

  //api client
  Get.lazyPut(
      () => ApiClient(
          appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()),
      fenix: true);

  //Repo
  Get.lazyPut(
      () => LoginRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => HomeRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
      fenix: true);

  ///Controller
  //Auth
  Get.lazyPut(() => LoginController(loginRepo: Get.find<LoginRepo>()),
      fenix: true);
  Get.lazyPut(() => HomeController(homeRepo: Get.find<HomeRepo>()),
      fenix: true);
}
