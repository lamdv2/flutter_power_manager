import 'package:flutter_getx_base/modules/home/home_tab_controller.dart';
import 'package:flutter_getx_base/modules/main/home_controller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final HomeTabController homeTabController = Get.find();
  final HomeController homeController = Get.find();

  void callTrueFalseQuestion() async {
    homeTabController.isCheckLoading.value = true;
    homeController.bottomNavIndex.value = 0;
    await homeTabController.fetchDataTrueFalseQuestion();
    homeTabController.isCheckLoading.value = false;
  }

  void callChooseQuestion() async {
    homeTabController.isCheckLoading.value = true;
    homeController.bottomNavIndex.value = 0;
    await homeTabController.fetchDataChooseQuestion();
    homeTabController.isCheckLoading.value = false;
  }
}
