import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class WelcomeWidgets {
  Widget welcomeColumn(
    PageController controller, {
    String imagePath = 'assets/images/reading.png',
    String title = '',
    String subTitle = '',
    int index = 0,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          //fit: BoxFit.fitWidth,
          height: 300, // Set the maximum height to 300
          fit: BoxFit.contain,
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: TextWidgets().text24Normal(text: title),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: TextWidgets().text16Normal(text: subTitle),
        ),
        _nextButton(index, controller, context),
      ],
    );
  }

  Widget _nextButton(
      int index, PageController controller, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index < 3) {
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        } else {
          Navigator.pushNamed(
            context,
            '/signIn',
          );
        }
      },
      child: Container(
        width: 325,
        height: 50,
        // color: Colors.blue,
        decoration: AppShadow().appBoxShadow(),
        margin: const EdgeInsets.only(
          top: 100,
          left: 25,
          right: 25,
        ),
        child: Center(
          child: TextWidgets().text16Normal(
            text: index < 3 ? "Next" : "Get Started",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
