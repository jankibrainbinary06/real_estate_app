import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/screens/chat_screen/chat_controller.dart';

import '../../commons/text_style.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class ChatScreen extends StatelessWidget {
  final String? name;

  ChatScreen({Key? key, this.name}) : super(key: key);
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
          child: GetBuilder<ChatController>(
        id: 'chat',
        builder: (controller) {
          return Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: ColorRes.black.withOpacity(0.8),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    Text(
                      name ?? '',
                      style: lato25500.copyWith(
                          color: ColorRes.appColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Image.asset(
                      AssetRes.call,
                      scale: 4,
                      color: ColorRes.appColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.055,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            color: ColorRes.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Text(
                            StringRes.today,
                            style: openSans14600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 14),
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                              color: ColorRes.appColor,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Hii, Good Morning',
                                    style: openSans14600.copyWith(
                                        color: ColorRes.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '16:00',
                                  style: openSans14600.copyWith(
                                      color: ColorRes.white.withOpacity(
                                        0.75,
                                      ),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AssetRes.check,
                                  scale: 4,
                                  color: ColorRes.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 14),
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                              color: ColorRes.colorD9D9D9,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Hii, Good Morning',
                                    style: openSans14600.copyWith(
                                        color: ColorRes.appColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '16:00',
                                  style: openSans14600.copyWith(
                                      color: ColorRes.appColor.withOpacity(
                                        0.75,
                                      ),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AssetRes.check,
                                  scale: 4,
                                  color: ColorRes.appColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: ColorRes.colorF6F6F6,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorRes.black.withOpacity(
                                    0.15,
                                  ),
                                  blurRadius: 3,
                                  spreadRadius: -1,
                                  offset: const Offset(4, 4)),
                            ]),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                AssetRes.smily,
                                height: 20,
                                width: 20,
                              ),
                              onTap: () {
                                // FocusScope.of(context).unfocus();
                                //
                                // chatController.emojiShowing =
                                //     !chatController.emojiShowing;
                                //
                                // chatController.update(['chat']);
                              },
                            ),
                            Container(
                                width: Get.width * 0.45,
                                alignment: Alignment.center,
                                child: TextFormField(
                                  controller: chatController.chatController,
                                  onTap: () {
                                    chatController.emojiShowing = false;
                                    chatController.update(['chat']);
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(9),
                                      border: InputBorder.none,
                                      hintText: StringRes.typeAMessage,
                                      hintStyle: openSans14600),
                                  maxLines: 1,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                chatController.pickFile();
                              },
                              child: Image.asset(
                                AssetRes.attachFile,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                await picker.pickImage(
                                    source: ImageSource.camera);
                              },
                              child: Image.asset(
                                AssetRes.camero,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorRes.appColor),
                      child: Image.asset(
                        AssetRes.mic,
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: !chatController.emojiShowing,
                child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      textEditingController: chatController.chatController,
                      onBackspacePressed: chatController.onBackspacePressed(),
                      config: const Config(
                        columns: 7,
                        emojiSizeMax: 20,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        initCategory: Category.RECENT,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        recentTabBehavior: RecentTabBehavior.RECENT,
                        recentsLimit: 28,
                        replaceEmojiOnLimitExceed: false,
                        noRecents: Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.black26),
                          textAlign: TextAlign.center,
                        ),
                        loadingIndicator: SizedBox.shrink(),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                        checkPlatformCompatibility: true,
                      ),
                    )),
              ),
            ],
          );
        },
      )),
    );
  }
}
