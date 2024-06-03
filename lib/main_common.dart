// ignore_for_file: unused_field, unused_element, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_getx_base/shared/constants/local_storage.dart';
import 'package:flutter_getx_base/shared/utils/app_flavor_helper.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'di.dart';
import 'lang/translation_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await LocalStorageHelper.initLocalStorageHelper();

  await Future.wait([
    DenpendencyInjection.init(),
    DenpendencyInjection.inject(flavor),
  ]);

  final fcmToken = await FirebaseMessaging.instance.getToken();
  if (fcmToken != null) {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("onMessageOpenedApp: $event");
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    subscribeToBookingTopic();
    LocalStorageHelper.setString('fcmToken', fcmToken);
  } else {
    print('fcmToken is null');
  }

  runApp(App(flavor));

  configLoading();
}

void subscribeToBookingTopic() async {
  await FirebaseMessaging.instance.subscribeToTopic("topic");
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle the message when the app is in the background
  print("onBackgroundMessage: $message");
  // Show a notification or perform other actions as needed
}

class App extends StatelessWidget {
  final AppFlavor flavor;
  final AppController controller;

  App(this.flavor) : controller = Get.put(AppController(flavor));

  final mainTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.backgroundColor,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
    ),
  );

  final darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: Routes.SPLASH,
        defaultTransition: Transition.fade,
        getPages: AppPages.routes,
        initialBinding: AppBinding(),
        smartManagement: SmartManagement.keepFactory,
        title: 'Woo People',
        theme: controller.isDarkModeOn.value ? darkTheme : mainTheme,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = ColorConstants.kPrimaryColor
    ..textColor = ColorConstants.kPrimaryColor
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
