import 'package:flutter/material.dart';
import 'package:store_admin_panel/controllers/mycontroller.dart';

//Controllers
MyContorller myController = MyContorller.instance;

//Pages names
class PagesNames {
  static const String overview = 'overview';
  static const String allProducts = 'all products';
  static const String allOrders = 'all orders';
  static const String editProduct = 'edit product';
  static const String addProduct = 'add product';
  static const String signInPage = 'sign in';
  static const String signUpPage = 'sign up';
}

class PagesPaths {
  static const String overview = '/overview';
  static const String allProducts = '/allproducts';
  static const String allOrders = '/allorders';
  static const String addProduct = '/addproduct';
  static const String editProduct = '/editproduct/:product';
  static const String signInPage = '/signinpage';
  static const String signUpPage = '/signuppage';
}

//GlobalKey
GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

class Unit {
  static const String kilo = "kilo";
  static const String piece = "piece";
}

class Category {
  static const String grains = "grains";
  static const String fruits = "fruits";
  static const String vegetables = "vegetables";
  static const String dairy = "Dairy";
  static const String beverages = "Beverages";
  static const String bakery = "Bakery";
  static const String cannedGoods = "Canned Goods";
  static const String dryGoods = "Dry Goods";
  static const String frozen = "Frozen";
  static const String meat = "Meat";
  static const String cleaners = "Cleaners";
  static const String paperGoods = "Paper Goods";
  static const String personalCare = "Personal Care";
  static const String other = "Other";

  static const List<String> categoryList = [
    Category.grains,
    Category.fruits,
    Category.vegetables,
    Category.dairy,
    Category.beverages,
    Category.bakery,
    Category.cannedGoods,
    Category.dryGoods,
    Category.frozen,
    Category.meat,
    Category.cleaners,
    Category.paperGoods,
    Category.personalCare,
    Category.other,
  ];
}

class AssetsPaths {
  static const String logo = 'assets/images/store.png';
}
