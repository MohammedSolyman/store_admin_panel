import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10)]),
      child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const MyLogo(),
            const Divider(),
            MyTile(PagesNames.overview, Icons.home, myController.toOverview  ),
            MyTile(PagesNames.allProducts, Icons.store, myController.toAllProducts ),
            MyTile(PagesNames.allOrders, Icons.shopping_bag, myController.toAllOrders   ),
            const MyThemeTile(),
          ],
        ),
      ),
    );
  }
}

class MyThemeTile extends StatelessWidget {
  const MyThemeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          const SizedBox(width: 20),
          const Icon(Icons.light_mode),
          const SizedBox(width: 5),
          const MyText('brightness'),
          const SizedBox(width: 5),
          SizedBox(
            width: 50,
            child: Switch(
                value: myController.themeModel.value.themeModeBool,
                onChanged: (x) {
                  myController.toggleMode(x);
                }),
          )
        ],
      );
    });
  }
}

class MyTile extends StatelessWidget {
  const MyTile(this.txt, this.myIcon,this.function, {super.key});

  final String txt;
  final IconData myIcon;
  final Function(BuildContext) function;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onHover: (x) {
          myController.toggleHovering(x, txt);
        },
        onTap: () {function(context);},
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: myController.isHovering(txt)
                  ? [const BoxShadow(color: Colors.black, blurRadius: 10)]
                  : []),
          padding: const EdgeInsets.all(3),
          child: Row(
            children: [
              const SizedBox(width: 5),
              Visibility(
                visible: myController.isHovering(txt),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  height: 30,
                  width: 5,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 5),
              Icon(myIcon),
              const SizedBox(width: 5),
              MyText(txt)
            ],
          ),
        ),
      );
    });
  }
}

class MyLogo extends StatelessWidget {
  const MyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 150, height: 150, child: Image.asset('store.png'));
  }
}
