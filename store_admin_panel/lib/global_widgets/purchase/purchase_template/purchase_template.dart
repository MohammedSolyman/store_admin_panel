import 'package:flutter/material.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';
import 'package:store_admin_panel/global_widgets/texts/my_title.dart';

class PurchaseTemplate2 extends StatelessWidget {
  const PurchaseTemplate2(
    this.purchase, {
    super.key,
  });

  final Purchase purchase;
  @override
  Widget build(BuildContext context) {
    int intTime = purchase.purchaseTime;
    DateTime time = DateTime.fromMillisecondsSinceEpoch(intTime);
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
                '\$${purchase.totalPrice}  \n${time.toString()}  \nuser id: ${purchase.userId}'),
          ),
        ),
      ],
    );
  }
}

class PurchaseTemplate extends StatelessWidget {
  const PurchaseTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 75,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              image: const DecorationImage(image: AssetImage('store.png'))),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2 kilos for 5 \$',
                style: Theme.of(context).textTheme.bodyLarge),
            Text('By Faers', style: Theme.of(context).textTheme.bodyLarge),
            Text('date: 10-02-2023',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}

class LatestPurchases extends StatelessWidget {
  const LatestPurchases({super.key});

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
          itemCount: 5),
    );
  }
}
