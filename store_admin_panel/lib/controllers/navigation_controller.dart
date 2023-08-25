import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/pages_controller.dart';
import 'package:store_admin_panel/data_types/product.dart';

class NavigationController extends PagesController {
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

  void toEditProduct(context, Product product) {
    GoRouter.of(context).go(PagesPaths.editProduct, extra: product);
  }

  void popupFunction(int value, BuildContext context, Product product) {
    switch (value) {
      case 0:
        toAddProduct(context);
      case 1:
        toEditProduct(context, product);

        break;
    }
  }

  void toSignUp(context) {
    GoRouter.of(context).go(PagesPaths.signUpPage);
  }

  void toSignIn(context) {
    GoRouter.of(context).go(PagesPaths.signInPage);
  }
}
