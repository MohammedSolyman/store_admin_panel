import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class OnSaleBlock extends StatelessWidget {
  const OnSaleBlock({
    required this.isEdit,
    super.key,
  });

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isEdit
                  ? myController.editProductPageModel.value.isOnSaleBoxValue
                  : myController.addProductModel.value.isOnSaleBoxValue,
              onChanged: (bool? b) {
                myController.addChangeIsOnSaleBoxValue(b!);
              }),
          const MyText('on sale'),
        ],
      );
    });
  }
}
