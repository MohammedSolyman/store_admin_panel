import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/selected_image.dart';

class EditProductPageModel {
  //user inpput information
  String productOriginalName = '';
  String unitGroupValue = Unit.kilo;
  String categoryGroupValue = "";
  bool isOnSaleBoxValue = false;
  String imageUrl = "";
  TextEditingController tecProductName = TextEditingController();
  TextEditingController tecProductPrice = TextEditingController();
  bool changeOriginalImage = false;

  //selected image information
  SelectedImage selectedImage = SelectedImage();
}
