import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/data_types/selected_image.dart';
import 'package:store_admin_panel/models/edit_product_page_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductPageController extends AddProductController {
  Rx<EditProductPageModel> editProductPageModel = EditProductPageModel().obs;

  manipulateEditProperties(Product? product) {
    //this function wil be called once EditProductPage() will be called.
    if (product != null) {
      editProductPageModel.update((val) async {
        val!.tecProductName.text = product.productName;
        val.productOriginalName = product.productName;
        val.tecProductPrice.text = product.productPrice.toString();
        val.unitGroupValue = product.productUnit;
        val.categoryGroupValue = product.productCategory;
        val.isOnSaleBoxValue = product.isOnSale;
        val.imageUrl = product.productImage;
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

  Future<void> _deleteImage() async {
    String imageUrl = editProductPageModel.value.imageUrl;

    try {
      FirebaseStorage instance = FirebaseStorage.instance;

      Reference imageRef = instance.refFromURL(imageUrl);
      await imageRef.delete();
    } catch (e) {
      print('error dialog $e');
    }
  }

  _deleteData() async {
    String productOriginalName =
        editProductPageModel.value.productOriginalName!;

    try {
      FirebaseFirestore instance = FirebaseFirestore.instance;

      DocumentReference<Map<String, dynamic>> decRef =
          instance.doc('products/$productOriginalName');

      decRef.delete();
    } catch (e) {
      print('error dialog $e');
    }
  }

  editUploadFunc(BuildContext context) async {}

  editDeleteFunc(BuildContext context) async {
//1. ask user confirmation

//2. delete the image
/*
dont delete product images, because if some user has purchased this product the 
purchase template will need the image of this product,
 so if you removed this image, the purchase template will throw an error.*/
    // await _deleteImage();

    //3. delete the

    await _deleteData();

    //4. update data
    await getProducts();

    //5. navigate to
    toAllProducts(context);
  }
}
