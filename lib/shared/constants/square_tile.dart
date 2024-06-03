import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareTile extends StatelessWidget {
  final String imgPath;
  final Function()? onTap;

  const SquareTile({Key? key, required this.imgPath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16)),
        child: SvgPicture.asset(
          imgPath,
          height: 38,
        ),
      ),
    );
  }
}
