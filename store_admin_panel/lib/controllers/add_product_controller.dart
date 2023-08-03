

import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/pages_controller.dart';
import 'package:store_admin_panel/models/add_product_model.dart';

class AddProductController extends PagesController {
  Rx<AddProductModel> addProductModel = AddProductModel().obs ;

  changeGroupValue (String newValue){
    addProductModel.update((val) {
      val!.groupValue = newValue;
     });
  }


  changeCheckBoxValue (bool newValue){
    addProductModel.update((val) {
      val!.checkBoxValue = newValue;
     });
  }


}