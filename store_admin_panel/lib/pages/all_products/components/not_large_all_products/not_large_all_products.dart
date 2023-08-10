import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/all_products/components/not_large_all_products/not_large_all_products_body.dart';

class NotLargeAllProducts extends StatelessWidget {
  const NotLargeAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SizedBox(
        width: 200,
        child: MyDrawer(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(child: NotLargeAllProductsBody()),
    );
  }
}
