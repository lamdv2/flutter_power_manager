import 'package:flutter/material.dart';

class ColorConstants {
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = const Color(0xFFF6F6F6);
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color black = const Color(0xFF000000);
  static Color blackText = const Color.fromARGB(255, 17, 17, 17);
  static Color white = const Color(0xFFFFFFFF);
  static Color red = Colors.red;
  static Color orangerRewardColor = const Color(0xFFF88344);
  static Color greenLightRewardColor = const Color(0xFF2BD2AB);
  static Color greenRewardColor = const Color(0XFF94E059);
  static Color purpleRewardColor = const Color(0XFF8989D6);
  static Color yellowRewardColor = const Color(0XFFFFAD0E);
  static Color lightBlueRewardColor = const Color(0XFF5C9CE4);
  // static var primaryColor = const Color(0xff296e48);
  static var primaryColor = const Color(0xff1B9C85);
  static var blackColor = Colors.black54;
  static Color backgroundColor = const Color(0xFFF5F5F5);
  static Color backgroundColorButtonBlue = const Color(0xFF0256D9);
  static var grey800 = Colors.grey[800];
  static Color colorDarkModeBlue = const Color(0xFF5C9CE4);
  static Color colorDarkModeDisable = const Color(0xFF262626);

  static const Color kPrimaryColor = Color(0xFF0043AB);
  static const Color kPrimaryLightColor = Color(0xFFF1E6FF);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color nearlyWhite = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkerText = Color(0xFF17262A);
  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color greenColor = Color(0xff00FF00);
  static const Color greyColor = Color(0xffC0C0C0);
  static const Color redColor = Color(0xffFF0000);
  static const Color lightGreenColor = Color(0xFF94E059);
  static const Color orangeColor = Color(0xFFFF5630);
  static const Color lightBlueColor = Color(0xFF5C9CE4);

  static const Color botTitle = Color(0xFF313131);
  static const Color graySecond = Color(0xFF878787);
  static const Color titleSearch = Color(0xFF636363);
  static const Color blue = Color(0xFF2185D5);
  static const Color blueSecond = Color(0xFF237CEF);
  static const Color gray = Color(0xFFD0D0D0);

  // Gray
  static const Color gray100 = Color(0XFFF6F6F6);
  static const Color gray200 = Color(0XFF4E4B66);
  static const Color gray300 = Color(0XFFE6E6E6);
  static const Color gray400 = Color(0XFFBFBFBF);
  static const Color gray500 = Color(0XFF999999);
  static const Color gray600 = Color(0XFF737373);
  static const Color gray700 = Color(0xFFF7F7F7);

  static const Color borderGray = Color(0xFFE7E7E7);

  static const Color accent1 = Color(0xFF616161);
  static const Color accent2 = Color(0xFF757575);
  static const Color grayTextField = Color(0xFFf2f5fc);
  static const Color btnGradient = Color(0xFF1B9C85 );
  static const Color nextColor = Color(0xFF86CEC1 );
  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color text1Color = Color(0xFF323B4B);
  static const Color btnCanCel = Color(0xFFD9D9D9);

  // Light theme
  // Status bar
  static const Color lightStatusBar = Color(0xFFE0E0E0);
  // App bar
  static const Color lightAppBar = Color(0xFFF5F5F5);
  // Background
  static const Color lightBackground = Color(0xFFF7F7F7);
  // Cards
  static Color? lightCard = white;

  // Dark theme
  // Status bar
  static Color darkStatusBar = black;
  // App bar
  static const Color darkAppBar = Color(0xFF212121);
  // Background
  static const Color darkBackground = Color(0xFF303030);
  // Cards
  static const Color darkCard = Color(0xFF424242);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ColorConstants.btnGradient,
      ColorConstants.nextColor,
    ],
  );

  static const Gradient defaultGradientButtonCancel = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorConstants.dividerColor,
      ColorConstants.btnCanCel,
    ],
  );

  static const Gradient defaultGradientButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      Gradients.lightBlue1,
      Gradients.lightBlue2,
    ],
  );

  static const lightBlue1 = Color(0xFF449EFF);
  static const lightBlue2 = Color(0xFF1DC7F7);
  static const darkGreyNon = Color(0x22264444);
  static const darkGreyMid = Color(0x3C2B3050);
  static const darkGrey = Color(0xFF222644);
  static const promo1 = Color(0xFF3E60F9);
  static const promo2 = Color(0xFF3A52FF);
}
