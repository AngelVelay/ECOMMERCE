import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/entities/category.type.dart';
import 'package:jexpoints/app/modules/main/services/business-lines/business-lines.contract.dart';

import '../../../home/home.module.dart';
import '../../../main/entities/product.type.dart';
import '../../../main/main.module.dart';
import '../../../main/services/products/products.contract.dart';

class StoreCategoryProductsController extends GetxController {
  late final IProductsService _productsService;

  late final keywordCtrl = TextEditingController();

  late var findedProducts$ = <Product>[].obs;
  // late var catalogsList$ = <Product>[].obs;
  // late var favoriteProducts$ = <Product>[].obs;
  // late var cartProducts$ = <Product>[].obs;
  // late var productList$ = <Product>[].obs;
  // late var cartItems$ = 0.obs;

  late Category category;

  StoreCategoryProductsController(this._productsService);

  @override
  void onInit() async {
    super.onInit();

    category = Get.arguments['category'];
    findedProducts$.value = await _productsService.getByCategory(category.id);
  }

  // addCart(Product item) {
  //   item.cartValue++;
  //   if (!cartProducts$.any((element) => element.id == item.id)) {
  //     cartProducts$.add(item);
  //   }

  //   cartProducts$.refresh();
  //   productList$.refresh();
  //   findedProducts$.refresh();
  //   catalogsList$.refresh();
  //   favoriteProducts$.refresh();
  //   _updateCartItems();
  // }

  // deleteCart(Product item) {
  //   item.cartValue--;
  //   if (item.cartValue == 0) {
  //     cartProducts$.remove(item);
  //   }
  //   cartProducts$.refresh();
  //   productList$.refresh();
  //   findedProducts$.refresh();
  //   catalogsList$.refresh();
  //   favoriteProducts$.refresh();
  //   _updateCartItems();
  // }

  // _updateCartItems() {
  //   cartItems$.value =
  //       cartProducts$.map((e) => e.cartValue).reduce((a, b) => a + b);
  //   cartItems$.refresh();
  // }

  // catalogList(BuildContext context) async {
  //   // catalogsList$.value = await productsService.catalogsList();

  //   // findedProducts$.value = catalogsList$
  //   //     .where((e) => e.category.toString().contains(category.toLowerCase()))
  //   //     .toList();
  //   // print(category);

  //   // productList$.value = findedProducts$.value;

  //   // findedProducts$.value = productList$
  //   //     .where((e) =>
  //   //         e.name.toLowerCase().contains(keywordCtrl.text.toLowerCase()))
  //   //     .toList();
  // }

  // toSearch(CatalogosListController controller) {
  //   // Get.to(() => CatalogSearchPage(controller));
  // }

  // search(BuildContext context) async {
  //   // productList$.value = await productsService.search(keywordCtrl.text);
  //   findedProducts$.value = productList$
  //       .where((e) => e.category.toString().contains(category.toLowerCase()))
  //       .toList();
  //   FocusScope.of(context).unfocus();
  // }

  toProductDetail(Product item) {
    Get.toNamed(HomeRouting.DETAIL_ROUTE, arguments: {'product': item});
  }
}
