import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';

class CenterBlock extends StatelessWidget {
  const CenterBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const SelectedWidget()));
  }
}

class SelectedWidget extends StatelessWidget {
  const SelectedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myController.addProductModel.value.fileBytes != null &&
          myController.addProductModel.value.imageName != "") {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: MemoryImage(
                      myController.addProductModel.value.fileBytes!))),
        );
      } else {
        return DottedBorder(
          color: Theme.of(context).textTheme.bodyLarge!.color!,
          borderPadding: const EdgeInsets.all(10),
          borderType: BorderType.RRect,
          child: const Center(
            child: Icon(Icons.image),
          ),
        );
      }
    });
  }
}
