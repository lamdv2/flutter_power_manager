import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/constants/app_style.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';

import '../constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.textBtn, this.onTap, this.color, this.gradient})
      : super(key: key);

  final String textBtn;
  final Function()? onTap;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: getSize(8),
          horizontal: getSize(16),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: gradient == null
              ? Gradients.defaultGradientBackground
              : Gradients.defaultGradientButtonCancel,
        ),
        alignment: Alignment.center,
        child: Text(
          textBtn,
          style: color == null
              ? AppStyles.white000Size18Fw500FfNunito
              : TextStyle(
                  fontSize: 18,
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
    );
  }
}
