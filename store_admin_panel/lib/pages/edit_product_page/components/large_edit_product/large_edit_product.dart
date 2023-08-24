import 'package:flutter/material.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/edit_product_page/components/large_edit_product/large_edit_product_body.dart';

class LargeEditProduct extends StatelessWidget {
  const LargeEditProduct({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Row(
          children: [
            MyDrawer(),
            SizedBox(width: 15),
            LargeEditProductBody(
              product: product,
            )
          ],
        ),
      ),
    );
  }
}
