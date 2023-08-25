import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/data_types/selected_image.dart';
import 'package:store_admin_panel/models/edit_product_page_model.dart';

class EditProductPageController extends AddProductController {
  Rx<EditProductPageModel> editProductPageModel = EditProductPageModel().obs;

  editDeleteProduct() {}

  manipulateEditProperties(Product? product) {
    //this function wil be called once EditProductPage() will be called.
    if (product != null) {
      editProductPageModel.update((val) async {
        val!.tecProductName.text = product.productName;
        val.tecProductPrice.text = product.productPrice.toString();
        val.unitGroupValue = product.productUnit;
        val.categoryGroupValue = product.productCategory;
        val.isOnSaleBoxValue = product.isOnSale;
        val.imageUrl = product.productImage;

// //add thee image information as Uint8List
//         print('before-------------------');
//         print(val.imageUrl);
//         // Uint8List bytes = (await NetworkAssetBundle(Uri.parse(val.imageUrl))
//         //         .load(val.imageUrl))
//         //     .buffer
//         //     .asUint8List();

//         final ByteData data = await NetworkAssetBundle(Uri.parse(val.imageUrl))
//             .load(val.imageUrl);

//         print('between--------------------');
//         final Uint8List bytes = data.buffer.asUint8List();

//         print('from manipulate function-------------------');
//         print(bytes.toString());
//         val.selectedImage.fileBytes = bytes;
//         val.selectedImage.imageBaseName = product.productName;
      });
    }
  }

  editChangeGroupValue(String newValue) {
    editProductPageModel.update((val) {
      val!.unitGroupValue = newValue;
    });
  }

  editChangeIsOnSaleBoxValue(bool newValue) {
    editProductPageModel.update((val) {
      val!.isOnSaleBoxValue = newValue;
    });
  }

  editChangeCategoryGroupValue(String newValue) {
    editProductPageModel.update((val) {
      val!.categoryGroupValue = newValue;
    });
  }

  void editCLearImage() {
    //remove the current image from the screen
    editProductPageModel.update((val) {
      val!.selectedImage.fileBytes = null;
      val.selectedImage.imageBaseName = '';
      val.changeOriginalImage = true;
    });
  }

  editChooseImage() async {
    //1. remove the original image first
    editCLearImage();

    //2. choose an image and then, it will be automatically displayed on the screen
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      SelectedImage selectedImage = SelectedImage.from(result);

      editProductPageModel.update((val) {
        val!.selectedImage = selectedImage;
      });
    }
  }

  editUploadFunc() {}
}
