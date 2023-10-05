import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/utils/color_res.dart';

import '../../utils/asset_res.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              width: Get.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.colorECEDF3,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AssetRes.location,
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
