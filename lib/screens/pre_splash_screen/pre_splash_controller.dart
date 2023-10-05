import 'package:get/get.dart';
import 'package:real_estate_app/screens/splash_screen/splash_screen.dart';

class PreSplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Get.to(() => SplashScreen());
      },
    );
    super.onInit();
  }
}
