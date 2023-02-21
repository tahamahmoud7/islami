import 'package:flutter/material.dart';
import 'package:islamei/my_theme.dart';


class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode mode = ThemeMode.light;

  void ChangeLanuage(String lang) {
    if (languageCode == lang) return;
    languageCode = lang;
    notifyListeners();
  }

  String getBackGeoundImage() {
    if (mode == ThemeMode.light) {
      return "assets/images/background.png";
    }
      return "assets/images/main_background_dark.png";
    }

  void ChangeThemeMode(ThemeMode themeMode) {

    mode=themeMode;
    notifyListeners();
  }

  Color getSalectedColor(String lang) {
    return languageCode == lang ? MyThemeData.primaryColor : MyThemeData
        .BlackColor;

  }



}
