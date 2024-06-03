import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kPrimaryColor,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Lottie.asset('assets/icons/Animation - 1711204899852.json'),
        ),
      ),
    );
  }
}
