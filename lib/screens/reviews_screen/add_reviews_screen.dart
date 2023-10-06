import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/favourites_screen/favourites_controller.dart';
import 'package:real_estate_app/screens/home_screen/home_controller.dart';
import 'package:real_estate_app/screens/property_datails_screen/property_datails_controller.dart';
import 'package:real_estate_app/screens/reviews_screen/reviews_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';
import 'package:real_estate_app/utils/string_res.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/asset_res.dart';

class AddReviewsScreen extends StatelessWidget {
   AddReviewsScreen({Key? key}) : super(key: key);

   final ReviewsController reviewsController = Get.put(ReviewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child:GetBuilder<ReviewsController>(id: "reviews",builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: ColorRes.black.withOpacity(0.8),
                        ),
                      ),
                      Center(
                        child: Text(
                          StringRes.reviews,
                          style: lato20700.copyWith(color: ColorRes.appColor,fontWeight: FontWeight.w700,fontSize: 24),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  controller.commonTextFiled(textController: controller.nameController,
                      hedarNameText: "Name",hintText: StringRes.typeYourName),
                  SizedBox(height: Get.height * 0.04,),
                  controller.commonTextFiled(maxLines: 4,Containerheight: 130.0,textController: controller.describeController,
                      hedarNameText: "How was your experience ?",hintText: StringRes.typeYourName),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Text(
                     "Star Rating :",
                    style: lato20700.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.appColor,
                    ),

                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  RatingBar.builder(
                    initialRating: 5, // Set the initial rating you want to display
                    tapOnlyMode: true, // Set this to false to disable rating changes on tap
                    itemCount: 5,
                    allowHalfRating: true,
                    glow: false,
                    itemSize: 30.0,
                   unratedColor: Colors.black.withOpacity(0.11),

                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rounded,
                      color: ColorRes.colorFFC42D,
                    ), onRatingUpdate: (double value) {  },
                  ),
                  SizedBox(
                    height: Get.height * 0.09,
                  ),
                  Center(
                    child: CommonButton(title: "Submit",
                      onTap: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
