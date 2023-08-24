import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/add_product_page/components/large_add_product/large_add_product_body.dart';

class LargeAddProduct extends StatelessWidget {
  const LargeAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Row(
          children: [MyDrawer(), SizedBox(width: 15), LargeAddProductBody()],
        ),
      ),
    );
  }
}
