import 'package:flutter_getx_base/modules/intro/intro_controller.dart';
import 'package:get/get.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IntroController>(IntroController());
  }
}
