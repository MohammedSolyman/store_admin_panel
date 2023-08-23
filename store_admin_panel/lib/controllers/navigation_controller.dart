import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/add_edit_product_page_controller.dart';

class NavigationController extends AddEditProductPageController {
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

  void popupFunction(int value, BuildContext context) {
    switch (value) {
      case 0:
        toAddProduct(context);
      case 1:
        toEditProduct(context);

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
