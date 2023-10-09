import 'package:flutter/material.dart';
import 'package:real_estate_app/commons/text_style.dart';
import 'package:real_estate_app/utils/color_res.dart';

import '../../../commons/common_text_field.dart';
import '../../../utils/asset_res.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonTextField(textEditingController: TextEditingController())
          ],
        ),
      ),
    );
  }
}
