import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class ProductPriceBlock extends StatelessWidget {
  const ProductPriceBlock({required this.isEdit, super.key});

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyText('price in \$ *'),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: isEdit
                ? myController.editProductPageModel.value.tecProductPrice
                : myController.addProductModel.value.tecProductPrice,
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
