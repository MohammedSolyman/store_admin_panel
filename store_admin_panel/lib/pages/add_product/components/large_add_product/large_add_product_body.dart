import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/add_product_template.dart';
import 'package:store_admin_panel/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class LargeAddProductBody extends StatelessWidget {
  const LargeAddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            TitleAndSearch(PagesNames.addProduct, false),
            MySizedBox(),
            AddProductTemplate()
          ],
        ),
      ),
    ));
  }
}
