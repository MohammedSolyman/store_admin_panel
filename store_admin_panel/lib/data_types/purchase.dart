import 'package:store_admin_panel/data_types/client.dart';
import 'package:store_admin_panel/data_types/product.dart';

class Purchase {
  Client? client;
  Product? product;
  int quantity = 0;
  double totalPrice = 0;
  int purchaseTime = 0;
  String userId = '';

  Purchase({
    required this.client,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.purchaseTime,
  }) {
    userId = client!.userId;
  }

  Purchase.fromMap(Map<String, dynamic> map) {
    client = Client.fromMap(map['client']);
    product = Product.fromMap(map['product']);
    quantity = map['quantity'];
    totalPrice = map['totalPrice'];
    purchaseTime = map['purchaseTime'];
    userId = client!.userId;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> m = {
      'client': client!.toMap(),
      'product': product!.toMap(),
      'quantity': quantity,
      'totalPrice': totalPrice,
      'purchaseTime': purchaseTime,
      'userId': client!.userId
    };
    return m;
  }
}
