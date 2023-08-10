import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/pages/add_product/add_product.dart';
import 'package:store_admin_panel/pages/all_orders/all_orders.dart';
import 'package:store_admin_panel/pages/all_products/all_products.dart';
import 'package:store_admin_panel/pages/edit_product/edit_product.dart';
import 'package:store_admin_panel/pages/overview/overview.dart';

class MyRouting {
  static final GoRouter routerConfig =
      GoRouter(initialLocation: PagesPaths.editProduct, routes: <RouteBase>[
    GoRoute(
        builder: (context, state) {
          return const Overview();
        },
        path: PagesPaths.overview),
    GoRoute(
        builder: (context, state) {
          return const AllProducts();
        },
        path: PagesPaths.allProducts),
    GoRoute(
        builder: (context, state) {
          return const AllOrders();
        },
        path: PagesPaths.allOrders),
    GoRoute(
        builder: (context, state) {
          return const AddProduct();
        },
        path: PagesPaths.addProduct),
    GoRoute(
        builder: (context, state) {
          return const EditProduct();
        },
        path: PagesPaths.editProduct)
  ]);
}