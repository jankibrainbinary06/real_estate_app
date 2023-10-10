import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/screens/auth/forgot_pass_screen/forgor_pass_controller.dart';

import '../../../commons/common_text_field.dart';
import '../../../commons/text_style.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final ForgotPassController forgotPassController =
      Get.put(ForgotPassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: ColorRes.white,
          elevation: 0,
          toolbarHeight: 70,
          centerTitle: true,
          title: Text(
            StringRes.forgetPassword,
            style: lato25500.copyWith(
                color: ColorRes.appColor, fontWeight: FontWeight.w700),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
        ),
        body: GetBuilder<ForgotPassController>(
          id: 'forgot',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: Text(
                      StringRes.enterYourEmailToReset,
                      style: lato25500.copyWith(
                          color: ColorRes.color292929, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  CommonTextField(
                      textEditingController:
                          forgotPassController.emailController,
                      hintText: StringRes.enterEmail),
                  forgotPassController.emailError != ''
                      ? Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            forgotPassController.emailError,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  CommonButton(
                    onTap: () {
                      forgotPassController.onTapContinue();
                    },
                    title: StringRes.continueX,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
