import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/notification_screen/notification_controller.dart';

import '../../commons/text_style.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  final NotificationController notificationController =
      Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          StringRes.notification,
          style: lato25500.copyWith(
              color: ColorRes.appColor, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              width: Get.width * 0.9,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: ColorRes.colorF6F6F6,
                  border: Border.all(
                    color: ColorRes.colorBDBFCE,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: ColorRes.black.withOpacity(
                          0.15,
                        ),
                        blurRadius: 3,
                        spreadRadius: -1,
                        offset: const Offset(4, 4)),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetRes.lady,
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jemmie Ken',
                        style: lato20700.copyWith(
                            fontSize: 16, color: ColorRes.appColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        StringRes.justMessaged,
                        style: lato25500.copyWith(
                            fontSize: 13, color: ColorRes.color53587A),
                      ),
                      Row(
                        children: [
                          Text(
                            'in',
                            style: lato25500.copyWith(
                                fontSize: 13, color: ColorRes.color53587A),
                          ),
                          Text(
                            ' message ',
                            style: lato20700.copyWith(
                                fontSize: 13, color: ColorRes.appColor),
                          ),
                          Text(
                            'tab',
                            style: lato25500.copyWith(
                                fontSize: 13, color: ColorRes.color53587A),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '10 mins ago',
                        style: lato14400.copyWith(
                            fontSize: 10, color: ColorRes.colorA1A5C1),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
