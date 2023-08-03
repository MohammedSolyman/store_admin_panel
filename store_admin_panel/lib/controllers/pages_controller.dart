import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/visibility_controller.dart';
import 'package:store_admin_panel/models/page_model.dart';



class PagesController extends VisibilityContorller {
  Rx<PagesModel> pagesModel = PagesModel().obs;

  updatePageName(String newName) {
    pagesModel.update((val) {
      val!.pageName = newName;
    });
  }
}
