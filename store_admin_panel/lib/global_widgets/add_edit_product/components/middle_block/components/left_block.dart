import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

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
          ProductCategoryBlock(isEdit: isEdit),
          ProductMeasureUnit(isEdit: isEdit),
          OnSaleBlock(isEdit: isEdit),
        ],
      ),
    );
  }
}

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
                    myController.addChangeGroupValue(s!);
                  }),
              const MyText('piece'),
              Radio(
                  value: Unit.piece,
                  groupValue: isEdit
                      ? myController.editProductPageModel.value.unitGroupValue
                      : myController.addProductModel.value.unitGroupValue,
                  onChanged: (String? s) {
                    myController.addChangeGroupValue(s!);
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
              myController.addChangeCategoryGroupValue(value!);
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
