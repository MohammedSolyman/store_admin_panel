
import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/edit_product_controller.dart';

class NavigationController extends EditProductController {


  void toAddProduct () {
    Get.offNamed('/addproduct');
  }
  
}