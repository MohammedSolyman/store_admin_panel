import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_button/my_button.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';
import 'package:dotted_border/dotted_border.dart';

class MiddleBlock extends StatelessWidget {
  const MiddleBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: const Row(
            children: [FirstBlock(), ImageBlock(), ThirdBlock()],
          ),
        ));
  }
}

class ThirdBlock extends StatelessWidget {
  const ThirdBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 145,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(Icons.delete, 'clear image'),
          SizedBox(
            height: 15,
          ),
          MyButton(Icons.upload, 'upload image')
        ],
      ),
    );
  }
}

class FirstBlock extends StatelessWidget {
  const FirstBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 145,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductPriceBlock(),
          ProductCategoryBlock(),
          ProductMeasureUnit(),
          OnSaleBlock()
        ],
      ),
    );
  }
}

class ImageBlock extends StatelessWidget {
  const ImageBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: DottedBorder(
          color: Theme.of(context).textTheme.bodyLarge!.color!,
          borderPadding: const EdgeInsets.all(8),
          borderType: BorderType.RRect,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.image),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {}, child: const MyText('choose image'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnSaleBlock extends StatelessWidget {
  const OnSaleBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: myController.addProductModel.value.checkBoxValue,
              onChanged: (bool? b) {
                myController.changeCheckBoxValue(b!);
              }),
          const MyText('on sale'),
        ],
      );
    });
  }
}

class ProductMeasureUnit extends StatelessWidget {
  const ProductMeasureUnit({super.key});

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
                  groupValue: myController.addProductModel.value.groupValue,
                  onChanged: (String? s) {
                    myController.changeGroupValue(s!);
                  }),
              const MyText('piece'),
              Radio(
                  value: Unit.piece,
                  groupValue: myController.addProductModel.value.groupValue,
                  onChanged: (String? s) {
                    myController.changeGroupValue(s!);
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
  const ProductCategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyText('product category'),
        const SizedBox(
          height: 5,
          //   width: 50,
        ),
        DropdownMenu(
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
  const ProductPriceBlock({super.key});

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
