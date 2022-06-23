import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

import '../../entities/credit-card.dart';
import '../../services/creditCard/creditCard.contract.dart';
import '../../services/products/products.contract.dart';

class ConfirmPagoController extends GetxController {
  final ICreditCardService creditCardService;
  final IProductsService productsService;

  late var creditCardList$ = <CreditCard>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var productList$ = <Product>[].obs;
  late var cartItems$ = 0.obs;
  late var findedProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var _total$ = 0.obs;

  ConfirmPagoController(this.creditCardService, this.productsService);

  @override
  void onInit() async {
    super.onInit();
    creditCardList$.value = await creditCardService.get();
    productList$.value = await productsService.getTop();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    favoriteProducts$.value = await productsService.getFavorites();
  }

  addCart(Product item) {
    item.cartValue++;
    if (!cartProducts$.any((element) => element.id == item.id)) {
      cartProducts$.add(item);
    }

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

  totalBuy() {
    _total$.value = int.parse(cartProducts$
        .map((e) => e.price * e.cartValue)
        .reduce((a, b) => a + b)
        .toString());
  }
}
