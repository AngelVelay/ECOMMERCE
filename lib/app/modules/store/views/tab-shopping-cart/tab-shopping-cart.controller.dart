import 'package:get/get.dart';
import '../../../cart/cart.module.dart';
import '../../../main/entities/product.type.dart';
import '../../../main/services/products/products.contract.dart';

class ShoppingCartController extends GetxController {
  late final IProductsService productsService;

  late var productList$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;

  toAddCreditCard() {
    Get.toNamed(CartRouting.ADD_CREDIT_CARD_ROUTE);
  }
}
