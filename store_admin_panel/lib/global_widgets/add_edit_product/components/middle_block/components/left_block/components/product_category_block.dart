import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class ProductCategoryBlock extends StatelessWidget {
  const ProductCategoryBlock({required this.isEdit, super.key});

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyText('product category'),
        const SizedBox(
          height: 5,
        ),
        DropdownMenu(
            initialSelection: isEdit
                ? myController.editProductPageModel.value.categoryGroupValue
                : myController.addProductModel.value.categoryGroupValue,
            onSelected: (value) {
              if (isEdit) {
                myController.editChangeCategoryGroupValue(value!);
              } else {
                myController.addChangeCategoryGroupValue(value!);
              }
            },
            enableFilter: true,
            inputDecorationTheme: InputDecorationTheme(
                fillColor: Theme.of(context).primaryColor,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            dropdownMenuEntries:
                List.generate(Category.categoryList.length, (index) {
              return DropdownMenuEntry(
                  style: ButtonStyle(
                      textStyle: const MaterialStatePropertyAll(
                          TextStyle(fontSize: 11)),
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor)),
                  value: Category.categoryList[index],
                  label: Category.categoryList[index]);
            })),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
