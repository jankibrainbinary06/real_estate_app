import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/favourites_screen/favourites_controller.dart';
import 'package:real_estate_app/screens/home_screen/home_controller.dart';

import 'package:real_estate_app/utils/color_res.dart';
import 'package:real_estate_app/utils/string_res.dart';

import '../../utils/asset_res.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({Key? key}) : super(key: key);

  final FavouritesController favouritesController =
      Get.put(FavouritesController());
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    debugPrint('${Get.height}');
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: GetBuilder<FavouritesController>(
          id: "favourites",
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Center(
                    child: Text(
                      StringRes.favourites,
                      style: lato20700.copyWith(
                          color: ColorRes.appColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringRes.estates,
                        style: lato25500.copyWith(
                            color: ColorRes.appColor, fontSize: 18),
                      ),
                      Container(
                        height: 40,
                        width: 93,
                        decoration: BoxDecoration(
                            color: ColorRes.colorF6F6F6,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: [
                          InkWell(
                            onTap: () {
                              controller.isVertical = true;
                              controller.isHorizontal = false;
                              controller.update(['favourites']);
                            },
                            child: Container(
                              height: 40,
                              width: 46.5,
                              decoration: BoxDecoration(
                                  color: controller.isVertical
                                      ? ColorRes.appColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          controller.isVertical != true
                                              ? AssetRes.verticalInactive
                                              : AssetRes.verticalUnInactive),
                                      scale: 4)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.isVertical = false;
                              controller.isHorizontal = true;
                              controller.update(['favourites']);
                            },
                            child: Container(
                              height: 40,
                              width: 46.5,
                              decoration: BoxDecoration(
                                  color: controller.isHorizontal
                                      ? ColorRes.appColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(controller.isHorizontal
                                          ? AssetRes.horizontalActive
                                          : AssetRes.horizontalUnActive),
                                      scale: 4)),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  controller.isHorizontal != true
                      ? Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
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
                                                    child: Image.asset(
                                                      AssetRes.heartFilled,
                                                      color: Colors.red,
                                                      scale: 5.5,
                                                    )),
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
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
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
                                                height: 5,
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
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$ 290',
                                                    style: mont16400.copyWith(
                                                      color: ColorRes.appColor,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
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
                        )
                      : Expanded(
                          child: GridView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            //shrinkWrap: true,
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
                                    const Expanded(
                                      child: SizedBox(
                                        height: 8,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      padding: const EdgeInsets.all(8),
                                      height: Get.height * 0.24,
                                      width: Get.height * 0.24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: ColorRes.appColor,
                                              width: 1),
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
                                                child: Image.asset(
                                                  AssetRes.heartFilled,
                                                  color: Colors.red,
                                                  scale: 5.5,
                                                )),
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
                                    childAspectRatio: 0.61,
                                    mainAxisSpacing: 15),
                          ),
                        ),
                  //    SizedBox(height: Get.height * 0.3,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
