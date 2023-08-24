import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/edit_product_page/components/large_edit_product/large_edit_product_body.dart';

class LargeEditProduct extends StatelessWidget {
  const LargeEditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Row(
          children: [MyDrawer(), SizedBox(width: 15), LargeEditProductBody()],
        ),
      ),
    );
  }
}
