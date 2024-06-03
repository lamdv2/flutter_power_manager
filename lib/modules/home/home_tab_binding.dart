import 'package:flutter_getx_base/modules/home/home_tab_controller.dart';
import 'package:get/get.dart';

class HomeTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTabController>(() => HomeTabController());
  }
}
