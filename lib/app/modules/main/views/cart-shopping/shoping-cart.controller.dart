import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditCard.contract.dart';
import 'package:jexpoints/app/modules/main/services/products/products.contract.dart';

class ShoppingCart extends GetxController {
  final IProductsService productsService;

  late var productList$ = <Product>[].obs;

  ShoppingCart(this.productsService);

  @override
  void onInit() async {
    super.onInit();
    productList$.value = await productsService.getTop();
  }
}
