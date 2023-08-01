import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/themes/mythemedata.dart';

class ThemeModel {
  ThemeMode themeMode = ThemeMode.light;

  bool themeModeBool = true;
  bool isVisibleTile = false;
}

class ThemeController extends GetxController {
  Rx<ThemeModel> themeModel = ThemeModel().obs;
  static ThemeController ThemeInstance = Get.find<ThemeController>();

  void toggleMode(bool x) {
    themeModel.update((val) {
      val!.themeModeBool = x;

      if (x == true) {
        val.themeMode = ThemeMode.light;
      } else {
        val.themeMode = ThemeMode.dark;
      }
    });
  }

  void toggleVisibility(bool x) {
    themeModel.update((val) {
      val!.isVisibleTile = x;
    });
  }
}
