import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/utils/color_res.dart';

import '../utils/string_res.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final String? image;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final double? width;
  final double? height;
  final bool? isShowIcon;

  const CommonButton(
      {super.key,
      this.title,
      required this.onTap,
      this.borderRadius,
      this.color,
      this.height,
      this.width, this.isShowIcon, this.image,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 54,
        width: width ?? Get.width * 0.7,
        decoration: BoxDecoration(
          color: ColorRes.appColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isShowIcon==true?Image.asset(
              image ?? "",
              height: 20,
              width: 20,
              fit: BoxFit.fitHeight,
            ):SizedBox(),
            SizedBox(width: 7,),
            Text(
              title ?? StringRes.next,
              style: lato20700,
            ),
          ],
        ),
      ),
    );
  }
}
