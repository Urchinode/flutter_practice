import 'package:flutter/material.dart';

import '../global/colors.dart';

class CustomColor with ChangeNotifier {
  Color color = desert;

  void changeColor(Color newColor) {
    color = newColor;
    print('Color changed');
    notifyListeners();
  }
}
