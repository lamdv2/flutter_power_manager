import 'package:flutter/material.dart';

class CommonConstants {
  static const String keyIntro = 'introScreen';
  static const String checkIntro = 'haveIntroScreen';
  static const String checkAUTH = 'haveIntroAuth';
  static const String token = 'token';
  
  static const String someThingWrongPlsTryAgain = 'someThingWrongPlsTryAgain';
  static const String tittleExitApp = 'tittleExitApp';
  static const String home = 'home';
  static const String news = 'news';
  static const String more = 'more';
  static const String event = 'event';
  static const String reward = 'reward';
  static const String profile = 'profile';
  static const String forgotPasswordInLogin = 'forgotPassword?';
  static const String dontHaveAnAcount = 'donHaveAnAcount';
  static const String alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const String btnSignUp = 'btnSignUp';
  static const String btnSignIn = 'btnSignIn';
  static const String enterYourPhone = 'enterYourPhone';
  static const String enterYourPassword = 'enterYourPassword';
  static const String passwordIsRequired = 'passwordIsRequired';
  static const String textErrorPassword = 'textErrorPassword';
  static const String or = 'or';
  static const String ok = 'ok';
  static const String phoneNumberIsRequired = 'phoneNumberIsRequired';

  static const String signup = 'signup';
  static const String login = 'login';
  static const String register = 'register';
  static const String logout = 'logout';
  static const String error = 'error';
  static const String commingSoon = 'commingSoon';
  static const String notAMember = 'notAMember';
  static const String errorSigningInWithGoogle = 'errorSigningInWithGoogle';
  static const String alreadly = 'alreadly';
  static const String changeProfile = 'changeProfile';
  static const String email = 'email';
  static const String firstName = 'firstName';
  static const String enterYourFirstname = 'enterYourFirstname';
  static const String lastName = 'lastName';
  static const String enterYourLastName = 'enterYourLastName';
  static const String phoneNumber = 'phoneNumber';
  static const String enterYourPhoneNumber = 'enterYourPhoneNumber';
  static const String location = 'location';
  static const String enterYourLocation = 'enterYourLocation';
  static const String save = 'save';
  static String success = 'success';
  static String editProfileSuccessfully = 'editProfileSuccessfully';
  static String editProfileError = 'editProfileError';
  static String warning = 'warning';
  static String permissionDenied = 'permissionDenied';
  static String cancel = 'cancel';
  static String settingSystem = 'settingSystem';
  static String yourAccount = 'yourAccount';
  static String saveSuccess = 'saveSuccess';
  static String doLogout = 'doLogout';
  static String booking = 'booking';
  static String favorite = 'doLogout';
  static String history = 'history';
  static String hostel = 'hostel';
  static String myProfile = 'myProfile';
  static String personalDetail = 'personalDetail';
  static String change = 'change';
  static String followers = 'followers';
  static String following = 'following';
  static String passwordChangedSuccessfully = 'passwordChangedSuccessfully';
  static String errorUpdatingPassword = 'errorUpdatingPassword';
  static String documentDoesNotExist = 'documentDoesNotExist';
  static String errorGettingDocument = 'errorGettingDocument';
  static String anUnexpectedErrorOccurred = 'anUnexpectedErrorOccurred';
  static String changePassword = 'changePassword';
  static String oldPassword = 'oldPassword';
  static String newPassword = 'newPassword';
  static String confirmNewPassword = 'confirmNewPassword';
  static String popular = 'popular';
  static String appSetting = 'appSetting';
  static String personalInformation = 'personalInformation';
  static String notificationAndChat = 'notificationAndChat';
  static String privateAndPermissions = 'privateAndPermissions';
  static String passwordAndAccount = 'passwordAndAccount';
  static String changeLanguage = 'changeLanguage';
  static String darkMode = 'darkMode';
  static String guide = 'guide';
  static String feedback = 'feedback';
  static String about = 'about';
  static String qrCode = 'qrCode';

  static const double largeText = 40.0;
  static const double normalText = 22.0;
  static const double smallText = 16.0;
  static const double tinyText = 12.0;

  static const double smallPadding = 6.0;
  static const double defaultPadding = 16.0;
  static const double height25 = 25.0;

  static final kTitleTextStyle =
      const TextStyle(fontSize: 35, fontWeight: FontWeight.bold);
  static final kSecondaryTextStyle = TextStyle(
    color: Colors.grey.shade400,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    fontFamily: "Varela",
  );
  final kDonutCardTextStyle = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  double baseHeight = 650.0;

  double screenAwareSize(double size, BuildContext context) {
    return size * MediaQuery.of(context).size.height / baseHeight;
  }
}

const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
