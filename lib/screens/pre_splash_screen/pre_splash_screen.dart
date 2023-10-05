import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/pre_splash_screen/pre_splash_controller.dart';

import '../../utils/asset_res.dart';

class PreSplashScreen extends StatelessWidget {
  PreSplashScreen({Key? key}) : super(key: key);
  final PreSplashController splashController = Get.put(PreSplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetRes.splashBg,
                ),
                fit: BoxFit.cover,
                scale: 4)),
        alignment: Alignment.center,
        child: Image.asset(
          AssetRes.logoText,
          scale: 4,
          height: 40,
        ),
      ),
    );
  }
}
