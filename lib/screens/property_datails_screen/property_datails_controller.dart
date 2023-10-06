import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/screens/splash_screen/splash_screen.dart';
import 'package:real_estate_app/utils/color_res.dart';

class PropertyDatailsController extends GetxController {

  bool isLike = false;
  bool isReadMore = false;
  PageController pageController = PageController();
  var currentPage = 0;


  commonRow({image,number,text})
  {
    return Row(children: [
      Container(height: 33,width: 33,decoration: BoxDecoration(shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image),scale: 4),
          color: ColorRes.appColor.withOpacity(0.15)),
      ),
      SizedBox(width: 5,),
      Text("${number} $text",style: lato20700.copyWith(fontWeight: FontWeight.w600,color: ColorRes.appColor,fontSize: 12),)
    ],);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
