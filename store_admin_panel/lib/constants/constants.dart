

import 'package:flutter/material.dart';
import 'package:store_admin_panel/controllers/mycontroller.dart';


//Controllers
MyContorller myController = MyContorller.instance ;




//Pages names
class PagesNames {
  static const String  overview = 'overview';
  static const String  allProducts = 'all products';
  static const String  allOrders = 'all orders';
   
}



//GlobalKey
GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();