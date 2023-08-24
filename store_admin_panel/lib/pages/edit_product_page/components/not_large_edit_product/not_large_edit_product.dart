import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/edit_product_page/components/not_large_edit_product/not_large_edit_product_body.dart';

class NotLargeEditProduct extends StatelessWidget {
  const NotLargeEditProduct({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SizedBox(
        width: 200,
        child: MyDrawer(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: NotLargeEditProductBody(
        product: product,
      )),
    );
  }
}
