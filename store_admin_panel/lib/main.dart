import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:store_admin_panel/controllers/mycontroller.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/routing/routing.dart';
import 'themes/my_themedata.dart';
import 'package:url_strategy/url_strategy.dart';

/*
required:----------------------
generate random num for images
overflow problem
do you want to exit in user app

══╡ EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE ╞════════════════════════════════════════════════════The following ImageCodecException was thrown resolving an image codec:
Failed to detect image file format using the file header.
File header was [0x3c 0x21 0x44 0x4f 0x43 0x54 0x59 0x50 0x45 0x20].
Image source: encoded image bytes



to be adde later---------------
search feature
categories management
resend verification email



user-----------------------------
mohammedsolyman10@gmail.com
123456789


admin-------------------------------
mohammed_solyman25@yahoo.com   123456789

git push https://github.com/MohammedSolyman/store_admin_panel.git main
*/
void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDE9e-5PVsyPnkfYckw77-Z4tin9sCldj8",
        authDomain: "store-1-f7852.firebaseapp.com",
        projectId: "store-1-f7852",
        storageBucket: "store-1-f7852.appspot.com",
        messagingSenderId: "400428991281",
        appId: "1:400428991281:web:9ac830de71bf9a41612610"),
  );
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
