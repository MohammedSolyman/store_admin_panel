import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/pages_controller.dart';
import 'package:store_admin_panel/models/add_product_page_model.dart';

class AddEditProductPageController extends PagesController {
  Rx<AddProductModel> addProductModel = AddProductModel().obs;

  changeGroupValue(String newValue) {
    addProductModel.update((val) {
      val!.unitGroupValue = newValue;
    });
  }

  changeisOnSaleBoxValue(bool newValue) {
    addProductModel.update((val) {
      val!.isOnSaleBoxValue = newValue;
    });
  }

  changeCategoryGroupValue(String newValue) {
    addProductModel.update((val) {
      val!.categoryGroupValue = newValue;
    });
  }
}
