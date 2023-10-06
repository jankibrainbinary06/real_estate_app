import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/home_screen/home_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../utils/asset_res.dart';
import '../../../utils/string_res.dart';

showFilterBottomSheet(BuildContext context) {
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
                height: Get.height * 0.85,
                width: Get.width,
                decoration: const BoxDecoration(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringRes.filter,
                                style: lato20700.copyWith(
                                    fontSize: 22, color: ColorRes.appColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          Text(
                            StringRes.category,
                            style: lato25500.copyWith(
                                fontSize: 16,
                                color: ColorRes.appColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          SizedBox(
                            height: Get.height * 0.07,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 18,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeController.onTapCategory(index);
                                    update.call(
                                      () {},
                                    );
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          13,
                                        ),
                                        color: homeController
                                                .categoryBoolList[index]
                                            ? ColorRes.appColor
                                            : ColorRes.white,
                                        border: Border.all(
                                          color: ColorRes.colorBDBFCE,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        StringRes.all,
                                        style: lato14400.copyWith(
                                          color: homeController
                                                  .categoryBoolList[index]
                                              ? ColorRes.white
                                              : ColorRes.color53587A,
                                        ),
                                      )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            StringRes.priceRange,
                            style: lato25500.copyWith(
                                fontSize: 16,
                                color: ColorRes.appColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          SfRangeSliderTheme(
                            data: SfRangeSliderThemeData(
                              tooltipTextStyle: lato14400.copyWith(
                                  fontSize: 12, color: ColorRes.white),
                              tooltipBackgroundColor: ColorRes.appColor,
                              thumbStrokeWidth: 3,
                              thumbStrokeColor: ColorRes.appColor,
                            ),
                            child: SfRangeSlider(
                              inactiveColor: ColorRes.black.withOpacity(0.15),
                              tooltipTextFormatterCallback:
                                  (dynamic actualValue, String formattedText) {
                                var myVal =
                                    double.parse(actualValue.toString());

                                return '\$ ${myVal.toStringAsFixed(2).toString()}';
                              },
                              min: 0.0,
                              max: 100.0,
                              interval: 1,
                              enableTooltip: true,
                              tooltipShape: const SfRectangularTooltipShape(),
                              endThumbIcon: Image.asset(AssetRes.thumbIcon),
                              startThumbIcon: Image.asset(AssetRes.thumbIcon),
                              activeColor: ColorRes.appColor.withOpacity(0.9),
                              values: homeController.values,
                              onChanged: (SfRangeValues newValues) {
                                homeController.values = newValues;
                                update.call(
                                  () {},
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            StringRes.facilities,
                            style: lato25500.copyWith(
                                fontSize: 16,
                                color: ColorRes.appColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          SizedBox(
                            height: Get.height * 0.07,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 18,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeController.onTapFacility(index);
                                    update.call(
                                      () {},
                                    );
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          13,
                                        ),
                                        color: homeController
                                                .facilityBoolList[index]
                                            ? ColorRes.appColor
                                            : ColorRes.white,
                                        border: Border.all(
                                          color: ColorRes.colorBDBFCE,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        StringRes.all,
                                        style: lato14400.copyWith(
                                          color: homeController
                                                  .facilityBoolList[index]
                                              ? ColorRes.white
                                              : ColorRes.color53587A,
                                        ),
                                      )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            StringRes.rating,
                            style: lato25500.copyWith(
                                fontSize: 16,
                                color: ColorRes.appColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 15,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController.rating.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeController.onTapRating(index);
                                    update.call(
                                      () {},
                                    );
                                  },
                                  child: Container(
                                      width: 40,
                                      margin: const EdgeInsets.only(bottom: 5),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        color:
                                            homeController.ratingBoolList[index]
                                                ? ColorRes.appColor
                                                : ColorRes.white,
                                        border: Border.all(
                                          color: ColorRes.colorBDBFCE,
                                          width: 1,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_sharp,
                                            color: ColorRes.colorFFC42D,
                                            size: 15,
                                          ),
                                          Text(
                                            homeController.rating[index],
                                            style: lato14400.copyWith(
                                                color: homeController
                                                        .ratingBoolList[index]
                                                    ? ColorRes.white
                                                    : ColorRes.color53587A,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: Get.height * 0.1,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.onTapReset();
                                    update.call(
                                      () {},
                                    );
                                  },
                                  child: Container(
                                    height: 54,
                                    width: Get.width * 0.7,
                                    decoration: BoxDecoration(
                                      color: ColorRes.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: ColorRes.appColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        StringRes.reset,
                                        style: lato20700.copyWith(
                                            color: ColorRes.appColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                  child: CommonButton(
                                onTap: () {
                                  Get.back();
                                },
                                title: StringRes.apply,
                              )),
                            ],
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
