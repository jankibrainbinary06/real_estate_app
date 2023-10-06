import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/screens/messages_screen/messages_controller.dart';

import '../../commons/text_style.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({Key? key}) : super(key: key);
  final MessagesController messagesController = Get.put(MessagesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        elevation: 0,
        centerTitle: true,
        title: Text(
          StringRes.messages,
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
            return Container();
            //   Container(
            //   width: Get.width * 0.9,
            //   margin: const EdgeInsets.only(bottom: 10),
            //   padding: const EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(
            //         10,
            //       ),
            //       color: ColorRes.colorF6F6F6,
            //       border: Border.all(
            //         color: ColorRes.colorBDBFCE,
            //         width: 1,
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //             color: ColorRes.black.withOpacity(
            //               0.15,
            //             ),
            //             blurRadius: 3,
            //             spreadRadius: -1,
            //             offset: const Offset(4, 4)),
            //       ]),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Image.asset(
            //         AssetRes.userLogo,
            //         height: 50,
            //         width: 50,
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
