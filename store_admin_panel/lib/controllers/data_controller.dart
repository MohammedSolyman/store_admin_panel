import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_admin_panel/data_types/product.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/models/data_model.dart';

class DataController extends GetxController {
  Rx<DataModel> dataModel = DataModel().obs;

  _getProducts() async {
    FirebaseFirestore myInstance = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> colRef =
        myInstance.collection('products');

    Query<Map<String, dynamic>> q =
        colRef.orderBy('lastModifiedOn', descending: true);
    QuerySnapshot<Map<String, dynamic>> qurySS = await q.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = qurySS.docs;

    List<Product> x = [];

    for (var element in myList) {
      Map<String, dynamic> myMap = element.data();

      Product product = Product.fromMap(myMap);

      x.add(product);
    }

    // myList.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
    //   Map<String, dynamic> myMap = element.data();

    //   Product product = Product.fromMap(myMap);

    //   x.add(product);
    // });

    dataModel.update((val) {
      val!.allProducts = x;

      if (val.allProducts.length < 5) {
        val.latestProducts = val.allProducts;
      } else {
        val.latestProducts = val.allProducts.sublist(1, 5);
      }
    });
  }

  _getPurchases() async {
    FirebaseFirestore myInstance = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> colRef =
        myInstance.collection('orders');

    Query<Map<String, dynamic>> q =
        colRef.orderBy('purchaseTime', descending: true);

    QuerySnapshot<Map<String, dynamic>> qurySS = await q.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = qurySS.docs;

    List<Purchase> x = [];

    for (var element in myList) {
      Map<String, dynamic> myMap = element.data();

      Purchase purchase = Purchase.fromMap(myMap);

      x.add(purchase);
    }

    //   myList.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
    //   Map<String, dynamic> myMap = element.data();

    //   Purchase purchase = Purchase.fromMap(myMap);

    //   x.add(purchase);
    // });

    dataModel.update((val) {
      val!.allPurchases = x;

      if (val.allPurchases.length < 5) {
        val.latestPurchases = val.allPurchases;
      } else {
        val.latestPurchases = val.allPurchases.sublist(1, 5);
      }
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await _getProducts();
    await _getPurchases();
  }
}
