import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/models/edit_product_page_model.dart';

class EditProductController extends AddProductController {
  Rx<EditProductPageModel> editProductPageModel = EditProductPageModel().obs;
}
