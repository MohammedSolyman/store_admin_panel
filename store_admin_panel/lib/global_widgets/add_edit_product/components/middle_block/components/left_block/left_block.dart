import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/left_block/components/my_divider.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/left_block/components/on_sale_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/left_block/components/product_category_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/left_block/components/product_measure_unit.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/left_block/components/product_price_block.dart';

class LeftBlock extends StatelessWidget {
  const LeftBlock({
    required this.isEdit,
    super.key,
  });
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductPriceBlock(isEdit: isEdit),
          const MyDivider(),
          ProductCategoryBlock(isEdit: isEdit),
          const MyDivider(),
          ProductMeasureUnit(isEdit: isEdit),
          const MyDivider(),
          OnSaleBlock(isEdit: isEdit),
        ],
      ),
    );
  }
}
