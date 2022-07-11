import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../entities/product.type.dart';
import '../../main.module.dart';
import '../../services/products/products.contract.dart';
import '../variable-products/variable-products.page.dart';

class ShoppingCartController extends GetxController {
  late final IProductsService productsService;

  late var productList$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;

  toAddCreditCard() {
    Get.toNamed(MainRouting.ADD_CREDIT_CARD_ROUTE);
  }
}
