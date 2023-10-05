import 'package:get/get.dart';

import '../intro_screen/intro_screen_1/intro_screen1.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Get.offAll(() => IntroScreen1());
      },
    );
    super.onInit();
  }
}
