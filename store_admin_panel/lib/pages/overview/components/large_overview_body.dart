import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/product_template/product_template.dart';
import 'package:store_admin_panel/global_widgets/purchase_template/purchase_template.dart';

class LargeOverviewBody extends StatelessWidget {
  const LargeOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          padding: EdgeInsets.all(7),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('overview',
                      style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.search,
                                    size: 20,
                                  )),
                            ),
                            hintText: "search",
                            hintStyle: Theme.of(context).textTheme.bodyLarge,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
              ),
              SizedBox(
                height: 10,
              ),
              Text('latest products',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                height: 10,
              ),
              Container(
                child: LatestProduct(),
              ),
              SizedBox(
                height: 10,
              ),
              Text('latest orders',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                height: 10,
              ),
              Container(
                child: LatestPurchases(),
              )
            ],
          ),
        ));
  }
}
