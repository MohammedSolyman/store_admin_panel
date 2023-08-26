import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/controllers/sign_up_page_controller.dart';
import 'package:store_admin_panel/routing/redirection.dart';

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

  @override
  void onInit() async {
    super.onInit();

    //final box = GetStorage();
    print('before---------------------------------------');

    //String x = box.read<String>('isLoggedIn')!;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool? isLoggedIn = prefs.getBool('isLoggedIn');

    print('after---------------------------------------');
    print(isLoggedIn);

    Redirection.isLoggedIn = isLoggedIn ?? false;

    await getProducts();
    await getPurchases();
  }
}

//class EditProductPageController extends AddProductController {}
