import 'package:flutter/material.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

class ButtonWidgets {
  final appShadow = AppShadow();
  final textWidgets = TextWidgets();
  final signInWidgets = SignInWidgets();

  Widget appButton(
    BuildContext context, {
    String buttonName = '',
    double width = 325,
    double height = 50,
    bool isLogin = true,
    void Function()? func,
  }) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: appShadow.appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          border: isLogin
              ? null
              : Border.all(
                  color: AppColors.primaryFourElementText,
                ),
        ),
        child: Center(
          child: textWidgets.text16Normal(
            text: buttonName,
            color:
                isLogin ? AppColors.primaryBackground : AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}