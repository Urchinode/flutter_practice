import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle lightAppBarTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black);
  }

  // light mode for all text style
  static TextStyle darkTextStyle(TextStyle ts) {
    return ts.copyWith(color: Colors.black);
  }
}
