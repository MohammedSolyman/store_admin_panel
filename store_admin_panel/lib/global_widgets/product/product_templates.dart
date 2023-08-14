import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/product/product_template.dart';
import 'package:store_admin_panel/models/product_model.dart';

class ProductTemplates extends StatelessWidget {
  const ProductTemplates(
      {required this.countPerLine, required this.dataList, super.key});

  final int countPerLine;
  final List<ProductModel> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.length == 0
        ? Text('there is no products')
        : GridView.builder(
            shrinkWrap: true,
            itemCount: dataList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: countPerLine,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 5.0,
              mainAxisExtent: 175,
            ),
            itemBuilder: (BuildContext context, int index) {
              ProductModel myProduct = dataList[index];
              return ProductTemplate(myProduct);
            });
  }
}

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

class LatestProductsTemplates extends StatelessWidget {
  const LatestProductsTemplates({required this.countPerLine, super.key});

  final int countPerLine;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProductTemplates(
        countPerLine: countPerLine,
        dataList: myController.dataModel.value.latestProducts,
      );
    });
  }
}
