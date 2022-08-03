import 'package:get/get.dart';
import 'package:jexpoints/app/modules/store/views/store-category-products/store-category-products.controller.dart';
import 'package:jexpoints/app/modules/store/views/store-category-products/store-category-products.page.dart';
import 'package:jexpoints/app/modules/store/views/store/store.controller.dart';
import 'package:jexpoints/app/modules/store/views/store/store.page.dart';

import '../main/services/business-lines/business-lines.api.service.dart';
import '../main/services/products/products.api.service.dart';

class StoreRouting {
  static const STORE_ROUTE = '/store';
  static const STORE_CATEGORY_PRODUCTS_ROUTE = '/store-category-products';

  static final routes = [
    GetPage(
        name: STORE_ROUTE, page: () => StorePage(), binding: StoreBinding()),
    GetPage(
        name: STORE_CATEGORY_PRODUCTS_ROUTE,
        page: () => StoreCategoryProductsPage(),
        binding: StoreCategoryProductsBinding()),
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
