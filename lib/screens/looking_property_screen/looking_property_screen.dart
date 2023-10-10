import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/looking_property_screen/looking_property_controller.dart';

import 'package:real_estate_app/screens/propety_type_screen/property_type_screen.dart';
import 'package:real_estate_app/utils/string_res.dart';

import '../../commons/common_button.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';

class LookingPropertyScreen extends StatelessWidget {
  LookingPropertyScreen({Key? key}) : super(key: key);
  final LookingPropertyController lookingPropertyController =
      Get.put(LookingPropertyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
          child: GetBuilder<LookingPropertyController>(
        id: "looking",
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: Text(
                    StringRes.lookingPropertyFor,
                    style: lato25500.copyWith(color: ColorRes.appColor),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.028,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          lookingPropertyController.isRent = false;
                          lookingPropertyController.isBuy = true;
                          lookingPropertyController.update(['looking']);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: lookingPropertyController.isBuy
                                ? ColorRes.appColor
                                : ColorRes.colorF6F6F6,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorRes.black.withOpacity(0.15),
                                  blurRadius: 2.6,
                                  spreadRadius: -1,
                                  offset: const Offset(4, 4))
                            ],
                            border: Border.all(
                                color: ColorRes.colorD8DAEC, width: 0.2),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Image.asset(
                                  AssetRes.buyHome,
                                  height: Get.height * 0.23,
                                  width: Get.width * 0.4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.017,
                              ),
                              Text(
                                StringRes.buy,
                                style: lato20700.copyWith(
                                    color: lookingPropertyController.isBuy
                                        ? ColorRes.white
                                        : ColorRes.appColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          lookingPropertyController.isBuy = false;
                          lookingPropertyController.isRent = true;
                          lookingPropertyController.update(['looking']);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: lookingPropertyController.isRent
                                ? ColorRes.appColor
                                : ColorRes.colorF6F6F6,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorRes.black.withOpacity(0.15),
                                  blurRadius: 2.6,
                                  spreadRadius: -1,
                                  offset: const Offset(4, 4))
                            ],
                            border: Border.all(
                                color: ColorRes.colorD8DAEC, width: 0.2),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Image.asset(
                                  AssetRes.rentHome,
                                  height: Get.height * 0.23,
                                  width: Get.width * 0.4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.017,
                              ),
                              Text(
                                StringRes.rent,
                                style: lato20700.copyWith(
                                    color: lookingPropertyController.isRent
                                        ? ColorRes.white
                                        : ColorRes.appColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.12,
                ),
                CommonButton(
                  onTap: () {
                    if (lookingPropertyController.isBuy ||
                        lookingPropertyController.isRent) {
                      Get.to(() => PropertyTypeScreen());
                    } else {
                      Get.snackbar('Error', 'Please select property type!',
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 1),
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
