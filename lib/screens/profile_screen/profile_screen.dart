import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/profile_screen/profile_controller.dart';
import 'package:real_estate_app/screens/profile_screen/widget/log_out_popup.dart';
import 'package:real_estate_app/screens/setting_screen/settings_screen.dart';

import '../../commons/text_style.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              Center(
                child: Text(
                  StringRes.profile,
                  style: lato25500.copyWith(
                      color: ColorRes.appColor, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                  width: Get.width * 0.47,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: ColorRes.colorF6F6F6,
                      border: Border.all(
                        color: ColorRes.colorBDBFCE,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: ColorRes.black.withOpacity(
                              0.15,
                            ),
                            blurRadius: 3,
                            spreadRadius: -1,
                            offset: const Offset(4, 4)),
                      ]),
                  child: Row(
                    children: [
                      Text(
                        'Jessi larva',
                        style: lato25500.copyWith(
                            color: ColorRes.appColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        AssetRes.edit,
                        scale: 3,
                      ),
                    ],
                  )),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                  width: Get.width * 0.73,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: ColorRes.colorF6F6F6,
                      border: Border.all(
                        color: ColorRes.colorBDBFCE,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: ColorRes.black.withOpacity(
                              0.15,
                            ),
                            blurRadius: 3,
                            spreadRadius: -1,
                            offset: const Offset(4, 4)),
                      ]),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetRes.email,
                        scale: 3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Jessilarva@gmail.com',
                        style: lato25500.copyWith(
                            color: ColorRes.appColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Container(
                height: 0.5,
                color: ColorRes.colorC5C5C5,
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SettingScreen());
                },
                child: Row(
                  children: [
                    Image.asset(
                      AssetRes.setting,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      StringRes.setting,
                      style: lato14400.copyWith(
                          fontSize: 18, color: ColorRes.appColor),
                    ),
                    const Spacer(),
                    Image.asset(
                      AssetRes.arrowNext,
                      scale: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Container(
                height: 0.5,
                color: ColorRes.colorC5C5C5,
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              GestureDetector(
                onTap: () {
                  openScreen(context);
                },
                child: Row(
                  children: [
                    Image.asset(
                      AssetRes.logout,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      StringRes.signOut,
                      style: lato14400.copyWith(
                          fontSize: 18, color: ColorRes.appColor),
                    ),
                    const Spacer(),
                    Image.asset(
                      AssetRes.arrowNext,
                      scale: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Container(
                height: 0.5,
                color: ColorRes.colorC5C5C5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
