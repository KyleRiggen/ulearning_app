// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class SearchWidgets {
  final appShadow = AppShadow();
  final imageWidgets = ImageWidgets();
  final textWidgets = TextWidgets();

  Widget searchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 320,
          height: 40,
          decoration: appShadow.appBoxShadow(
            color: AppColors.primaryBackground,
            boxBorder: Border.all(color: AppColors.primaryFourthElementText),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17),
                child: imageWidgets.appImage(imagePath: ImageRes.searchIcon),
              ),
              Container(
                width: 240,
                height: 40,
                child: textWidgets.appTextFieldOnly(
                    width: 240, height: 40, hintText: "this is search"),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            width: 40,
            height: 40,
            decoration: appShadow.appBoxShadow(
                boxBorder: Border.all(color: AppColors.primaryElement)),
            child: imageWidgets.appImage(imagePath: ImageRes.searchButton),
          ),
        )
      ],
    );
  }
}
