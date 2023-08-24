import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class ProductNameBlock extends StatelessWidget {
  const ProductNameBlock({this.product, super.key});

  final Product? product;
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
            controller: myController.editProductPageModel.value.tecProductName,
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
