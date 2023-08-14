import 'package:get/get.dart';
import 'package:store_admin_panel/controllers/add_product_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_admin_panel/models/data_model.dart';
import 'package:store_admin_panel/models/product_model.dart';

class DataController extends GetxController {
  Rx<DataModel> dataModel = DataModel().obs;

  _getAllProducts() async {
    FirebaseFirestore myInstance = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> colRef =
        myInstance.collection('products');

    QuerySnapshot<Map<String, dynamic>> qurySS = await colRef.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = qurySS.docs;

    List<ProductModel> x = [];

    myList.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      Map<String, dynamic> myMap = element.data();

      ProductModel product = ProductModel.fromMap(myMap);

      x.add(product);
    });

    dataModel.update((val) {
      val!.allProducts = x;
    });
  }

  _getLatestProducts() async {
    FirebaseFirestore myInstance = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> colRef =
        myInstance.collection('products');

    Query<Map<String, dynamic>> myQuery = colRef.orderBy('lastModifiedOn');
    Query<Map<String, dynamic>> myQuery2 = myQuery.limit(4);

    QuerySnapshot<Map<String, dynamic>> qurySS = await myQuery2.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = qurySS.docs;

    List<ProductModel> x = [];

    myList.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      Map<String, dynamic> myMap = element.data();

      ProductModel product = ProductModel.fromMap(myMap);

      x.add(product);
    });

    dataModel.update((val) {
      val!.latestProducts = x;
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await _getAllProducts();
    await _getLatestProducts();
  }
}
