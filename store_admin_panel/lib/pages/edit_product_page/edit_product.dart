import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/pages/edit_product_page/components/large_edit_product/large_edit_product.dart';
import 'package:store_admin_panel/pages/edit_product_page/components/not_large_edit_product/not_large_edit_product.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({required this.product, super.key});

  final Product product;
  @override
  Widget build(BuildContext context) {
    myController.manipulateEditTec(product);
    return ResponsiveDirector(
        smallWidget: NotLargeEditProduct(product: product),
        mediumWidget: NotLargeEditProduct(product: product),
        largeWidget: LargeEditProduct(product: product));
  }
}
