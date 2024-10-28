import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';

class ImageWidgets {
  Widget appImage({
    String imagePath = ImageRes.defaultImage,
    double width = 16,
    double height = 16,
  }) {
    return Image.asset(imagePath.isEmpty ? ImageRes.defaultImage : imagePath,
        width: width, height: height);
  }

  Widget appImageWithColor({
    String imagePath = ImageRes.defaultImage,
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryElement,
  }) {
    return Image.asset(imagePath.isEmpty ? ImageRes.defaultImage : imagePath,
        width: width, height: height);
  }
}
