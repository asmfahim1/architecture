import 'package:architecture_getx/core/utils/app_routes.dart';
import 'package:architecture_getx/core/utils/dimensions.dart';
import 'package:architecture_getx/core/widgets/exports.dart';
import 'package:architecture_getx/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          _fetchDataButton(),
          Obx(() {
            return homeController.isLoading.value
                ? Container()
                : Expanded(
                    child: _showFetchedData(),
                  );
          }),
        ],
      ),
    );
  }

  Widget _fetchDataButton() {
    return CommonButton(
      buttonTitle: 'Fetch Data',
      onTap: () {
        homeController.fetchData();
      },
    );
  }

  Widget _showFetchedData() {
    return ListView.builder(
      itemCount: homeController.getComments.length,
      itemBuilder: (_, index) {
        var comments = homeController.getComments[index];
        return _cardWidget(comments.name!, comments.body!, () {
          Map<String, dynamic> map = {
            'id': comments.id!,
            'name': comments.name!,
            'email': comments.email!,
          };
          Get.toNamed(AppRoutes.dataPassScreen, arguments: {'map': map});
        });
      },
    );
  }

  Widget _cardWidget(String title, String comment, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding20),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            Dimensions.radius4 * 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(title),
            SizedBox(
              height: Dimensions.height5 / 2,
            ),
            TextWidget(comment),
          ],
        ),
      ),
    );
  }
}
