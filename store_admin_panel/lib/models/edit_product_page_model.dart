import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';

class EditProductPageModel {
  //user inpput information
  String unitGroupValue = Unit.kilo;
  String categoryGroupValue = "";
  bool isOnSaleBoxValue = false;
  String imageUrl = "";
  TextEditingController tecProductName = TextEditingController();
  TextEditingController tecProductPrice = TextEditingController();

  //selected image information
  Uint8List? fileBytes;
  String? imageName;
}
