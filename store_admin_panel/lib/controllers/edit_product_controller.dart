import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/data_types/selected_image.dart';
import 'package:store_admin_panel/global_widgets/dialoges/show_my_dialoge.dart';
import 'package:store_admin_panel/global_widgets/dialoges/show_waiting.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';
import 'package:store_admin_panel/models/edit_product_page_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductPageController extends AddProductController {
  Rx<EditProductPageModel> editProductPageModel = EditProductPageModel().obs;

  void manipulateEditProperties(Product? product) {
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

  void editChangeGroupValue(String newValue) {
    editProductPageModel.update((val) {
      val!.unitGroupValue = newValue;
    });
  }

  void editChangeIsOnSaleBoxValue(bool newValue) {
    editProductPageModel.update((val) {
      val!.isOnSaleBoxValue = newValue;
    });
  }

  void editChangeCategoryGroupValue(String newValue) {
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

  Future<void> editChooseImage() async {
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

  Future<void> _deleteImage(BuildContext context) async {
    String imageUrl = editProductPageModel.value.imageUrl;

    try {
      FirebaseStorage instance = FirebaseStorage.instance;

      Reference imageRef = instance.refFromURL(imageUrl);
      await imageRef.delete();
    } catch (e) {
      await showMyDialoge(
          context: context,
          col: Colors.red.withOpacity(0.75),
          title: 'error',
          content: e.toString());
    }
  }

  Future<void> _deleteData(BuildContext context) async {
    String productOriginalName = editProductPageModel.value.productOriginalName;

    try {
      FirebaseFirestore instance = FirebaseFirestore.instance;

      DocumentReference<Map<String, dynamic>> decRef =
          instance.doc('products/$productOriginalName');

      decRef.delete();
    } catch (e) {
      await showMyDialoge(
          context: context,
          col: Colors.red.withOpacity(0.75),
          title: 'error',
          content: e.toString());
    }
  }

  bool editIsImageCHoosen() {
    //is there an image on the screen
    return editProductPageModel.value.selectedImage.fileBytes != null &&
        editProductPageModel.value.selectedImage.imageBaseName != null;
  }

  Future<void> _editCollectUploudImage(BuildContext context) async {
    //1. if the user has selected an image, upload it to firebase,
    if (editIsImageCHoosen()) {
      //1.1 collect image data
      Uint8List? fileBytes = editProductPageModel.value.selectedImage.fileBytes;
      String? imageName =
          editProductPageModel.value.selectedImage.imageBaseName;

      //1.2 upload image
      FirebaseStorage myInstance = FirebaseStorage.instance;
      Reference myRef = myInstance.ref('images/$imageName');
      await myRef.putData(fileBytes!);
      String url = await myRef.getDownloadURL();
      editProductPageModel.update((val) {
        val!.imageUrl = url;
      });
    } else {
      //2. if the user has not selected an image ask him to upload the image first.
      await showMyDialoge(
          context: context,
          col: Colors.red.withOpacity(0.75),
          title: 'sorry',
          content: 'choose an image first');
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

  Future<void> askToEdit(BuildContext context) async {
    AlertDialog x = AlertDialog(
      content: const MyText('Do you want to update product'),
      actions: [
        ElevatedButton(
            onPressed: () {
              toBack(context);
            },
            child: const Text('cancel')),
        ElevatedButton(
            onPressed: () {
              toBack(context);
              editEditFunc(context);
            },
            child: const Text('ok')),
      ],
    );

    await showDialog(
        context: context,
        builder: (context) {
          return x;
        });
  }

  Future<void> editEditFunc(BuildContext context) async {
    //1. show waiting progress indicator
    await showWaiting(context: context);

    // 2. If the user has changed the original image, upload the new one.
    if (editProductPageModel.value.changeOriginalImage) {
      // dont't delete the original image, beacause if someone bought this product
      //we will npt be able to display it in orders template.
      // await _deleteImage(context);

      //collect and  uplaud the new image to firestorage
      await _editCollectUploudImage(context);
    }

    //3. collect product data
    Map<String, dynamic> myMap = await _editCollectData();

    //4 edit product data
    FirebaseFirestore myInstance = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> docRef = myInstance
        .doc('products/${editProductPageModel.value.tecProductName.text}');
    await docRef.set(myMap, SetOptions(merge: true));

    //5. clear image and data fields
    editCLearImage();
    _editClearData();

    //6. update data
    await getProducts();

    //7. navigate to all products page
    toAllProducts(context);
  }

  Future<void> editDeleteFunc(BuildContext context) async {
    await showWaiting(context: context);
//1. ask user confirmation

//2. delete the image
/*
dont delete product images, because if some user has purchased this product the 
purchase template will need the image of this product,
 so if you removed this image, the purchase template will throw an error.*/
    // await _deleteImage();

    //3. delete the

    await _deleteData(context);
    // await showMyDialoge(
    //     context: context,
    //     col: Colors.green.withOpacity(0.75),
    //     title: 'done',
    //     content: 'the product was deleted succesfully');
    //4. update data
    await getProducts();

    //5. navigate to
    toAllProducts(context);
  }
}
