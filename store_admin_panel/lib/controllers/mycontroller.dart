import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';

/*
MyController extend:
    ThemeController
    VisibilityContorller
    PagesController
    AddEditProductPageController
    EditProductController
    NavigationController
    addProductController
*/

// class addProductController extends NavigationController {
//   uploudImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       Uint8List? fileBytes = result.files.first.bytes;
//       await FirebaseStorage.instance
//           .ref('gategory1/banana.jpg')
//           .putData(fileBytes!);
//     }
//   }

//   addProduct() async {
//     //ProductModel();

//     await uploudImage();
//   }
// }

class MyContorller extends AddProductController {
  static MyContorller instance = Get.find();
}
