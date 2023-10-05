import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/splash_screen/splash_controller.dart';
import 'package:real_estate_app/utils/asset_res.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController splashController = Get.put(SplashController());
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
