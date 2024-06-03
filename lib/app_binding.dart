import 'package:flutter_getx_base/modules/home/home_tab_controller.dart';
import 'package:flutter_getx_base/modules/main/home_controller.dart';
import 'package:get/get.dart';

import 'api/api_provider.dart';
import 'api/api_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get
      ..put(
        ApiProvider(Get.find()),
        permanent: true,
      )
      ..put(
        ApiRepository(),
        permanent: true,
      )
      ..put(
        HomeController(apiRepository: Get.find()),
        permanent: true,
      )
      ..put(
        HomeTabController(),
        permanent: true,
      );
  }
}
