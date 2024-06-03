import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_getx_base/shared/constants/image_constant.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../routes/app_pages.dart';
import '../../shared/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController = StreamController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignmentGeometry) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignmentGeometry,
          child: Image.asset(
            image,
            height: 425,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: 24 * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.graySecondSize14Fw400FfNunito,
              ),
              SizedBox(
                height: getSize(16),
              ),
              Text(
                description,
                style: AppStyles.graySecondSize14Fw400FfNunito,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGray,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  ImageConstant.imgSplash1,
                  'Quiz Game',
                  'To test knowledge or skills through questions and answers',
                  Alignment.topCenter),
              _buildItemIntroScreen(
                  ImageConstant.imgSplash3,
                  'Explore',
                  'Explore the world of quizzes with our Quiz Game app',
                  Alignment.topCenter),
              _buildItemIntroScreen(
                  ImageConstant.imgSplash2,
                  'Get ready',
                  'Whether you\'re a trivia enthusiast or just looking for some fun',
                  Alignment.topCenter),
            ],
          ),
          Positioned(
            left: getSize(24),
            right: getSize(24),
            bottom: getSize(24),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 6,
                      dotHeight: 6,
                      activeDotColor: ColorConstants.accent1,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child: ButtonWidget(
                        textBtn: snapshot.data != 2 ? 'Next' : 'Get started',
                        onTap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          } else {
                            Get.offNamed(Routes.HOME);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
