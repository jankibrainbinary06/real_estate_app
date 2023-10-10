import 'package:flutter/material.dart';
import 'package:real_estate_app/commons/text_style.dart';

import '../utils/asset_res.dart';
import '../utils/color_res.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final String? imagePrefix;
  final bool? isObSecure;
  final bool? isEye;
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
      this.onTapTextField,
      this.isEye})
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
            height: 20,
            width: 22,
            color: ColorRes.appColor,
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
          isEye == true
              ? GestureDetector(
                  onTap: onTapEye ?? () {},
                  child: Image.asset(
                    isObSecure == true ? AssetRes.eyeClose : AssetRes.eyeOpen,
                    scale: 3,
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
