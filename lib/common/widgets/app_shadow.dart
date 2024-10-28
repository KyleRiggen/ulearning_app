import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';

class AppShadow {
  BoxDecoration appBoxShadow({
    Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? boxBorder,
    BorderRadius? borderRaidus,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
          color: color,
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1),
        )
      ],
    );
  }

  BoxDecoration appBoxShadowWithRadius({
    Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? border,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      border: border,
      boxShadow: [
        BoxShadow(
          color: color,
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1),
        )
      ],
    );
  }

  BoxDecoration appBoxDecorationTextField({
    Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourthElementText,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
    );
  }
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  const AppBoxDecorationImage({
    super.key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.profile,
  });

  @override
  Widget build(BuildContext context) {
    print("my app bar");
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            imagePath,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
