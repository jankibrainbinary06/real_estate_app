import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  int tab = 0;

  void onBottomBarTaskerChange(int index) {
    tab = index;
    if (index == 0) {
      // homeController.init();
    } else if (index == 1) {
      // forecastController.init();
    } else if (index == 2) {
      // historyController.init();
    } else if (index == 3) {
      // historyController.init();
    } else if (index == 4) {
      // historyController.init();
    } else {
      // mapController.init();
    }
    update(['bottom']);
  }

  Future<bool> onWillPop(BuildContext context) async {
    return (await showCupertinoDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to Log out ?'),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
