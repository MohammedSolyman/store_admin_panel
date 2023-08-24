import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/all_products_page/components/large_all_products/large_all_products.dart';
import 'package:store_admin_panel/pages/all_products_page/components/not_large_all_products/not_large_all_products.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDirector(
        smallWidget: NotLargeAllProducts(),
        mediumWidget: NotLargeAllProducts(),
        largeWidget: LargeAllProducts());
  }
}
