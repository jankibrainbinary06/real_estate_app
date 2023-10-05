import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/dashboard_screen/dashboard_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';

import '../../../utils/asset_res.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      id: 'bottom',
      builder: (controller) {
        return SafeArea(
          child: Container(
            height: 90,
            decoration: const BoxDecoration(
              color: ColorRes.appColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(
                  40,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.11,
                ),
                tab(AssetRes.homeFilled, AssetRes.home, 0),
                tab(AssetRes.heartFilled, AssetRes.heart, 1),
                tab(AssetRes.chatFilled, AssetRes.chat, 2),
                tab(AssetRes.userFilled, AssetRes.user, 3),
                SizedBox(
                  width: Get.width * 0.11,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget tab(String icon1, String icon2, int index) {
    return GetBuilder<DashBoardController>(
      id: 'bottom',
      builder: (controller) {
        return Expanded(
          child: GestureDetector(
            onTap: () => controller.onBottomBarTaskerChange(index),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                index == controller.tab ? icon1 : icon2,
                height: 20,
                width: 20,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        );
      },
    );
  }
}
