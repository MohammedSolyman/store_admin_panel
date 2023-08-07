

import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/add_edit_product.dart';

class LargeAddProductBody extends StatelessWidget {
  const LargeAddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: AddEditProduct()) ;
  }
}