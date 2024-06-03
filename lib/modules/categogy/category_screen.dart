import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_base/modules/categogy/category.dart';
import 'package:flutter_getx_base/modules/home/home_tab_controller.dart';
import 'package:flutter_getx_base/modules/main/home_controller.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/theme/theme_helper.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_utils.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final AppController appController = Get.find();
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appController.isDarkModeOn.value
            ? ColorConstants.darkBackground
            : ColorConstants.lightBackground,
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.all(getSize(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Category",
                    style: AppStyles.black000Size18Fw600FfNunito,
                  ),
                ),
                SizedBox(
                  height: getSize(64),
                ),
                GestureDetector(
                  onTap: () => categoryController.callTrueFalseQuestion(),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appTheme.green300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "True/False Question",
                        style: AppStyles.black000Size16Fw600FfNunito,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getSize(32),
                ),
                GestureDetector(
                  onTap: () => categoryController.callChooseQuestion(),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appTheme.amberA700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Choose Question",
                        style: AppStyles.black000Size16Fw600FfNunito,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
