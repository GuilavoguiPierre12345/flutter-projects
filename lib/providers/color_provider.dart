import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  MaterialColor color = Colors.orange;

  changeColor(MaterialColor newColor) {
    color = newColor;
    notifyListeners();
  }
}