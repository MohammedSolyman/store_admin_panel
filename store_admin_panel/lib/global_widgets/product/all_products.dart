import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/product/products_template.dart';

class AllProductsTemplates extends StatelessWidget {
  const AllProductsTemplates({required this.countPerLine, super.key});

  final int countPerLine;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProductTemplates(
        countPerLine: countPerLine,
        dataList: myController.dataModel.value.allProducts,
      );
    });
  }
}
