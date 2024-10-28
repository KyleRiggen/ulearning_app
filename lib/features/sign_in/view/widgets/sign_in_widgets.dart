import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class SignInWidgets {
  final textWidgets = TextWidgets();
  final appShadow = AppShadow();
  final imageWidgets = ImageWidgets();

  Widget thirdPartyLogin() {
    return Container(
      margin: const EdgeInsets.only(
        left: 80,
        right: 80,
        top: 40,
        bottom: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _loginButton('assets/icons/google.png'),
          _loginButton('assets/icons/apple.png'),
          _loginButton('assets/icons/facebook.png'),
        ],
      ),
    );
  }

  Widget _loginButton(String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
