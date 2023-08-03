import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/my_text.dart';

class ProductNameBlock extends StatelessWidget {
  const ProductNameBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        MyText('product name \$ *'),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
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
