import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/auth/login_screen/login_screen.dart';

class ResetPassController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String passError = '';
  String confirmPassError = '';

  bool obSecure = true;
  bool obSecureC = true;

  validatePassword() {
    if (passwordController.text.isEmpty) {
      passError = 'Please enter password!';
    } else if (passwordController.text.length < 4) {
      passError = 'Password must be at least 4 characters!';
    } else {
      passError = "";
    }
    update(['reset']);
  }

  validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      confirmPassError = 'Please enter confirm password!';
    } else if (confirmPasswordController.text.length < 4) {
      confirmPassError = 'Password must be at least 4 characters!';
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      confirmPassError = "Password doesn't match!";
    } else {
      confirmPassError = "";
    }
    update(['reset']);
  }

  onTapContinue() {
    validatePassword();
    validateConfirmPassword();

    if (passError == '' && confirmPassError == '') {
      Get.to(() => LoginScreen());
      passwordController.clear();
      confirmPasswordController.clear();
    }
  }
}
