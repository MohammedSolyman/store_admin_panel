import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/center_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/left_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/components/right_block.dart';

class MiddleBlock extends StatelessWidget {
  const MiddleBlock({
    required this.isEdit,
    super.key,
  });

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              LeftBlock(isEdit: isEdit),
              const CenterBlock(),
              const RightBlock()
            ],
          ),
        ));
  }
}
