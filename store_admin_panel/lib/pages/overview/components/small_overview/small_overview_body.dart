import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/product_template/product_template.dart';
import 'package:store_admin_panel/global_widgets/purchase_template/purchase_template.dart';

class SmallOverviewBody extends StatelessWidget {
  const SmallOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          TitleAndSearch(),
          MySizedBox(),
          TwoButtoms(),
          MySizedBox(),
          MyTitle('latest products'),
          MySizedBox(),
          LatestProduct(2),
          MySizedBox(),
          MyTitle('latest orders'),
          MySizedBox(),
          LatestPurchases()
        ],
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle(
    this.txt, {
    super.key,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: Theme.of(context).textTheme.headlineLarge);
  }
}

class TwoButtoms extends StatelessWidget {
  const TwoButtoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {},
            child: const Row(
              children: [Icon(Icons.store), Text('view all')],
            )),
        ElevatedButton(
            onPressed: () {
                         context.go('/addproduct');

            },
            child: const Row(
              children: [Icon(Icons.add), Text('add product')],
            )),
      ],
    );
  }
}

class MySizedBox extends StatelessWidget {
  const MySizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class TitleAndSearch extends StatelessWidget {
  const TitleAndSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  globalKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu)),
            Text(myController.pagesModel.value.pageName,
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        SizedBox(
            width: 250,
            height: 30,
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(
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
    );
  }
}
