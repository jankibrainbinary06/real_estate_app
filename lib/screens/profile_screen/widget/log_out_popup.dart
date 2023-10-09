import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';

import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';

openScreen(BuildContext context, {int? index}) {
  showDialog(
    barrierColor: ColorRes.black.withOpacity(0.69),
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          Container(
            height: Get.height * 0.42,
            width: Get.width * 0.8,
            decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(color: ColorRes.appColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: ColorRes.black.withOpacity(0.8),
                  ),
                ),
              ),
              Image.asset(
                AssetRes.logout,
                height: Get.height * 0.075,
                width: 44,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              SizedBox(
                width: Get.width * 0.6,
                child: Text(StringRes.areYou,
                    textAlign: TextAlign.center,
                    style: lato20700.copyWith(
                        color: ColorRes.black.withOpacity(
                          0.8,
                        ),
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.045),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.08,
                          decoration: BoxDecoration(
                              color: ColorRes.appColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(StringRes.yes, style: lato20700),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.08,
                          decoration: BoxDecoration(
                              color: ColorRes.white,
                              border: Border.all(
                                  width: 1, color: ColorRes.appColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(StringRes.no,
                              style:
                                  lato20700.copyWith(color: ColorRes.appColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer()
            ]),
          )
        ],
      );
    },
  );
}
