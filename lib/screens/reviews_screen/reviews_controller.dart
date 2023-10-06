import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/utils/color_res.dart';


class ReviewsController extends GetxController {

TextEditingController nameController= TextEditingController();
TextEditingController describeController= TextEditingController();

  commonTextFiled({Containerheight,hedarNameText,textController, fontSize, hintText, onChanged, hintFontSize,height,color,maxLines})
  {
    return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hedarNameText ?? "",
          style: lato14400.copyWith(
            fontSize: 16,
            color: ColorRes.appColor,
          ),
        ),
        Container(alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 15),
          height: Containerheight ?? 50,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: ColorRes.black.withOpacity(
                    0.15,
                  ),
                  blurRadius: 2.60,
                  spreadRadius: 0,
                  offset:Offset(1.95, 0)),
            ],
            border: Border.all(color: ColorRes.colorBDBFCE)
        ),child: TextFormField(
            maxLines: maxLines,
          cursorColor: Colors.black,
          controller: textController,
          style: lato25500.copyWith(
              height: height,
              fontSize: fontSize ?? 15.00,
              color: color ?? ColorRes.color53587A),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20,bottom: 5),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: lato25500.copyWith(fontSize:hintFontSize ??  15.00, color: ColorRes.color53587A),
          ),
          onChanged: onChanged,
        ),),
      ],
    );
  }




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
