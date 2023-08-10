import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/product_name_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/two_buttons_block.dart';

class AddEditProduct extends StatelessWidget {
  const AddEditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 600,
        width: 600,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orangeAccent.withOpacity(0.2),
              Colors.white.withOpacity(0.2),
              Colors.yellow.withOpacity(0.2),
            ]),
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(15)),
        child: const Column(
          children: [
            ProductNameBlock(),
            MiddleBlock(),
            TwoButttonsBlock(),
          ],
        ),
      ),
    );
  }
}
