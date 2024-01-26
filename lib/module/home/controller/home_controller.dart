import 'package:architecture_getx/core/utils/dialogue_utils.dart';
import 'package:architecture_getx/module/home/model/get_data_model.dart';
import 'package:architecture_getx/module/home/repo/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepo? homeRepo;
  HomeController({this.homeRepo});

  RxBool isLoading = false.obs;
  List<GetCommentsModel> getComments = [];
  Future<void> fetchData() async {
    isLoading(true);
    try {
      print('test1');
      DialogUtils.showLoading();

      Response response = await homeRepo!.getData();
      print('response : ${response.statusCode}========${response.body}');
      if (response.statusCode == 200) {
        print('test2');
        getComments = getCommentsModelFromJson(response.body);
        print('---------------');
        closeLoading();
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

  //closing alert dialogue
  void closeLoading() {
    Get.back();
  }
}
