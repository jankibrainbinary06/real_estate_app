import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/auth/login_screen/login_screen.dart';
import 'package:real_estate_app/screens/auth/sign_up_screen/signup_controller.dart';
import '../../../commons/common_button.dart';
import '../../../commons/common_text_field.dart';
import '../../../commons/text_style.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/string_res.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<SignUpController>(
        id: 'signup',
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Row(
                  children: [
                    Text(
                      StringRes.lets,
                      style: lato25500.copyWith(fontSize: 42),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      StringRes.signUp,
                      style: lato20700.copyWith(
                          fontSize: 42,
                          color: ColorRes.appColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  StringRes.helloSignup,
                  style: lato14400.copyWith(
                    fontSize: 22,
                    color: ColorRes.color292929,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CommonTextField(
                    textEditingController: signUpController.userController,
                    hintText: StringRes.enterUserName,
                    imagePrefix: AssetRes.userFilled),
                signUpController.userError != ''
                    ? Text(
                        signUpController.userError,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                    textEditingController: signUpController.emailController,
                    hintText: StringRes.enterEmail),
                signUpController.emailError != ''
                    ? Text(
                        signUpController.emailError,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  textEditingController: signUpController.passwordController,
                  hintText: StringRes.enterPass,
                  imagePrefix: AssetRes.lock,
                  isEye: true,
                  isObSecure: signUpController.obSecure,
                  onTapEye: () {
                    if (signUpController.obSecure) {
                      signUpController.obSecure = false;
                    } else {
                      signUpController.obSecure = true;
                    }
                    signUpController.update(['signup']);
                  },
                ),
                signUpController.passError != ''
                    ? Text(
                        signUpController.passError,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  textEditingController:
                      signUpController.confirmPasswordController,
                  hintText: StringRes.enterConfirmPass,
                  imagePrefix: AssetRes.lock,
                  isEye: true,
                  isObSecure: signUpController.obSecureC,
                  onTapEye: () {
                    if (signUpController.obSecureC) {
                      signUpController.obSecureC = false;
                    } else {
                      signUpController.obSecureC = true;
                    }
                    signUpController.update(['signup']);
                  },
                ),
                signUpController.confirmPassError != ''
                    ? Text(
                        signUpController.confirmPassError,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonButton(
                      onTap: () {
                        signUpController.onTapSinUp();
                      },
                      title: StringRes.signUp,
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringRes.doNntHaveAnAccount,
                          style: lato14400.copyWith(
                            color: ColorRes.black.withOpacity(0.8),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => LoginScreen());
                            signUpController.emailController.clear();
                            signUpController.userController.clear();
                            signUpController.passwordController.clear();
                            signUpController.confirmPasswordController.clear();
                            signUpController.emailError = '';
                            signUpController.passError = '';
                            signUpController.userError = '';
                            signUpController.confirmPassError = '';
                          },
                          child: Text(
                            StringRes.signIn,
                            style: poppins14400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
