import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/home_screen/home_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';

import '../../../utils/asset_res.dart';
import '../../../utils/string_res.dart';

showLocationBottomSheet(BuildContext context) {
  final HomeController homeController = Get.put(HomeController());

  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 0, sigmaX: 0),
          child: StatefulBuilder(
            builder: (context, update) {
              return Container(
                height: Get.height * 0.68,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          50,
                        ),
                        topRight: Radius.circular(50)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.07,
                      vertical: Get.height * 0.05),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                StringRes.selectLocation,
                                style: lato20700.copyWith(
                                    fontSize: 22, color: ColorRes.appColor),
                              ),
                              Spacer(),
                              CommonButton(
                                onTap: () {},
                                title: StringRes.edit,
                                height: 50,
                                width: Get.width * 0.25,
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          SizedBox(
                            height: Get.height * 0.32,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeController
                                        .onTapLocationBottomSheet(index);
                                    update.call(
                                      () {},
                                    );
                                  },
                                  child: Container(
                                      width: Get.width,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: homeController
                                                  .locationBoolList[index]
                                              ? ColorRes.appColor
                                              : ColorRes.white,
                                          border: Border.all(
                                            color: ColorRes.colorBDBFCE,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    ColorRes.black.withOpacity(
                                                  0.15,
                                                ),
                                                blurRadius: 3,
                                                spreadRadius: -1,
                                                offset: Offset(4, 4)),
                                          ]),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: homeController
                                                        .locationBoolList[index]
                                                    ? ColorRes.white
                                                        .withOpacity(0.30)
                                                    : ColorRes.colorECEDF3,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              homeController
                                                      .locationBoolList[index]
                                                  ? AssetRes.locationWhite
                                                  : AssetRes.locationBlue,
                                              scale: 4,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                              StringRes.petompon,
                                              style: lato14400.copyWith(
                                                color: homeController
                                                        .locationBoolList[index]
                                                    ? ColorRes.white
                                                    : ColorRes.color53587A,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          CommonButton(
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
    },
  );
}
