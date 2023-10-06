import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../utils/string_res.dart';

class HomeController extends GetxController {
  SfRangeValues values = const SfRangeValues(0, 100);
  List pTypeBoolList = [true, false, false, false];
  List categoryBoolList = [true, false, false, false];
  List facilityBoolList = [true, false, false, false];
  List ratingBoolList = [true, false, false, false, false, false];
  List featuredBoolList = List.generate(4, (index) => false);
  List nearByBoolLIst = List.generate(4, (index) => false);
  List locationBoolList = List.generate(4, (index) => false);

  List rating = [StringRes.all, '5', '4', '3', '2', '1'];

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

  onTapLocationBottomSheet(int index) {
    locationBoolList = List.generate(4, (index) => false);
    locationBoolList[index] = true;
    update(['home']);
  }

  onTapRating(int index) {
    ratingBoolList = List.generate(6, (index) => false);
    ratingBoolList[index] = true;
    update(['home']);
  }

  onTapFacility(int index) {
    facilityBoolList = List.generate(4, (index) => false);
    facilityBoolList[index] = true;
    update(['home']);
  }

  onTapCategory(int index) {
    categoryBoolList = List.generate(4, (index) => false);
    categoryBoolList[index] = true;
    update(['home']);
  }

  onTapReset() {
    values = const SfRangeValues(0, 100);
    categoryBoolList = [true, false, false, false];
    facilityBoolList = [true, false, false, false];
    ratingBoolList = [true, false, false, false, false, false];
  }
}
