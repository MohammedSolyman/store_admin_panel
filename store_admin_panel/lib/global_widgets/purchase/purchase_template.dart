import 'package:flutter/material.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';
import 'package:store_admin_panel/global_widgets/texts/my_title.dart';

class PurchaseTemplate extends StatelessWidget {
  const PurchaseTemplate(
    this.purchase, {
    super.key,
  });

  final Purchase purchase;
  @override
  Widget build(BuildContext context) {
    int intTime = purchase.purchaseTime;
    DateTime rowTime = DateTime.fromMillisecondsSinceEpoch(intTime);
    List<String> timeList = rowTime.toString().split(' ');
    String date = timeList[0];
    String time = timeList[1].split('.')[0];

    return Row(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(purchase.product!.productImage))),
        ),
        Expanded(
          child: ListTile(
            isThreeLine: true,
            title: MyTitle(purchase.product!.productName),
            subtitle: MyText(
                '\$${purchase.totalPrice}  \n$date  \n$time  \nuser id: ${purchase.userId}'),
          ),
        ),
      ],
    );
  }
}
