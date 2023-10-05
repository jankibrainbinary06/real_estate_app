import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/screens/budget_screen/budget_controller.dart';

import '../../commons/text_style.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import '../dashboard_screen/dashboard_screen.dart';

class BudgetScreen extends StatelessWidget {
  BudgetScreen({Key? key}) : super(key: key);
  final BudgetController budgetController = Get.put(BudgetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
          child: GetBuilder<BudgetController>(
        id: 'budget',
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: ColorRes.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        StringRes.whatIsYourBudget,
                        style: lato25500.copyWith(color: ColorRes.appColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                Row(
                  children: [
                    Text(
                      '\$  ${budgetController.start.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppin-regular',
                          fontSize: 15),
                    ),
                    const Spacer(),
                    Text(
                      '\$  ${budgetController.end.toStringAsFixed(2)} Cr+',
                      style: const TextStyle(
                          color: ColorRes.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppin-regular',
                          fontSize: 15),
                    ),
                  ],
                ),
                RangeSlider(
                  activeColor: ColorRes.appColor,
                  values:
                      RangeValues(budgetController.start, budgetController.end),
                  labels: RangeLabels(budgetController.start.toString(),
                      budgetController.end.toString()),
                  onChanged: (value) {
                    budgetController.start = value.start;
                    budgetController.end = value.end;
                    budgetController.update(['budget']);
                  },
                  min: 0.0,
                  max: 50.0,
                ),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                CommonButton(
                  onTap: () {
                    Get.to(() => DashBoardScreen());
                  },
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
