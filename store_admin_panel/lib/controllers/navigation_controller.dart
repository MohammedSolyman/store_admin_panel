import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/edit_product_controller.dart';

class NavigationController extends EditProductController {
  void toOverview(context) {
    GoRouter.of(context).go(PagesPaths.overview);
  }

  void toAllProducts(context) {
    GoRouter.of(context).go(PagesPaths.allProducts);
  }

  void toAllOrders(context) {
    GoRouter.of(context).go(PagesPaths.allOrders);
  }

  void toAddProduct(context) {
    GoRouter.of(context).go(PagesPaths.addProduct);
  }

  void toEditProduct(context) {
    GoRouter.of(context).go(PagesPaths.editProduct);
  }
}