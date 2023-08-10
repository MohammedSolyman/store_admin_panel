import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/purchase/purchase_template/purchase_template.dart';

class AllPurchasesList extends StatelessWidget {
  const AllPurchasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const PurchaseTemplate();
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 100),
    );
  }
}
