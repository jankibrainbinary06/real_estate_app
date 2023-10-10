import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/auth/reset_pass_screen/reset_pass_screen.dart';

class VerificationController extends GetxController {
  TextEditingController pinPutController = TextEditingController();

  String pinError = '';

  validatePinPut() {
    if (pinPutController.text.isEmpty) {
      pinError = 'Please enter Otp!';
    } else if (pinPutController.text.length < 4) {
      pinError = 'Password must be at least 4 characters!';
    } else {
      pinError = "";
    }
    update(['otp']);
  }

  onTapContinue() {
    validatePinPut();
    if (pinError == '') {
      Get.to(() => ResetPassScreen());
      pinPutController.clear();
    }
  }
}
