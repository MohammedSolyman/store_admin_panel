import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/visibility_controller.dart';

class PagesModel {
  String pageName = PagesNames.overview;
}

class PagesController extends VisibilityContorller {
  Rx<PagesModel> pagesModel = PagesModel().obs;

  updatePageName(String newName) {
    pagesModel.update((val) {
      val!.pageName = newName;
    });
  }
}
