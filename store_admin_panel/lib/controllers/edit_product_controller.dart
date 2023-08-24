import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/models/edit_product_page_model.dart';

class EditProductPageController extends AddProductController {
  Rx<EditProductPageModel> editProductPageModel = EditProductPageModel().obs;

  manipulateEditProperties(Product? product) {
    //this function wil be called once EditProductPage() will be called.
    if (product != null) {
      editProductPageModel.update((val) {
        val!.tecProductName.text = product.productName;
        val.tecProductPrice.text = product.productPrice.toString();
        val.unitGroupValue = product.productUnit;
        val.categoryGroupValue = product.productCategory;
        val.isOnSaleBoxValue = product.isOnSale;
        val.imageName = product.productImage;
      });
    }
  }
}
