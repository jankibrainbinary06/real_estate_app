import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/favourites_screen/favourites_controller.dart';
import 'package:real_estate_app/screens/property_datails_screen/property_datails_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';
import 'package:real_estate_app/utils/string_res.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/asset_res.dart';

class FavouritesScreen extends StatelessWidget {
   FavouritesScreen({Key? key}) : super(key: key);

   final FavouritesController favouritesController = Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child:GetBuilder<FavouritesController>(id: "favourites",builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Center(
                    child: Text(
                      StringRes.favourites,
                      style: lato20700.copyWith(color: ColorRes.appColor,fontWeight: FontWeight.w700,fontSize: 24),
                    ),
                  ),
                  Row(children: [
                    Text(
                      StringRes.estates,
                      style: lato20700.copyWith(color: ColorRes.appColor,fontWeight: FontWeight.w700,fontSize: 24),
                    ),
                  ],)

                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
