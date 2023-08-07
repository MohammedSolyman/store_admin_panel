import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:store_admin_panel/controllers/mycontroller.dart';
import 'package:store_admin_panel/pages/overview/overview.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'pages/add_product/add_product.dart';
import 'themes/my_themedata.dart';
import 'package:url_strategy/url_strategy.dart';


/*

drawer tiles widths are fixed
drawer overfow is fixed
# is removed from url

*/






void main() {
  setPathUrlStrategy();
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
          initialRoute: '/overview',
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
