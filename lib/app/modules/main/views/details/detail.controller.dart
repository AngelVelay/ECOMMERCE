import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../../entities/reviews.type.dart';
import '../../services/products/products.contract.dart';
import '../../services/reviews/reviews.contract.dart';

class DetailController extends GetxController {
  final IReviewsService _reviewsService;
  final IProductsService productsService;

  DetailController(this._reviewsService, this.productsService);

  var reviews$ = <Review>[].obs;
  late var productList$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var findedProducts$ = <Product>[].obs;
  late var cartItems$ = 0.obs;
  late var itemDetail = Product(
      id: 1,
      url: Get.arguments['url'],
      name: Get.arguments['name'],
      price: Get.arguments['price'],
      cartValue: 0,
      isFavorite: false,
      topRate: Get.arguments['topRate'],
      points: 50,
      category: Categories.panderia);

  @override
  void onInit() async {
    super.onInit();
    productList$.value = await productsService.getTop();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    var reviews = await _reviewsService.get();

    reviews$.value = reviews;
  }

  addCart(Product item, context) {
    item.cartValue++;
    cartProducts$.add(itemDetail);

    // item.cartValue++;
    // if (!cartProducts$.any((element) => element.name == itemDetail.name)) {
    //   cartProducts$.add(itemDetail);
    // }

    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    _updateCartItems();
  }

  deleteCart(Product item) {
    item.cartValue--;
    if (item.cartValue == 0) {
      cartProducts$.remove(item);
    }
    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    _updateCartItems();
  }

  _updateCartItems() {
    cartItems$.value =
        cartProducts$.map((e) => e.cartValue).reduce((a, b) => a + b);
    cartItems$.refresh();
  }

  final imageUrl = Get.arguments['url'];
  final name = Get.arguments['name'];
  final price = Get.arguments['price'];
  final points = Get.arguments['points'];
  final rate = Get.arguments['topRate'];
}
