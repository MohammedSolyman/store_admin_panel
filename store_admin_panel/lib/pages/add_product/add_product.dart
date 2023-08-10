import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/add_product/components/large_add_product/large_add_product.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';
import 'components/not_large_add_product/not_large_add_product.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDirector(
        smallWidget: NotLargeAddProduct(),
        mediumWidget: NotLargeAddProduct(),
        largeWidget: LargeAddProduct());
  }
}
