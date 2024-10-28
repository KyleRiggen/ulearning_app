import 'package:flutter/material.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

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
          child: Text16Normal(text: subTitle),
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
          //bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
          // print("deviceFirstTime: $deviceFirstTime");

          // remember if we are first time or not to visit the welcome screen
          Global.storageService
              .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);

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
          child: Text16Normal(
            text: index < 3 ? "Next" : "Get Started",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AppOnboardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final BuildContext context;

  const AppOnboardingPage({
    super.key,
    required this.controller,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
