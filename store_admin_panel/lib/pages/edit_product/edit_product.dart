import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/edit_product/components/large_edit_product/large_edit_product.dart';
import 'package:store_admin_panel/pages/edit_product/components/not_large_edit_product/not_large_edit_product.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDirector(
        smallWidget: NotLargeEditProduct(),
        mediumWidget: NotLargeEditProduct(),
        largeWidget: LargeEditProduct());
  }
}
