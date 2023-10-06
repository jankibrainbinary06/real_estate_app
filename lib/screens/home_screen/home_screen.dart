import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/home_screen/home_controller.dart';
import 'package:real_estate_app/screens/home_screen/widgets/filter_bottomsheet.dart';
import 'package:real_estate_app/screens/home_screen/widgets/location_bottomsheet.dart';
import 'package:real_estate_app/screens/notification_screen/notification_screen.dart';
import 'package:real_estate_app/utils/color_res.dart';
import 'package:real_estate_app/utils/string_res.dart';

import '../../utils/asset_res.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        body: GetBuilder<HomeController>(
          id: 'home',
          builder: (controller) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: Get.height * 0.3,
                          width: Get.width,
                          color: Colors.transparent,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorRes.appColor.withOpacity(
                                0.25,
                              ),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(17),
                                  bottomLeft: Radius.circular(17))),
                          height: Get.height * 0.26,
                          width: Get.width,
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.08,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: Container(
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
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorRes.black
                                                      .withOpacity(
                                                    0.15,
                                                  ),
                                                  blurRadius: 3,
                                                  spreadRadius: -2,
                                                  offset: const Offset(3, 3)),
                                            ]),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AssetRes.location,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              StringRes.jakarta,
                                              style: lato25500.copyWith(
                                                  color: ColorRes.appColor,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        showLocationBottomSheet(context);
                                      },
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => NotificationScreen());
                                      },
                                      child: Image.asset(
                                        AssetRes.notification,
                                        height: 26,
                                        width: 26,
                                        scale: 4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 54,
                              width: Get.width * 0.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: ColorRes.colorF6F6F6,
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorRes.black.withOpacity(
                                          0.15,
                                        ),
                                        blurRadius: 3,
                                        spreadRadius: -2,
                                        offset: const Offset(3, 3)),
                                  ]),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    AssetRes.search,
                                    height: 25,
                                    width: 25,
                                    fit: BoxFit.contain,
                                    scale: 4,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      controller:
                                          homeController.searchController,
                                      decoration: InputDecoration(
                                        hintText: StringRes.searchHouse,
                                        border: InputBorder.none,
                                        hintStyle: lato14400.copyWith(
                                          color: ColorRes.colorA1A5C1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              showFilterBottomSheet(context);
                            },
                            child: Container(
                              height: 54,
                              width: Get.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: ColorRes.colorF6F6F6,
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorRes.black.withOpacity(
                                          0.15,
                                        ),
                                        blurRadius: 3,
                                        spreadRadius: -2,
                                        offset: const Offset(3, 3)),
                                  ]),
                              child: Image.asset(
                                AssetRes.settingMenu,
                                height: 28,
                                width: 28,
                                scale: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        SizedBox(
                          height: 62,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  homeController.onTapPType(index);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      color: homeController.pTypeBoolList[index]
                                          ? ColorRes.appColor
                                          : ColorRes.colorF6F6F6,
                                      border: Border.all(
                                        color: ColorRes.colorECEDF3,
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorRes.black.withOpacity(
                                              0.15,
                                            ),
                                            blurRadius: 3,
                                            spreadRadius: -2,
                                            offset: const Offset(3, 3)),
                                      ]),
                                  child: Text(
                                    StringRes.apartment,
                                    style: lato25500.copyWith(
                                        color:
                                            homeController.pTypeBoolList[index]
                                                ? ColorRes.white
                                                : ColorRes.appColor,
                                        fontSize: 13),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              StringRes.featuredEstate,
                              style: lato20700.copyWith(
                                  color: ColorRes.color252B5C, fontSize: 18),
                            ),
                            const Spacer(),
                            Text(
                              StringRes.viewAll,
                              style: lato14400.copyWith(
                                  color: ColorRes.color6D718B,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        SizedBox(
                          height: Get.height * 0.25,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    width: Get.width * 0.9,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: ColorRes.colorF6F6F6,
                                        border: Border.all(
                                          color: ColorRes.colorBDBFCE,
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorRes.black.withOpacity(
                                                0.15,
                                              ),
                                              blurRadius: 3,
                                              spreadRadius: -1,
                                              offset: const Offset(4, 4)),
                                        ]),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          height: Get.height * 0.22,
                                          width: Get.height * 0.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: ColorRes.appColor,
                                                  width: 1),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  AssetRes.introHome1,
                                                ),
                                                fit: BoxFit.cover,
                                              )),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: ColorRes.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: homeController
                                                              .featuredBoolList[
                                                          index]
                                                      ? Image.asset(
                                                          AssetRes.heartFilled,
                                                          color: Colors.red,
                                                          scale: 5.5,
                                                        )
                                                      : Image.asset(
                                                          AssetRes.heart,
                                                          color: Colors.red,
                                                          scale: 5.5,
                                                        ),
                                                ),
                                                onTap: () {
                                                  homeController
                                                      .onTapFeatured(index);
                                                },
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 6),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    8,
                                                  ),
                                                  color: ColorRes.colorF6F6F6,
                                                  border: Border.all(
                                                    color: ColorRes.colorECEDF3,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Text(
                                                  StringRes.apartment,
                                                  style: lato20700.copyWith(
                                                      color: ColorRes.appColor,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  'Sky Dandelions Apartment',
                                                  style: lato14400.copyWith(
                                                      color:
                                                          ColorRes.color252B5C,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star_sharp,
                                                    color: ColorRes.colorFFC42D,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    '4.9',
                                                    style: lato14400.copyWith(
                                                        fontSize: 12,
                                                        color: ColorRes
                                                            .color6D718B,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AssetRes.location,
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    StringRes.jakarta,
                                                    style: mont16400.copyWith(
                                                        fontSize: 12,
                                                        color: ColorRes
                                                            .color6D718B),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$ 290',
                                                    style: mont16400.copyWith(
                                                        color:
                                                            ColorRes.appColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    '/month',
                                                    style: mont16400.copyWith(
                                                        color:
                                                            ColorRes.appColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: ColorRes.color3F467C
                                              .withOpacity(0.69)),
                                      child: Text(
                                        StringRes.for1 + StringRes.rent,
                                        style: lato14400.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: ColorRes.white),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                            itemCount: 4,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              StringRes.exploreNeatBY,
                              style: lato20700.copyWith(
                                  color: ColorRes.color252B5C, fontSize: 18),
                            ),
                            const Spacer(),
                            Text(
                              StringRes.viewAll,
                              style: lato14400.copyWith(
                                  color: ColorRes.color6D718B,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: Get.height * 0.27,
                              margin: const EdgeInsets.only(bottom: 10),
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: ColorRes.colorF6F6F6,
                                  border: Border.all(
                                    color: ColorRes.colorBDBFCE,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorRes.black.withOpacity(
                                          0.15,
                                        ),
                                        blurRadius: 3,
                                        spreadRadius: -1,
                                        offset: const Offset(4, 4)),
                                  ]),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    padding: const EdgeInsets.all(8),
                                    height: Get.height * 0.24,
                                    width: Get.height * 0.24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: ColorRes.appColor, width: 1),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            AssetRes.introHome2,
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: const BoxDecoration(
                                              color: ColorRes.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: homeController
                                                    .nearByBoolLIst[index]
                                                ? Image.asset(
                                                    AssetRes.heartFilled,
                                                    color: Colors.red,
                                                    scale: 5.5,
                                                  )
                                                : Image.asset(
                                                    AssetRes.heart,
                                                    color: Colors.red,
                                                    scale: 5.5,
                                                  ),
                                          ),
                                          onTap: () {
                                            homeController.onTapNearBY(index);
                                          },
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 80,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  8,
                                                ),
                                                color: ColorRes.white
                                                    .withOpacity(0.5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '\$ 290',
                                                    style: mont16400.copyWith(
                                                      color: ColorRes.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    '/month',
                                                    style: mont16400.copyWith(
                                                        color: ColorRes.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.25,
                                        child: Text(
                                          'Wings Tower',
                                          style: lato14400.copyWith(
                                              color: ColorRes.color252B5C,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: ColorRes.color3F467C
                                                .withOpacity(0.69)),
                                        child: Text(
                                          StringRes.for1 + StringRes.rent,
                                          style: lato14400.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 9,
                                              color: ColorRes.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.star_sharp,
                                        color: ColorRes.colorFFC42D,
                                        size: 15,
                                      ),
                                      Text(
                                        '4.9',
                                        style: lato14400.copyWith(
                                            fontSize: 10,
                                            color: ColorRes.color6D718B,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        AssetRes.location,
                                        height: 10,
                                        width: 10,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        StringRes.jakarta,
                                        style: lato25500.copyWith(
                                            color: ColorRes.appColor,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.59,
                                  mainAxisSpacing: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
