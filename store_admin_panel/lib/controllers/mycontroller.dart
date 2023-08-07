import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/navigation_controller.dart';


/*
MyController extend:
    ThemeController
    VisibilityContorller
    PagesController
    AddProductController
    EditProductController
    NavigationController
*/

class MyContorller extends NavigationController {
  static MyContorller instance = Get.find();
}
