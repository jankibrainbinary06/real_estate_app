import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/dashboard_screen/dashboard_controller.dart';
import 'package:real_estate_app/screens/dashboard_screen/widgets/bottom_bar.dart';
import 'package:real_estate_app/screens/favourites_screen/favourites_screen.dart';
import 'package:real_estate_app/screens/home_screen/home_screen.dart';
import 'package:real_estate_app/screens/intro_screen/intro_screen_1/intro_screen1.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashBoardController dashBoardController =
        Get.put(DashBoardController());
    return WillPopScope(
      onWillPop: () {
        return dashBoardController.onWillPop(context);
      },
      child: Scaffold(
        body: GetBuilder<DashBoardController>(
            id: 'bottom',
            builder: (controller) {
              if (controller.tab == 0) {
                return HomeScreen();
              } else if (controller.tab == 1) {
                return FavouritesScreen();
              } else if (controller.tab == 2) {
                return const Center(child: Text('chat'));
              } else if (controller.tab == 3) {
                return const Center(child: Text('user'));
              } else {
                return IntroScreen1();
              }
            }),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
