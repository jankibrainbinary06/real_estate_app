import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:real_estate_app/screens/auth/verification_screen/verification_controller.dart';
import '../../../commons/common_button.dart';
import '../../../commons/text_style.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);
  final VerificationController verificationController =
      Get.put(VerificationController());

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
            StringRes.verification,
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
        body: GetBuilder<VerificationController>(
          id: 'otp',
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    StringRes.typeTheVerification,
                    style: lato25500.copyWith(
                        color: ColorRes.color292929, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Pinput(
                        isCursorAnimationEnabled: true,
                        separatorBuilder: (index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        length: 4,
                        focusedPinTheme: PinTheme(
                          textStyle: latoBold.copyWith(fontSize: 18),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: ColorRes.appColor,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        cursor: Container(
                          height: 21,
                          width: 2,
                          color: ColorRes.appColor,
                        ),
                        closeKeyboardWhenCompleted: true,
                        controller: verificationController.pinPutController,
                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 50,
                          textStyle: latoBold.copyWith(fontSize: 18),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: ColorRes.appColor,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      verificationController.pinError != ''
                          ? Text(
                              verificationController.pinError,
                              style: const TextStyle(color: Colors.red),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Text(
                    StringRes.didNotReceive,
                    style: lato14400.copyWith(
                        color: ColorRes.color292929, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorRes.appColor,
                          width: 1, // Underline thickness
                        ),
                      ),
                    ),
                    child: Text(
                      StringRes.resendOtp,
                      style: lato14400.copyWith(
                        color: ColorRes.appColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  CommonButton(
                    onTap: () {
                      verificationController.onTapContinue();
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
