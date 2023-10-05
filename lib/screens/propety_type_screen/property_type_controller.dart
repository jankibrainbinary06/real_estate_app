import 'package:get/get.dart';
import 'package:real_estate_app/screens/budget_screen/budget_controller.dart';
import 'package:real_estate_app/screens/budget_screen/budget_screen.dart';

import '../../utils/string_res.dart';

class PropertyTypeController extends GetxController {
  List propertyNameList = [
    StringRes.apartment,
    StringRes.township,
    StringRes.residency,
    StringRes.villa,
    StringRes.cottage,
    StringRes.house,
  ];
  bool isSelected = false;
  List propertyBoolList = List.generate(6, (index) => false);

  onTapProperty(int index) {
    if (propertyBoolList[index]) {
      propertyBoolList[index] = false;
    } else {
      propertyBoolList[index] = true;
    }
    update(['property']);
  }

  onTapNext() {
    for (int i = 0; i < propertyBoolList.length; i++) {
      if (propertyBoolList[i] == true) {
        isSelected = true;
        Get.to(() => BudgetScreen());
      } else {
        isSelected = false;
      }
      update(['property']);
    }
  }
}
