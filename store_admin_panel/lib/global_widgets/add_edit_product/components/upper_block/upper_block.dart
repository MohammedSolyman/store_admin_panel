import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class UpperBlock extends StatelessWidget {
  const UpperBlock({required this.isEdit, super.key});

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        const MyText('product name*'),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: isEdit
                ? myController.editProductPageModel.value.tecProductName
                : myController.addProductModel.value.tecProductName,
            decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    ));
  }
}
