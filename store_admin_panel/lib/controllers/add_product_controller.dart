import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/navigation_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/data_types/selected_image.dart';
import 'package:store_admin_panel/models/add_product_page_model.dart';

class AddProductController extends NavigationController {
  Rx<AddProductModel> addProductModel = AddProductModel().obs;

  addChangeGroupValue(String newValue) {
    addProductModel.update((val) {
      val!.unitGroupValue = newValue;
    });
  }

  addChangeIsOnSaleBoxValue(bool newValue) {
    addProductModel.update((val) {
      val!.isOnSaleBoxValue = newValue;
    });
  }

  addChangeCategoryGroupValue(String newValue) {
    addProductModel.update((val) {
      val!.categoryGroupValue = newValue;
    });
  }

  addChooseImage() async {
    //choose an image and then, it will be automatically displayed on the screen
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      SelectedImage selectedImage = SelectedImage.from(result);

      addProductModel.update((val) {
        val!.selectedImage = selectedImage;
      });
    }
  }

  void addCLearImage() {
    //remove the current image from the screen
    addProductModel.update((val) {
      val!.selectedImage.fileBytes = null;
      val.selectedImage.imageBaseName = '';
    });
  }

  void _addClearData() {
    //clear all the product data
    addProductModel.update((val) {
      val!.unitGroupValue = Unit.kilo;
      val.categoryGroupValue = "";
      val.isOnSaleBoxValue = false;
      val.imageUrl = "";
      val.tecProductName.text = '';
      val.tecProductPrice.text = '';
    });
  }

  bool addIsImageCHoosen() {
    //is there an image on the screen
    return addProductModel.value.selectedImage.fileBytes != null &&
        addProductModel.value.selectedImage.imageBaseName != null;
  }

  _addCollectUploudImage() async {
    //if the user has selected an image, upload it to firebase,

    if (addIsImageCHoosen()) {
      //collect image data
      Uint8List? fileBytes = addProductModel.value.selectedImage.fileBytes;
      String? imageName = addProductModel.value.selectedImage.imageBaseName;

//upload image
      FirebaseStorage myInstance = FirebaseStorage.instance;
      Reference myRef = myInstance.ref('images/$imageName');
      await myRef.putData(fileBytes!);
      String url = await myRef.getDownloadURL();
      addProductModel.update((val) {
        val!.imageUrl = url;
      });
    }
  }

  Future<Map<String, dynamic>> _addCollectData() async {
    //collect user input to be uploaded
    String productImage = addProductModel.value.imageUrl;
    String productName = addProductModel.value.tecProductName.text;

    double productPrice =
        double.parse(addProductModel.value.tecProductPrice.text);

    String productCategory = addProductModel.value.categoryGroupValue;
    String productUnit = addProductModel.value.unitGroupValue;
    bool isOnSale = addProductModel.value.isOnSaleBoxValue;
    int now = DateTime.now().millisecondsSinceEpoch;

    Product productModel = Product(
        productName: productName,
        productPrice: productPrice,
        productUnit: productUnit,
        productCategory: productCategory,
        isOnSale: isOnSale,
        productImage: productImage,
        createdOn: now,
        lastModifiedOn: now);

    return productModel.toMap();
  }

  Future<void> addUploadFunc(BuildContext context) async {
    // if the user has chosen an image, upload the image then upload the data,and clear all data
    // if not,ask the user to upload the image first.
    if (addIsImageCHoosen()) {
      //1. upload image
      await _addCollectUploudImage();

      //2.1 cleect data
      Map<String, dynamic> myMap = await _addCollectData();

      //2.2 upload data
      FirebaseFirestore myInstance = FirebaseFirestore.instance;
      DocumentReference<Map<String, dynamic>> docRef = myInstance
          .doc('products/${addProductModel.value.tecProductName.text}');
      docRef.set(myMap);

      //3. clear image and data
      addCLearImage();
      _addClearData();

      //4. update the products list
      Product myProduct = Product.fromMap(myMap);
      dataModel.value.allProducts.add(myProduct);

      //5. update the latest products list
      dataModel.value.latestProducts.add(myProduct);
      dataModel.value.latestProducts
          .sort((a, b) => a.lastModifiedOn.compareTo(b.lastModifiedOn));
      dataModel.value.latestProducts.removeLast();

      //6. notify the user that the product was succesfully added
      AlertDialog x = const AlertDialog(
        content: Text('the product was succesfully added'),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return x;
          });
    } else {
      //ask the user to upload the image first.
      AlertDialog x = const AlertDialog(
        content: Text('choose an image first'),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return x;
          });
    }
  }
}
