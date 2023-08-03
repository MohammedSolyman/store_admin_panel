import 'package:flutter/material.dart';

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
        )
    , const SizedBox(width: 20,)
    , Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

Text('2 kilos for 5 \$',style: Theme.of(context).textTheme.bodyLarge),
Text('By Faers',        style: Theme.of(context).textTheme.bodyLarge),
Text('date: 10-02-2023',style: Theme.of(context).textTheme.bodyLarge),

     ],)
     
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
