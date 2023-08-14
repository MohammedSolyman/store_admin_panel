import 'package:store_admin_panel/constants/constants.dart';

class ProductModel {
  String productName = "";
  double productPrice = 0;
  String productUnit = Unit.kilo;
  String productCategory = Category.grains;
  bool isOnSale = false;
  String productImage = "";
  DateTime createdOn;
  DateTime lastModifiedOn;

  ProductModel(
      {required this.productName,
      required this.productPrice,
      required this.productUnit,
      required this.productCategory,
      required this.isOnSale,
      required this.productImage,
      required this.createdOn,
      required this.lastModifiedOn});

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productUnit': productUnit,
      'productCategory': productCategory,
      'isOnSale': isOnSale,
      'productImage': productImage,
      'createdOn': createdOn,
      'lastModifiedOn': lastModifiedOn
    };
  }
}
