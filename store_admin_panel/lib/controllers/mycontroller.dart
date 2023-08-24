import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/controllers/sign_up_page_controller.dart';

/*

GetxController

DataController
ThemeController
VisibilityContorller
PagesController
AddEditProductPageController
NavigationController
AddProductController
EditProductPageController
SignInPageController
SignUpPageController

MyContorller
*/

class MyContorller extends SignUpPageController {
  static MyContorller instance = Get.find<MyContorller>();
}

class EditProductPageController extends AddProductController {}
