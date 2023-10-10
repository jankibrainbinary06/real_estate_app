import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/auth/reset_pass_screen/reset_pass_controller.dart';

import '../../../commons/common_button.dart';
import '../../../commons/common_text_field.dart';
import '../../../commons/text_style.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({Key? key}) : super(key: key);
  final ResetPassController resetPassController =
      Get.put(ResetPassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: ColorRes.white,
          elevation: 0,
          toolbarHeight: 80,
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
        body: GetBuilder<ResetPassController>(
          id: 'reset',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        StringRes.enterYouNewPass,
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
                          resetPassController.passwordController,
                      hintText: StringRes.enterPass,
                      imagePrefix: AssetRes.lock,
                      isEye: true,
                      isObSecure: resetPassController.obSecure,
                      onTapEye: () {
                        if (resetPassController.obSecure) {
                          resetPassController.obSecure = false;
                        } else {
                          resetPassController.obSecure = true;
                        }
                        resetPassController.update(['reset']);
                      },
                    ),
                    resetPassController.passError != ''
                        ? Text(
                            resetPassController.passError,
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextField(
                      textEditingController:
                          resetPassController.confirmPasswordController,
                      hintText: StringRes.enterConfirmPass,
                      imagePrefix: AssetRes.lock,
                      isEye: true,
                      isObSecure: resetPassController.obSecureC,
                      onTapEye: () {
                        if (resetPassController.obSecureC) {
                          resetPassController.obSecureC = false;
                        } else {
                          resetPassController.obSecureC = true;
                        }
                        resetPassController.update(['reset']);
                      },
                    ),
                    resetPassController.confirmPassError != ''
                        ? Text(
                            resetPassController.confirmPassError,
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: Get.height * 0.09,
                    ),
                    CommonButton(
                      onTap: () {
                        resetPassController.onTapContinue();
                      },
                      title: StringRes.continueX,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
