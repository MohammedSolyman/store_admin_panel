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
  static const String editProduct = '/editproduct';
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
  static const String dairy = "dairy";

  static const List<String> categoryList = [
    Category.dairy,
    Category.fruits,
    Category.vegetables,
    Category.grains
  ];
}
