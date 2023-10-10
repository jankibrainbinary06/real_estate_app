import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/auth/verification_screen/verification_screen.dart';

class ForgotPassController extends GetxController {
  TextEditingController emailController = TextEditingController();
  String emailError = '';

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
    update(['forgot']);
  }

  onTapContinue() {
    validateEmail();
    if (emailError == '') {
      Get.to(() => VerificationScreen());
      emailController.clear();
    }
  }
}
