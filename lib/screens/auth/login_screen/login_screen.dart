import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/common_button.dart';
import 'package:real_estate_app/commons/text_style.dart';

import 'package:real_estate_app/screens/auth/login_screen/login_controller.dart';
import 'package:real_estate_app/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:real_estate_app/utils/color_res.dart';

import '../../../commons/common_text_field.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/string_res.dart';
import '../forgot_pass_screen/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<LoginController>(
        id: 'login',
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
                      StringRes.signIn,
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
                  StringRes.helloAgain,
                  style: lato14400.copyWith(
                    fontSize: 22,
                    color: ColorRes.color292929,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                CommonTextField(
                    textEditingController: loginController.emailController,
                    hintText: StringRes.enterEmail),
                loginController.emailError != ''
                    ? Text(
                        loginController.emailError,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  textEditingController: loginController.passwordController,
                  hintText: StringRes.enterPass,
                  imagePrefix: AssetRes.lock,
                  isEye: true,
                  isObSecure: loginController.obSecure,
                  onTapEye: () {
                    if (loginController.obSecure) {
                      loginController.obSecure = false;
                    } else {
                      loginController.obSecure = true;
                    }
                    loginController.update(['login']);
                  },
                ),
                loginController.passError != ''
                    ? Text(
                        loginController.passError,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ForgotPasswordScreen());
                        loginController.emailError = '';
                        loginController.passError = '';
                        loginController.emailController.clear();
                        loginController.passwordController.clear();
                        loginController.update(['login']);
                      },
                      child: Text(
                        StringRes.forgetPass,
                        style: poppins14400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonButton(
                      onTap: () {
                        loginController.onTapLogin();
                      },
                      title: StringRes.signIn,
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
                            Get.to(() => SignUpScreen());
                            loginController.emailError = '';
                            loginController.passError = '';
                            loginController.emailController.clear();
                            loginController.passwordController.clear();
                            loginController.update(['login']);
                          },
                          child: Text(
                            StringRes.signUp,
                            style: poppins14400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
