import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/edit_product_template.dart';
import 'package:store_admin_panel/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class NotLargeEditProductBody extends StatelessWidget {
  const NotLargeEditProductBody({required this.product, super.key});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleAndSearch(PagesNames.editProduct, true),
            MySizedBox(),
            EditProductTemplate(
              product: product,
            )
          ],
        ),
      ),
    );
  }
}
