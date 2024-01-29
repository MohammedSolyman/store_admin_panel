import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/data_types/purchase.dart';

class DataModel {
  List<Product> allProducts = [];
  List<Product> latestProducts = [];
  List<Product> searchedProducts = [];
  List<Purchase> allPurchases = [];
  List<Purchase> latestPurchases = [];
}
