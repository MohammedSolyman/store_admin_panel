import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_admin_panel/constants/controllers.dart';
import 'package:store_admin_panel/controllers/themecontroller.dart';
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
              MyTile('overview', Icons.home),
              MyTile('all products', Icons.store),
              MyTile('all orders', Icons.shopping_bag),
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
        padding: EdgeInsets.all(3),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(Icons.light_mode),
            SizedBox(width: 10),
            Text('brightness', style: TextStyle(fontSize: 20)),
            SizedBox(width: 10),
            Switch(
                value: themeController.themeModel.value.themeModeBool,
                onChanged: (x) {
                  themeController.toggleMode(x);
                })
          ],
        ),
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
    ThemeController c = Get.find<ThemeController>();

    return Obx(() {
      return InkWell(
        onHover: (x) {
          print('hhhhhhhhhooooooooooooovvvvvvvveeeeeeeeeerrrrrrr');
          c.toggleVisibility(x);
        },
        child: Container(
          padding: EdgeInsets.all(3),
          color: Colors.transparent,
          child: Row(
            children: [
              SizedBox(width: 5),
              Visibility(
                visible: c.themeModel.value.isVisibleTile,
                child: Container(
                  height: 30,
                  width: 5,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 10),
              Icon(myIcon),
              SizedBox(width: 10),
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
