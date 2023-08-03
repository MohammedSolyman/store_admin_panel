

import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/add_product/components/large_add_product/large_add_product.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveDirector(
      smallWidget: LargeAddProduct(),
      mediumWidget: LargeAddProduct(),
      largeWidget: LargeAddProduct(),);
  }
}