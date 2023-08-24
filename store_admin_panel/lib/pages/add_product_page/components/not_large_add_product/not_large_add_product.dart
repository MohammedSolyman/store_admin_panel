import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/add_product_page/components/not_large_add_product/not_large_add_product_body.dart';

class NotLargeAddProduct extends StatelessWidget {
  const NotLargeAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SizedBox(
        width: 200,
        child: MyDrawer(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(child: NotLargeAddProductBody()),
    );
  }
}
