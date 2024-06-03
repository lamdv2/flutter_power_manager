import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../utils/size_utils.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.leading,
    this.titles,
    this.actions,
    this.backgroundColor,
    this.iconBgrColor,
    this.onTap,
  }) : super(key: key);

  double? height;

  Widget? leading;

  String? titles;

  Color? backgroundColor;

  Color? iconBgrColor;

  List<Widget>? actions;

  Function()? onTap;

  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appController.isDarkModeOn.value
          ? ColorConstants.darkAppBar
          : ColorConstants.primaryColor,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 9,
              bottom: 9,
            ),
            child: InkWell(
              onTap: onTap != null ? () => onTap!() : () => Get.back(),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 2,
                  top: 2,
                  bottom: 2,
                  right: 2,
                ),
                child: Container(
                  padding: EdgeInsets.all(getSize(8)),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorConstants.borderGray.withOpacity(.75),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(200),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/ic_next_left.svg",
                    colorFilter: ColorFilter.mode(
                      iconBgrColor ?? ColorConstants.borderGray,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
      title: Text(
        titles ?? '',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: AppStyles.white000Size20Fw500FfNunito,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height ?? getVerticalSize(getSize(96)));
  }
}
