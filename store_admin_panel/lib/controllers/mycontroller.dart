import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/sign_up_page_controller.dart';

/*
MyController extend:
    DataController
    ThemeController
    VisibilityContorller
    PagesController
    AddEditProductPageController
    EditProductController
    NavigationController
    addProductController
*/

class MyContorller extends SignUpPageController {
  static MyContorller instance = Get.find<MyContorller>();
}
