import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

Future<void> showMyDialoge(
    {required BuildContext context,
    required Color col,
    required String title,
    required content}) async {
  await Get.defaultDialog(
      title: title,
      titleStyle: Theme.of(context).textTheme.bodyLarge,
      backgroundColor: col.withOpacity(0.5),
      content: MyText(content));
}
