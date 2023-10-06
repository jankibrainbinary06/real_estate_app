import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List pTypeBoolList = [true, false, false, false];
  List featuredBoolList = List.generate(4, (index) => false);
  List nearByBoolLIst = List.generate(4, (index) => false);

  TextEditingController searchController = TextEditingController();

  onTapPType(int index) {
    pTypeBoolList = List.generate(4, (index) => false);
    pTypeBoolList[index] = true;
    update(['home']);
  }

  onTapFeatured(int index) {
    if (featuredBoolList[index]) {
      featuredBoolList[index] = false;
    } else {
      featuredBoolList[index] = true;
    }
    update(['home']);
    update(['favourites']);
  }

  onTapNearBY(int index) {
    if (nearByBoolLIst[index]) {
      nearByBoolLIst[index] = false;
    } else {
      nearByBoolLIst[index] = true;
    }
    update(['home']);
  }
}
