import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/purchase/purchases_template.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class LatestPurchases extends StatelessWidget {
  const LatestPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myController.dataModel.value.latestPurchases.isEmpty) {
        return const MyText('there is no orders');
      } else {
        return PurchasesTemplate(
            dataList: myController.dataModel.value.latestPurchases);
      }
    });
  }
}
