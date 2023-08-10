import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:store_admin_panel/controllers/mycontroller.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/routing/routing.dart';
import 'themes/my_themedata.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  Get.put(MyContorller());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp.router(
        themeMode: myController.themeModel.value.themeMode,
        theme: MyThemeData.light,
        darkTheme: MyThemeData.dark,
        routeInformationParser: MyRouting.routerConfig.routeInformationParser,
        routerDelegate: MyRouting.routerConfig.routerDelegate,
        routeInformationProvider:
            MyRouting.routerConfig.routeInformationProvider,
      );
    });
  }
}
