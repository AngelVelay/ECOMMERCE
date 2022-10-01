import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/home/services/address/address.contract.dart';
import '../../../cart/cart.module.dart';
import '../../../main/entities/product.type.dart';
import '../../../main/services/products/products.contract.dart';

class ShoppingCartController extends GetxController {
  late final IProductsService productsService;
  late final IAddressService _addressService;

  late var productList$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var cartItems$ = 0.obs;
  late var findedProducts$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var addressList$ = <UserAddress>[].obs;

  late var cartValue$ = 0.obs;
  late var toogleDelete$ = false.obs;

  @override
  void onInit() async {
    super.onInit();

    favoriteProducts$.value = await productsService.getFavorites();
    addressList$.value = await _addressService.getFromCurrent();

    productList$.value = await productsService.getTop();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    favoriteProducts$.value = await productsService.getFavorites();
  }

  toAddCreditCard() {
    Get.toNamed(CartRouting.ADD_CREDIT_CARD_ROUTE);
  }

  addCart(Product item, context) {
    item.cartValue = item.cartValue + 1;
    if (!cartProducts$.any((element) => element.id == item.id)) {
      cartProducts$.add(item);
    }

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
    cartItems$.value = cartProducts$
        .map((e) => e.cartValue)
        .reduce((a, b) => a + b.toInt())
        .toInt();
    cartItems$.refresh();
  }
}
