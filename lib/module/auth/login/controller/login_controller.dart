import 'package:architecture_getx/core/utils/app_routes.dart';
import 'package:architecture_getx/core/utils/dialogue_utils.dart';
import 'package:architecture_getx/module/auth/login/model/login_response_model.dart';
import 'package:architecture_getx/module/auth/login/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginRepo? loginRepo;
  LoginController({this.loginRepo});

  final RxBool _passwordVisible = false.obs;
  set passwordVisible(bool value) {
    _passwordVisible.value = value;
    update();
  }

  bool get passwordVisible => _passwordVisible.value;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginResponseModel? responseModel;
  Future<void> loginMethod() async {
    try {
      print('test1');
      DialogUtils.showLoading();
      Map<String, dynamic> map = {
        "email": email.text.trim(),
        "password": password.text.trim()
      };

      Response response = await loginRepo!.login(map);
      print(
          'response : $map =========== ${response.statusCode}========${response.body}');
      if (response.statusCode == 200) {
        print('test2');
        responseModel = LoginResponseModel.fromJson(response.body);
        if (responseModel!.data == null) {
          print('test3');
          closeLoading();
          DialogUtils.showErrorDialog(
              title: 'Warning', description: '${responseModel!.message}');
        } else {
          print('test4');
          await loginRepo!.saveUserToken(responseModel!.data!.token.toString());
          closeLoading();
          Get.offAllNamed(AppRoutes.homeScreen);
        }
      } else {
        print('test5');
        closeLoading();
        DialogUtils.showErrorDialog();
      }
    } catch (e) {
      print('test6');
      closeLoading();
      DialogUtils.showErrorDialog(
          title: 'Failed',
          description:
              "There is an error occured while login request is processing: $e");
    }
  }

  //ise user logged in
  bool userLoggedIn() {
    return loginRepo!.userLoggedIn();
  }

  //closing alert dialogue
  void closeLoading() {
    Get.back();
  }
}
