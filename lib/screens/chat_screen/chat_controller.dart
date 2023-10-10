import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController chatController = TextEditingController();

  List<Uint8List> imagesPath = [];
  List bytesList = [];

  List uploadByteList = [];
  bool emojiShowing = false;
  PlatformFile? imageFile;
  Future<void> pickFile() async {
    try {
      await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['jpg', 'png', 'webp', 'jpeg', 'pdf', 'mp4'],
      );
    } catch (e) {
      debugPrint('hy');
    }
  }

  onBackspacePressed() {
    chatController
      ..text = chatController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatController.text.length));
  }
}
