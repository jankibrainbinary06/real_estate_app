import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/property_datails_screen/property_datails_controller.dart';
import 'package:real_estate_app/utils/color_res.dart';
import 'package:real_estate_app/utils/string_res.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/asset_res.dart';

class PropertyDetailsScreen extends StatelessWidget {
  PropertyDetailsScreen({Key? key}) : super(key: key);

  final PropertyDatailsController propertyDatailsController =
      Get.put(PropertyDatailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: GetBuilder<PropertyDatailsController>(
          id: "propertydatails",
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
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
                        Text(
                          StringRes.skyDandelions,
                          style: lato25500.copyWith(
                              color: ColorRes.appColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorRes.colorBDBFCE)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.4,
                                child: PageView.builder(
                                  controller: controller.pageController,
                                  onPageChanged: (value) {
                                    controller.currentPage = value;
                                  },
                                  itemCount: 3,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: ColorRes.appColor),
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                AssetRes.buyHome,
                                              ))),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.center,
                                              margin: const EdgeInsets.only(
                                                  left: 10, top: 10),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: InkWell(
                                                  onTap: () {
                                                    if (controller.isLike ==
                                                        false) {
                                                      controller.isLike = true;
                                                      controller.update(
                                                          ['propertydatails']);
                                                    } else {
                                                      controller.isLike = false;
                                                      controller.update(
                                                          ['propertydatails']);
                                                    }
                                                  },
                                                  child: controller.isLike
                                                      ? const Icon(
                                                          Icons.favorite,
                                                          color:
                                                              ColorRes.redColor,
                                                          size: 18,
                                                        )
                                                      : const Icon(
                                                          Icons.favorite_border,
                                                          color:
                                                              ColorRes.redColor,
                                                          size: 18,
                                                        )),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 90,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: ColorRes.appColor),
                                              child: Text(
                                                StringRes.rent,
                                                style: lato25500.copyWith(
                                                    color: ColorRes.white),
                                              ),
                                            )
                                          ]),
                                    );
                                  },
                                ),
                              ),
                              Center(
                                child: SmoothPageIndicator(
                                  controller: controller.pageController,
                                  count: 3,
                                  effect: const ExpandingDotsEffect(
                                      dotHeight: 5,
                                      dotWidth: 5,
                                      expansionFactor: 5,
                                      activeDotColor: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      StringRes.skyDandelions,
                                      style: lato20700.copyWith(
                                          color: ColorRes.appColor),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: ColorRes.appColor, size: 15),
                                      Text(
                                        "Jakarta, Indonesia",
                                        style: mont16400.copyWith(
                                            color: ColorRes.appColor,
                                            fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 74,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: ColorRes.appColor
                                            .withOpacity(0.15)),
                                    child: Text(
                                      StringRes.apartment,
                                      style: lato20700.copyWith(
                                          color: ColorRes.appColor,
                                          fontSize: 10),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade700,
                                        size: 18,
                                      ),
                                      Text(
                                        "4.8(1,275 Reviews)",
                                        style: lato20700.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: ColorRes.color53587A,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '\$290',
                                          style: mont16400.copyWith(
                                              color: ColorRes.appColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        TextSpan(
                                            text: '/month',
                                            style: lato25500.copyWith(
                                                color: ColorRes.color252B5C,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  controller.commonRow(
                                      image: AssetRes.emojioneMonotoneBed,
                                      text: "Beds",
                                      number: 5),
                                  controller.commonRow(
                                      image: AssetRes.bxsBath,
                                      text: "Baths",
                                      number: 3),
                                  controller.commonRow(
                                      image: AssetRes.carbonWorkspace,
                                      text: "Sqft",
                                      number: 2000),
                                ],
                              ),
                              Divider(
                                color: ColorRes.black.withOpacity(0.15),
                              ),
                              Text(
                                StringRes.appartmentAddress,
                                style: lato20700.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ColorRes.color252B5C,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                StringRes.Lorem,
                                style: mont16400.copyWith(
                                    color: ColorRes.color252B5C, fontSize: 13),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringRes.description,
                                style: lato20700.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ColorRes.color252B5C,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                StringRes.Lorem,
                                style: mont16400.copyWith(
                                    color: ColorRes.color252B5C, fontSize: 13),
                              ),
                              Visibility(
                                visible: controller.isReadMore,
                                child: Text(
                                  StringRes.Lorem,
                                  style: mont16400.copyWith(
                                      color: ColorRes.color252B5C,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              InkWell(
                                onTap: () {
                                  if (controller.isReadMore != true) {
                                    controller.isReadMore = true;
                                    controller.update(['propertydatails']);
                                  } else {
                                    controller.isReadMore = false;
                                    controller.update(['propertydatails']);
                                  }
                                },
                                child: Text(
                                  controller.isReadMore != false
                                      ? StringRes.readLess
                                      : StringRes.readMore,
                                  style: lato20700.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorRes.color005BAF,
                                      fontSize: 10),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: Get.width * 0.05),
                                child: CommonButton(
                                  isShowIcon: true,
                                  image: AssetRes.chat,
                                  title: "Chat Now",
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: Get.width * 0.05),
                                child: CommonButton(
                                  isShowIcon: true,
                                  image: AssetRes.call,
                                  title: "Call Now",
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
