import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class ProductMeasureUnit extends StatelessWidget {
  const ProductMeasureUnit({required this.isEdit, super.key});

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyText('measre units'),
        Obx(() {
          return Row(
            children: [
              const MyText('kg'),
              Radio(
                  value: Unit.kilo,
                  groupValue: isEdit
                      ? myController.editProductPageModel.value.unitGroupValue
                      : myController.addProductModel.value.unitGroupValue,
                  onChanged: (String? s) {
                    if (isEdit) {
                      myController.editChangeGroupValue(s!);
                    } else {
                      myController.addChangeGroupValue(s!);
                    }
                  }),
              const MyText('piece'),
              Radio(
                  value: Unit.piece,
                  groupValue: isEdit
                      ? myController.editProductPageModel.value.unitGroupValue
                      : myController.addProductModel.value.unitGroupValue,
                  onChanged: (String? s) {
                    if (isEdit) {
                      myController.editChangeGroupValue(s!);
                    } else {
                      myController.addChangeGroupValue(s!);
                    }
                  }),
              const SizedBox(
                height: 10,
              )
            ],
          );
        })
      ],
    );
  }
}
