import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/product/product_template/product_template.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct(this.count, {super.key});

  final int count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 5.0,
          mainAxisExtent: 175,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const ProductTemplate();
        });
  }
}
