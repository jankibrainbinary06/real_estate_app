import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/reviews_screen/reviews_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailError = '';
  String passError = '';

  bool obSecure = true;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

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
    update(['login']);
  }

  validatePassword() {
    if (passwordController.text.isEmpty) {
      passError = 'Please enter password!';
    } else if (passwordController.text.length < 4) {
      passError = 'Password must be at least 4 characters!';
    } else {
      passError = "";
    }
    update(['login']);
  }

  onTapLogin() {
    validateEmail();
    validatePassword();
    if (emailError == '' && passError == '') {
      Get.to(() => ReviewsScreen());

      emailController.clear();
      passwordController.clear();
    }
  }
}
