// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/common.dart';
import '../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../home/home_tab_screen.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.bottomNavIndex.value != 0) {
          controller.setValueBottomIndex(0);
          return false;
        }
        return controller.onWillPop();
      },
      child: Obx(
        () => Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: controller.bottomNavIndex.value,
            children: _widgetOptions(),
          ),
          bottomNavigationBar: _bottomNav(controller),
        ),
      ),
    );
  }

  Widget _bottomNav(HomeController controller) {
    return Obx(
      () => CustomBottomNavigationBar(
        selectedIndex: controller.bottomNavIndex.value,
        color: appController.isDarkModeOn.value
            ? Colors.white
            : ColorConstants.grey.withOpacity(.6),
        backgroundColor: appController.isDarkModeOn.value
            ? Colors.grey[800]
            : ColorConstants.white,
        selectedColor: appController.isDarkModeOn.value
            ? ColorConstants.colorDarkModeBlue
            : ColorConstants.primaryColor,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: (value) => controller.setValueBottomIndex(value),
        items: [
          BottomBarItem(
            iconData: controller.bottomNavIndex.value == 0
                ? controller.bottomNavSelectedIconPaths[0]
                : controller.imagePaths[0],
            text: CommonConstants.home.tr,
          ),
        ],
      ),
    );
  }

  List<Widget> _widgetOptions() {
    return [
      HomeTabScreen(),
    ];
  }
}
