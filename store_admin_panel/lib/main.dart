import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:store_admin_panel/controllers/mycontroller.dart';
import 'package:store_admin_panel/pages/overview/overview.dart';
import 'package:store_admin_panel/constants/constants.dart';

import 'pages/add_product/add_product.dart';
import 'themes/my_themedata.dart';

void main() {
  Get.put(MyContorller());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return GetMaterialApp(
          themeMode: myController.themeModel.value.themeMode,
          theme: MyThemeData.light,
          darkTheme: MyThemeData.dark,
          initialRoute: '/addproduct',
          getPages: [
            GetPage(name: '/overview', page: () => const Overview()),
          GetPage(name: '/addproduct', page: () => const AddProduct()),
            
// GetPage(name: '/', page: ()=> Products()),
// GetPage(name: '/', page: ()=> EditProduct()),
// GetPage(name: '/', page: ()=> Orders()),
// GetPage(name: '/', page: ()=> Authentication()),
          ],
        );
      }
    );
  }
}
