import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../../../main/entities/reviews.type.dart';
import '../../../main/services/products/products.contract.dart';
import '../../../main/services/reviews/reviews.contract.dart';
import 'detail.page.dart';

class DetailController extends GetxController {
  final IReviewsService _reviewsService;
  final IProductsService productsService;

  var topProductItem;

  DetailController(this._reviewsService, this.productsService);

  var reviews$ = <Review>[].obs;
  late var findedProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var productList$ = <Product>[].obs;
  late var cartItems$ = 0.obs;

  late Product itemDetail;

  @override
  void onInit() async {
    super.onInit();

    itemDetail = Get.arguments['product'];
    topProductItem = Get.arguments;

    productList$.value = await productsService.getTop();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    var reviews = await _reviewsService.get();

    reviews$.value = reviews;
  }

  addCart(Product item, context) {
    item.cartValue = item.cartValue + 1;
    if (!cartProducts$.any((element) => element.id == item.id)) {
      cartProducts$.add(item);
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => DetailPage()),
      (Route<dynamic> route) => false,
    );
    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    updateCartItems();
  }

  deleteCart(Product item) {
    item.cartValue = item.cartValue - 1;
    if (item.cartValue == 0) {
      cartProducts$.remove(item);
    }
    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    updateCartItems();
  }

  updateCartItems() {
    cartItems$.value =
        cartProducts$.map((e) => e.cartValue).reduce((a, b) => a + b);
    cartItems$.refresh();
  }
}
