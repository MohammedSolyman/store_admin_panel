import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/theme_controller.dart';
import 'package:store_admin_panel/models/visibility_model.dart';

class VisibilityContorller extends ThemeController {
  Rx<VisibilityModel> visibilityModel = VisibilityModel().obs;

  void toggleHovering(bool x, String s) {
    visibilityModel.update((val) {
      if (s == PagesNames.overview) {
        val!.isHoveringOverview = x;
      } else if (s == PagesNames.allProducts) {
        val!.isHoveringProducts = x;
      } else if (s == PagesNames.allOrders) {
        val!.isHoveringOrders = x;
      } else {
        val!.isHoveringSignOut = x;
      }
    });
  }

  bool isHovering(String s) {
    if (s == PagesNames.overview) {
      return visibilityModel.value.isHoveringOverview;
    } else if (s == PagesNames.allProducts) {
      return visibilityModel.value.isHoveringProducts;
    } else if (s == PagesNames.allOrders) {
      return visibilityModel.value.isHoveringOrders;
    } else {
      return visibilityModel.value.isHoveringSignOut;
    }
  }
}
