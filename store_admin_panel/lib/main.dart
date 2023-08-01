import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:store_admin_panel/controllers/themecontroller.dart';
import 'package:store_admin_panel/pages/overview/overview.dart';
import 'package:store_admin_panel/constants/controllers.dart';

import 'themes/mythemedata.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: themeController.themeModel.value.themeMode,
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Overview()),
// GetPage(name: '/', page: ()=> Products()),
// GetPage(name: '/', page: ()=> EditProduct()),
// GetPage(name: '/', page: ()=> Orders()),
// GetPage(name: '/', page: ()=> Authentication()),
      ],
    );
  }
}
