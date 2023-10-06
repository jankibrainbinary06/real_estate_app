import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/favourites_screen/favourites_controller.dart';
import 'package:real_estate_app/screens/home_screen/home_controller.dart';
import 'package:real_estate_app/screens/property_datails_screen/property_datails_controller.dart';
import 'package:real_estate_app/screens/reviews_screen/add_reviews_screen.dart';
import 'package:real_estate_app/screens/reviews_screen/reviews_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';
import 'package:real_estate_app/utils/string_res.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/asset_res.dart';

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({Key? key}) : super(key: key);

  final ReviewsController reviewsController = Get.put(ReviewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: GetBuilder<ReviewsController>(
          id: "reviews",
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          style: lato20700.copyWith(
                              color: ColorRes.appColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1,275 ${StringRes.reviews}",
                            style: lato20700.copyWith(
                                color: ColorRes.appColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star_sharp,
                                color: ColorRes.colorFFC42D,
                                size: 16,
                              ),
                              Text(
                                '4.8',
                                style: lato14400.copyWith(
                                    fontSize: 12,
                                    color: ColorRes.color6D718B,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(AddReviewsScreen());
                        },
                        child: Container(
                          height: 40,
                          width: 115,
                          decoration: BoxDecoration(
                              color: ColorRes.appColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetRes.EditSquare,
                                  height: 18,
                                  width: 18,
                                  fit: BoxFit.fitHeight,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  " ${StringRes.addReview}",
                                  style: Mulish13700.copyWith(
                                      color: ColorRes.white),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListView.separated(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.colorBDBFCE),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorRes.black.withOpacity(
                                    0.15,
                                  ),
                                  blurRadius: 1.95,
                                  spreadRadius: -1,
                                  offset: Offset(4.59, 2)),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(AssetRes.User),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Jin Martin",
                                            style: lato20700.copyWith(
                                                color: ColorRes.appColor,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.21,
                                          ),
                                          RatingBar.builder(
                                            maxRating: 5, minRating: 5,
                                            initialRating:
                                                5, // Set the initial rating you want to display
                                            tapOnlyMode:
                                                true, // Set this to false to disable rating changes on tap
                                            itemCount: 5,
                                            allowHalfRating: true,
                                            glow: false,
                                            itemSize: 16.0,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: ColorRes.colorFFC42D,
                                            ),
                                            onRatingUpdate: (double value) {},
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.65,
                                        child: Text(
                                          StringRes.Lorem,
                                          style: mont16400.copyWith(
                                              color: ColorRes.color252B5C,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Text(
                                        '10 mins ago',
                                        style: lato14400.copyWith(
                                          fontSize: 10,
                                          color: ColorRes.colorA1A5C1,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  )),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
