import 'package:flutter/material.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/global_widgets/purchase/purchase_template/purchase_template.dart';

class AllPurchasesList extends StatelessWidget {
  const AllPurchasesList({required this.dataList, super.key});

  final List<Purchase> dataList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PurchaseTemplate2(dataList[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: dataList.length),
    );
  }
}
