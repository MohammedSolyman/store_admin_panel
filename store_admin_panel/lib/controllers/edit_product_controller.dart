import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/models/edit_product_page_model.dart';

class EditProductPageController extends AddProductController {
  Rx<EditProductPageModel> editProductPageModel = EditProductPageModel().obs;

  manipulateEditTec(Product? product) {
    //this function wil be called once EditProductPage() will be called.
    if (product != null) {
      editProductPageModel.update((val) {
        val!.tecProductName.text = product.productName;
        val.tecProductPrice.text = product.productPrice.toString();

        print('product.productPrice.toString()-------------------');
        print(product.productPrice.toString());
        print('val.tecProductPrice.text-------------------');
        print(val.tecProductPrice.text);

        val.imageName = product.productImage;

        // String unitGroupValue = Unit.kilo;
        // String categoryGroupValue = "";
        // bool isOnSaleBoxValue = false;
      });
    }
  }
}
