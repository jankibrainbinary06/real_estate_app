import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/utils/color_res.dart';

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
            backgroundColor: ColorRes.white,
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text('No', style: poppins14400),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: Text(
                  'Yes',
                  style: poppins14400,
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
