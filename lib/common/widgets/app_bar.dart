import 'package:flutter/material.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AppBarWidgets {
  AppBar buildAppBar({String title = ''}) {
    return AppBar(
      //backgroundColor: Colors.black,
      title: Text16Normal(
        text: title,
        color: AppColors.primaryText,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          height: 1,
        ),
      ),
    );
  }
}
