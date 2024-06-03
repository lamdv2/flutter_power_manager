import 'package:flutter_getx_base/modules/categogy/category.dart';
import 'package:flutter_getx_base/modules/home/home_tab_binding.dart';
import 'package:flutter_getx_base/modules/home/home_tab_screen.dart';
import 'package:flutter_getx_base/modules/intro/intro_screen.dart';
import 'package:flutter_getx_base/modules/main/home_binding.dart';
import 'package:flutter_getx_base/modules/main/home_screen.dart';
import 'package:flutter_getx_base/modules/splash/splash_binding.dart';
import 'package:flutter_getx_base/modules/splash/splash_view.dart';
import 'package:get/get.dart';

import '../modules/intro/intro_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME_TAB,
      page: () => HomeTabScreen(),
      binding: HomeTabBinding(),
    ),
    GetPage(
      name: Routes.CATEGORIES,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
    ),
  ];
}
