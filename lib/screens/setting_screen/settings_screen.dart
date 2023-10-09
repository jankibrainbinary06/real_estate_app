import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/setting_screen/setting_controller.dart';

import '../../commons/text_style.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        toolbarHeight: 70,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_outlined)),
        title: Text(
          StringRes.setting,
          style: lato25500.copyWith(
              color: ColorRes.appColor, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: GetBuilder<SettingController>(
        id: 'setting',
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.025),
                Row(
                  children: [
                    Image.asset(
                      AssetRes.notification2,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      StringRes.pushNotification,
                      style: lato14400.copyWith(
                          fontSize: 18, color: ColorRes.appColor),
                    ),
                    const Spacer(),
                    Switch(
                      activeTrackColor: ColorRes.appColor.withOpacity(0.5),
                      inactiveTrackColor: ColorRes.black.withOpacity(0.25),
                      thumbColor:
                          const MaterialStatePropertyAll(ColorRes.appColor),
                      trackOutlineColor:
                          const MaterialStatePropertyAll(ColorRes.white),
                      trackOutlineWidth: const MaterialStatePropertyAll(12),
                      value: settingController.isSwitch,
                      onChanged: (value) {
                        settingController.isSwitch = value;
                        settingController.update(['setting']);
                      },
                      thumbIcon: const MaterialStatePropertyAll(
                        Icon(
                          Icons.radar_outlined,
                          color: ColorRes.appColor,
                        ),
                      ),
                    ),
                  ],
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
                Row(
                  children: [
                    Image.asset(
                      AssetRes.forgetPass,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      StringRes.forgetPassword,
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
                SizedBox(
                  height: Get.height * 0.035,
                ),
                Container(
                  height: 0.5,
                  color: ColorRes.colorC5C5C5,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
