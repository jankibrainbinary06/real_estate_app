import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/intro_screen/intro_screen_1/intro_controller1.dart';
import 'package:real_estate_app/screens/intro_screen/intro_screen_2/intro_screen_2.dart';

import '../../../commons/text_style.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';
import '../../looking_property_screen/looking_property_screen.dart';

class IntroScreen1 extends StatelessWidget {
  IntroScreen1({Key? key}) : super(key: key);
  final IntroController1 introController = Get.put(IntroController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          toolbarHeight: 0,
        ),
        backgroundColor: ColorRes.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          StringRes.findYourDreamHome,
                          style: lato25500,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringRes.withUs,
                              style: lato25500,
                            ),
                            Text(
                              StringRes.goodPrice,
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
                          StringRes.getMore,
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
                          AssetRes.introHome1,
                          height: Get.height * 0.65,
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => IntroScreen2());
                            },
                            child: Container(
                              width: Get.width * 0.4,
                              height: Get.height * 0.08,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorRes.appColor,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Text(
                                StringRes.next,
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
