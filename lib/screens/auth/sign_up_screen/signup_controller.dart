import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../reviews_screen/reviews_screen.dart';

class SignUpController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String emailError = '';
  String passError = '';
  String userError = '';
  String confirmPassError = '';

  bool obSecure = true;
  bool obSecureC = true;

  validateEmail() {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (emailController.text.isEmpty) {
      emailError = 'Please enter an email!';
    } else if (!emailRegex.hasMatch(emailController.text)) {
      emailError = 'Invalid email format!';
    } else {
      emailError = "";
    }
    update(['signup']);
  }

  validatePassword() {
    if (passwordController.text.isEmpty) {
      passError = 'Please enter password!';
    } else if (passwordController.text.length < 4) {
      passError = 'Password must be at least 4 characters!';
    } else {
      passError = "";
    }
    update(['signup']);
  }

  validateUserName() {
    if (userController.text.isEmpty) {
      userError = 'Please enter user name!';
    } else {
      userError = "";
    }
    update(['signup']);
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
    update(['signup']);
  }

  onTapSinUp() {
    validateEmail();
    validatePassword();
    validateConfirmPassword();
    validateUserName();
    if (emailError == '' &&
        passError == '' &&
        confirmPassError == '' &&
        userError == '') {
      Get.to(() => ReviewsScreen());
      emailController.clear();
      userController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    }
  }
}
