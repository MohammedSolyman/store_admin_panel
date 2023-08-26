import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/constants/constants.dart';
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
        val.createdOn = product.createdOn;
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

  void _editClearData() {
    //clear all the product data
    editProductPageModel.update((val) {
      val!.unitGroupValue = Unit.kilo;
      val.categoryGroupValue = "";
      val.isOnSaleBoxValue = false;
      val.imageUrl = "";
      val.tecProductName.text = '';
      val.tecProductPrice.text = '';
      val.createdOn = 0;
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
    String productOriginalName = editProductPageModel.value.productOriginalName;

    try {
      FirebaseFirestore instance = FirebaseFirestore.instance;

      DocumentReference<Map<String, dynamic>> decRef =
          instance.doc('products/$productOriginalName');

      decRef.delete();
    } catch (e) {
      print('error dialog $e');
    }
  }

  bool editIsImageCHoosen() {
    //is there an image on the screen
    return editProductPageModel.value.selectedImage.fileBytes != null &&
        editProductPageModel.value.selectedImage.imageBaseName != null;
  }

  _editCollectUploudImage() async {
    //if the user has selected an image, upload it to firebase,

    if (editIsImageCHoosen()) {
      //collect image data
      Uint8List? fileBytes = editProductPageModel.value.selectedImage.fileBytes;
      String? imageName =
          editProductPageModel.value.selectedImage.imageBaseName;

//upload image
      FirebaseStorage myInstance = FirebaseStorage.instance;
      Reference myRef = myInstance.ref('images/$imageName');
      await myRef.putData(fileBytes!);
      String url = await myRef.getDownloadURL();
      editProductPageModel.update((val) {
        val!.imageUrl = url;
      });
    }
  }

  Future<Map<String, dynamic>> _editCollectData() async {
    //collect user input to be uploaded
    String productImage = editProductPageModel.value.imageUrl;
    String productName = editProductPageModel.value.tecProductName.text;
    double productPrice =
        double.parse(editProductPageModel.value.tecProductPrice.text);
    String productCategory = editProductPageModel.value.categoryGroupValue;
    String productUnit = editProductPageModel.value.unitGroupValue;
    bool isOnSale = editProductPageModel.value.isOnSaleBoxValue;
    int createdOn = editProductPageModel.value.createdOn;
    int now = DateTime.now().millisecondsSinceEpoch;

    Product productModel = Product(
        productName: productName,
        productPrice: productPrice,
        productUnit: productUnit,
        productCategory: productCategory,
        isOnSale: isOnSale,
        productImage: productImage,
        createdOn: createdOn,
        lastModifiedOn: now);

    return productModel.toMap();
  }

  editEditFunc(BuildContext context) async {
    //1. ask user confirmation

//2. delete the original image from firestorage, if the user updated the original image.

    if (editProductPageModel.value.changeOriginalImage) {
      await _deleteImage();
    }

//3. collectand  uplaud the new image to firestorage
    await _editCollectUploudImage();

//4.1 collect product
    Map<String, dynamic> myMap = await _editCollectData();

//4.2 edit product

    FirebaseFirestore myInstance = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> docRef = myInstance
        .doc('products/${editProductPageModel.value.tecProductName.text}');
    docRef.set(myMap, SetOptions(merge: true));

    //3. clear image and data
    editCLearImage();
    _editClearData();

    //6. update data
    await getProducts();

    //7. navigate to
    toAllProducts(context);
  }

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
