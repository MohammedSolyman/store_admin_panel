import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';

class CenterBlock extends StatelessWidget {
  const CenterBlock({
    required this.isEdit,
    super.key,
  });

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: SelectedWidget(isEdit: isEdit)));
  }
}

class SelectedWidget extends StatelessWidget {
  const SelectedWidget({required this.isEdit, super.key});
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //1. if it is add product page
      if (!isEdit) {
        if (myController.addProductModel.value.selectedImage.fileBytes !=
                null &&
            myController.addProductModel.value.selectedImage.imageBaseName !=
                "") {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: MemoryImage(myController
                        .addProductModel.value.selectedImage.fileBytes!))),
          );
        } else {
          return const MyDottedBorder();
        }
      }

      //2.if it is edit product

      else {
//in case the user didn't  change the original image
        if (myController.editProductPageModel.value.changeOriginalImage ==
            false) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        myController.editProductPageModel.value.imageUrl))),
          );
        } else {
          //in case the user changed the original image
          if (myController.editProductPageModel.value.selectedImage.fileBytes !=
                  null &&
              myController
                      .editProductPageModel.value.selectedImage.imageBaseName !=
                  "") {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: MemoryImage(myController.editProductPageModel.value
                          .selectedImage.fileBytes!))),
            );
          } else {
            return const MyDottedBorder();
          }
        }
      }
    });
  }
}

class MyDottedBorder extends StatelessWidget {
  const MyDottedBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).textTheme.bodyLarge!.color!,
      borderPadding: const EdgeInsets.all(10),
      borderType: BorderType.RRect,
      child: const Center(
        child: Icon(Icons.image),
      ),
    );
  }
}
