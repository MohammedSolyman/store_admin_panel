import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';

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

class MyContorller extends AddProductController {
  static MyContorller instance = Get.find<MyContorller>();
}
