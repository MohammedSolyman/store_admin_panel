import 'package:flutter/material.dart';
import 'package:store_admin_panel/themes/mycolors.dart';

class MyThemeData {
  static final ThemeData light = ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      iconTheme: const IconThemeData(color: MyColors.text1),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: MyColors.text1),
          headlineLarge: TextStyle(
              fontSize: 20,
              color: MyColors.text1,
              fontWeight: FontWeight.bold)),
      primaryColor: MyColors.background1);

  static final ThemeData dark = ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      iconTheme: const IconThemeData(color: MyColors.text2),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: MyColors.text2),
          headlineLarge: TextStyle(
              fontSize: 20,
              color: MyColors.text2,
              fontWeight: FontWeight.bold)),
      primaryColor: MyColors.background2);
}
