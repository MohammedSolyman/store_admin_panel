import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/all_products_page/components/large_all_products/large_all_products_body.dart';

class LargeAllProducts extends StatelessWidget {
  const LargeAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Row(
          children: [MyDrawer(), SizedBox(width: 15), LargeAllProductsBody()],
        ),
      ),
    );
  }
}
