import 'package:get/get.dart';
import 'package:jexpoints/app/modules/store/views/store-category-products/store-category-products.controller.dart';
import 'package:jexpoints/app/modules/store/views/store-category-products/store-category-products.page.dart';
import 'package:jexpoints/app/modules/store/views/store/store.controller.dart';
import 'package:jexpoints/app/modules/store/views/store/store.page.dart';
import 'package:jexpoints/app/modules/store/views/tab-shopping-cart/tab-shoppin-cart.page.dart';
import 'package:jexpoints/app/modules/store/views/tab-shopping-cart/tab-shopping-cart.controller.dart';

import '../main/services/business-lines/business-lines.api.service.dart';
import '../main/services/products/products.api.service.dart';

class StoreRouting {
  static const STORE_ROUTE = '/store';
  static const STORE_CATEGORY_PRODUCTS_ROUTE = '/store-category-products';
  static const SHOPPING_CART = '/shopping-cart';

  static final routes = [
    GetPage(
      name: STORE_ROUTE,
      page: () => StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
        name: STORE_CATEGORY_PRODUCTS_ROUTE,
        page: () => StoreCategoryProductsPage(),
        binding: StoreCategoryProductsBinding()),
    GetPage(
        name: SHOPPING_CART,
        page: () => ShoppingCartPage(),
        binding: ShoppingCartBinding()),
  ];
}

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
        () => StoreController(BusinessLinesApiService()));
  }
}

class StoreCategoryProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreCategoryProductsController>(
        () => StoreCategoryProductsController(ProductsApiService()));
  }
}

class ShoppingCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartController>(() => ShoppingCartController());
  }
}
