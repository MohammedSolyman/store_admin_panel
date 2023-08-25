import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/lower_block/lower_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/middle_block/middle_block.dart';
import 'package:store_admin_panel/global_widgets/add_edit_product/components/upper_block/upper_block.dart';

class AddEditProductTemplate extends StatelessWidget {
  const AddEditProductTemplate({required this.isEdit, super.key});

  final bool isEdit;
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
        child: Column(
          children: [
            UpperBlock(isEdit: isEdit),
            MiddleBlock(isEdit: isEdit),
            LowerBlock(isEdit: isEdit),
          ],
        ),
      ),
    );
  }
}
