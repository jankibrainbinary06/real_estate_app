import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/screens/propety_type_screen/property_type_controller.dart';

import '../../commons/text_style.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import '../budget_screen/budget_screen.dart';

class PropertyTypeScreen extends StatelessWidget {
  PropertyTypeScreen({Key? key}) : super(key: key);
  final PropertyTypeController propertyTypeController =
      Get.put(PropertyTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        body: SafeArea(
            child: GetBuilder<PropertyTypeController>(
          id: 'property',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
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
                      const SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: Text(
                          StringRes.whatYou,
                          style: lato25500.copyWith(color: ColorRes.appColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 20),
                            itemCount:
                                propertyTypeController.propertyNameList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  propertyTypeController.onTapProperty(index);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: propertyTypeController
                                            .propertyBoolList[index]
                                        ? ColorRes.appColor
                                        : ColorRes.colorF6F6F6,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              ColorRes.black.withOpacity(0.15),
                                          blurRadius: 2.6,
                                          spreadRadius: -1,
                                          offset: const Offset(4, 4))
                                    ],
                                    border: Border.all(
                                        color: ColorRes.colorD8DAEC,
                                        width: 0.2),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        child: Image.asset(
                                          AssetRes.rentHome,
                                          height: Get.height * 0.23,
                                          width: Get.width * 0.4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.012,
                                      ),
                                      Text(
                                        propertyTypeController
                                            .propertyNameList[index],
                                        style: lato20700.copyWith(
                                            color: propertyTypeController
                                                    .propertyBoolList[index]
                                                ? ColorRes.white
                                                : ColorRes.appColor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: Get.height * 0.06,
                          ),
                          CommonButton(
                            onTap: () {
                              propertyTypeController.onTapNext();
                            },
                          ),
                          SizedBox(
                            height: Get.height * 0.06,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )));
  }
}
