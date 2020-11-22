import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  var currentTheme = ThemeData.light();

  changeTheme() {
    if (currentTheme == ThemeData.light()) {
      currentTheme = ThemeData.dark();
    } else {
      currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
