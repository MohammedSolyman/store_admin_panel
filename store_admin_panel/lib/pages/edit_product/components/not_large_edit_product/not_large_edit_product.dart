import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/edit_product/components/not_large_edit_product/not_large_edit_product_body.dart';

class NotLargeEditProduct extends StatelessWidget {
  const NotLargeEditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SizedBox(
        width: 200,
        child: MyDrawer(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(child: NotLargeEditProductBody()),
    );
  }
}
