import 'package:flutter/material.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

class TextWidgets {
  final appShadow = AppShadow();
  final imageWidgets = ImageWidgets();

  Widget text24Normal({String text = '', Color color = AppColors.primaryText}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget text16Normal(
      {String text = '', Color color = AppColors.primarySecondaryElementText}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget text14Normal(
      {String text = '', Color color = AppColors.primaryThreeElementText}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget textUnderline({String text = 'Your text'}) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget appTextFeild({
    TextEditingController? controller,
    String text = '',
    String iconName = '',
    String hintText = 'Type in your info',
    bool obscureText = false,
    void Function(String value)? func,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: text),
          const SizedBox(height: 5),
          Container(
            //width: 325,
            height: 50,
            //color: Colors.red,
            decoration:
                appShadow.appBoxDecorationTextField(color: Colors.white),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: imageWidgets.appImage(imagePath: iconName),
                ),
                Flexible(
                  //color: Colors.red,
                  // width: 200,
                  // height: 50,
                  child: TextField(
                    controller: controller,
                    onChanged: (value) => func!(value),
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: AppColors.primaryText),
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      // default border without being focused
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscureText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
