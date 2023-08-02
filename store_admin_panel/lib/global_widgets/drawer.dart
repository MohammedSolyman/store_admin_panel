import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/controllers.dart';
import 'package:store_admin_panel/controllers/theme_controller.dart';
import 'package:store_admin_panel/themes/mythemedata.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              MyLogo(),
              Divider(),
              MyTile('overview', Icons.home ),
              MyTile('all products', Icons.store ),
              MyTile('all orders', Icons.shopping_bag ),
              MyTheme(),
            ],
          ),
        ));
  }
}

class MyTheme extends StatelessWidget {
  const MyTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.light_mode),
            const SizedBox(width: 10),
            const Text('brightness', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            Switch(
                value: myController.themeModel.value.themeModeBool,
                onChanged: (x) {
                  myController.toggleMode(x);
                })
          ],
        ),
      );
    });
  }
}

class MyTile extends StatelessWidget {
  const MyTile(this.txt, this.myIcon,  {super.key});

  final String txt;
  final IconData myIcon;
 

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onHover: (x) {
          myController.toggleHovering(x,txt);
        },
        onTap: () {},
        child: Container(
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
              const SizedBox(width: 10),
              Icon(myIcon),
              const SizedBox(width: 10),
              Text(
                txt,
                style: Theme.of(context).textTheme.bodyLarge,
              )
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
    return Container(width: 175, height: 175, child: Image.asset('store.png'));
  }
}
