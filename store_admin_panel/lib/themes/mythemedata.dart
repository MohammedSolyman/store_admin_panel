import 'package:flutter/material.dart';
import 'package:store_admin_panel/themes/mycolors.dart';

class MyThemeData {
  static final ThemeData light = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), foregroundColor: MaterialStatePropertyAll(Colors.white))),
      iconTheme: IconThemeData(color: MyColors.text1),
      textTheme:
          TextTheme(bodyLarge: TextStyle(fontSize: 20, color: MyColors.text1)),
      primaryColor: MyColors.background1);

  static final ThemeData dark = ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black), foregroundColor: MaterialStatePropertyAll(Colors.white))),

      iconTheme: IconThemeData(color: MyColors.text2),
      textTheme:
          TextTheme(bodyLarge: TextStyle(fontSize: 20, color: MyColors.text2)),
      primaryColor: MyColors.background2);

 
}
