import 'package:flutter/material.dart';

class LargeOverviewBody extends StatelessWidget {
  const LargeOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('overview'),
                  SizedBox(width: 250, child: TextFormField())
                ],
              ),
              Text('latest products'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [Icon(Icons.store), Text('view all')],
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [Icon(Icons.add), Text('add product')],
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
