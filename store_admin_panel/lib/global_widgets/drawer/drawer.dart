import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 10)
          ]),

      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyLogo(),
          Divider(),
          MyTile(PagesNames.overview, Icons.home),
          MyTile(PagesNames.allProducts, Icons.store),
          MyTile(PagesNames.allOrders, Icons.shopping_bag),
          MyTheme(),
        ],
      ),
    );
  }
}

class MyTheme extends StatelessWidget {
  const MyTheme({
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
          MyText('brightness'),
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
  const MyTile(this.txt, this.myIcon, {super.key});

  final String txt;
  final IconData myIcon;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onHover: (x) {
          myController.toggleHovering(x, txt);
        },
        onTap: () {},
        child: Container(
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
