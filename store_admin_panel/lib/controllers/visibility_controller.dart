import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/theme_controller.dart';
import 'package:store_admin_panel/models/visibility_model.dart';



class VisibilityContorller extends ThemeController {
  Rx<VisibilityModel> visibilityModel = VisibilityModel().obs;

  void toggleHovering(bool x, String s) {
    visibilityModel.update((val) {
      if (s ==  PagesNames.overview   ) {
        val!.isHoveringOverview = x;
      } else if (s == PagesNames.allProducts) {
        val!.isHoveringProducts = x;
      } else {
        val!.isHoveringOrders = x;
      }
    });
  }


bool isHovering(String s) {
 if (s == 'overview') {
       return visibilityModel.value.isHoveringOverview;
      } else if (s == 'all products') {
       return visibilityModel.value.isHoveringProducts;
      } else {
       return visibilityModel.value.isHoveringOrders;
      }

}

}
