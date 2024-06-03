import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/questions/quiz_history_model.dart';
import 'package:flutter_getx_base/modules/message/message.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/theme/theme_helper.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_utils.dart';

class MessageScreen extends GetView<MessageController> {
  MessageScreen({Key? key}) : super(key: key);

  final AppController appController = Get.find();
  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    controller.getHistoryFromSharedPreferences();
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getHistoryFromSharedPreferences();
        },
        child: Scaffold(
          backgroundColor: appController.isDarkModeOn.value
              ? ColorConstants.darkBackground
              : ColorConstants.lightBackground,
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.all(getSize(20)),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    for (var history in controller.historyList.value ?? [])
                      ItemHistoryWidget(
                        controller: controller,
                        quizHistory: history,
                      ),
                    SizedBox(
                      height: getSize(48),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemHistoryWidget extends StatelessWidget {
  const ItemHistoryWidget({
    Key? key,
    required this.controller,
    required this.quizHistory,
  }) : super(key: key);

  final MessageController controller;
  final QuizHistory quizHistory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: appTheme.blue200, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Correct answer: ${quizHistory.numbCorrectAnswer}",
                style: AppStyles.black000Size18Fw600FfNunito,
              ),
              SizedBox(
                height: getSize(64),
              ),
              Text(
                "${controller.formatDateTime(
                  quizHistory.time,
                )}",
                style: AppStyles.black000Size14Fw400FfNunito,
              ),
            ],
          ),
        ),
        SizedBox(height: getSize(16)),
      ],
    );
  }
}
