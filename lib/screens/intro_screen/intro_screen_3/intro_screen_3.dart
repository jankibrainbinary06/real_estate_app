import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/intro_screen/intro_screen_3/intro_controller_3.dart';

import '../../../commons/text_style.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';
import '../../looking_property_screen/looking_property_screen.dart';

class IntroScreen3 extends StatelessWidget {
  IntroScreen3({Key? key}) : super(key: key);
  final IntroController3 introController = Get.put(IntroController3());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Text(
                                StringRes.skip,
                                style: mont16400,
                              ),
                              onTap: () {
                                Get.to(() => LookingPropertyScreen());
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          StringRes.findPerfect,
                          style: lato25500,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringRes.your,
                              style: lato25500,
                            ),
                            Text(
                              StringRes.futureHouse,
                              style: latoBold.copyWith(
                                  color: ColorRes.appColor,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.026,
                        ),
                        Text(
                          StringRes.whereDream,
                          style: lato14400,
                        ),
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          AssetRes.introHome3,
                          height: Get.height * 0.65,
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LookingPropertyScreen());
                            },
                            child: Container(
                              width: Get.width * 0.48,
                              height: Get.height * 0.08,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorRes.appColor,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Text(
                                StringRes.getStarted,
                                style: lato20700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
