import 'package:flutter/material.dart';
import 'package:real_estate_app/commons/text_style.dart';

import '../utils/asset_res.dart';
import '../utils/color_res.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final String? imagePrefix;
  final bool? isObSecure;
  final ValueChanged<String>? onChanged;

  final VoidCallback? onTapEye;
  final VoidCallback? onTapTextField;
  final TextEditingController textEditingController;
  const CommonTextField(
      {Key? key,
      this.hintText,
      this.imagePrefix,
      this.isObSecure,
      required this.textEditingController,
      this.onChanged,
      this.onTapEye,
      this.onTapTextField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ),
          border: Border.all(color: ColorRes.appColor, width: 1)),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
          ),
          Image.asset(
            imagePrefix ?? AssetRes.email,
            scale: 4.5,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              obscureText: isObSecure ?? false,
              onChanged: onChanged ?? (value) {},
              onTap: onTapTextField ?? () {},
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? '',
                hintStyle: lato25500.copyWith(
                  fontSize: 16,
                  color: ColorRes.black.withOpacity(
                    0.30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onTapEye ?? () {},
            child: Image.asset(
              AssetRes.eyeClose,
              scale: 3,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
