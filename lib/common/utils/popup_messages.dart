import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupMessages {
  // positinoal optional parameter
  toastInfo(
    String message, {
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16,
    );
  }
}
