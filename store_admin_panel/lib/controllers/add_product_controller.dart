import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/navigation_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';

class AddProductController extends NavigationController {
  chooseImage() async {
    //choose an image and display it on the screen
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String imageName = result.files.first.name;

      addProductModel.update((val) {
        val!.fileBytes = fileBytes;
        val.imageName = imageName;
      });
    }
  }

  void clearImage() {
    //remove the current image from the screen
    addProductModel.update((val) {
      val!.fileBytes = null;
      val.imageName = '';
    });
  }

  void _clearData() {
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

  bool isImageCHoosen() {
    //is there an image on the screen
    return addProductModel.value.fileBytes != null &&
        addProductModel.value.imageName != null;
  }

  _uploudImage() async {
    //if the user has selected an image, upload it to firebase,

    if (isImageCHoosen()) {
      Uint8List? fileBytes = addProductModel.value.fileBytes;
      String? imageName = addProductModel.value.imageName;

      FirebaseStorage myInstance = FirebaseStorage.instance;
      Reference myRef = myInstance.ref('images/$imageName');
      await myRef.putData(fileBytes!);
      String url = await myRef.getDownloadURL();
      addProductModel.update((val) {
        val!.imageUrl = url;
      });
    }
  }

  Future<Map<String, dynamic>> _collectData() async {
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

  Future<void> uploadFunc(BuildContext context) async {
    // if the user has chosen an image, upload the image then upload the data,and clear all data
    // if not,ask the user to upload the image first.
    if (isImageCHoosen()) {
      //1. upload image
      await _uploudImage();

      //2. upload data
      Map<String, dynamic> myMap = await _collectData();

      FirebaseFirestore myInstance = FirebaseFirestore.instance;
      DocumentReference<Map<String, dynamic>> docRef = myInstance
          .doc('products/${addProductModel.value.tecProductName.text}');
      docRef.set(myMap);

      //3. clear image and data
      clearImage();
      _clearData();

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

  addProduct() {}
}
