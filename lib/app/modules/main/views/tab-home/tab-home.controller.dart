import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/entities/user.type.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';
import 'package:jexpoints/app/modules/main/entities/location.type.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/main/services/address/address.contract.dart';
import 'package:jexpoints/app/modules/main/services/flyers/flyers.contract.dart';
import '../../services/products/products.contract.dart';
import '../search/search.page.dart';

class HomeController extends GetxController {
  final IProductsService productsService;
  final IFlyersService flyersService;
  final IAuthService authService;
  final IAddressService addressService;

  final keywordCtrl = TextEditingController();
  late var flyerList$ = <Flyer>[].obs;
  late var productList$ = <Product>[].obs;
  late var cartItems$ = 0.obs;
  late var findedProducts$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var user$ = User.fromVoid().obs;
  late var addressList$ = <Address>[].obs;
  late var selectedAddress$ = Address.fromVoid().obs;

  HomeController(this.productsService, this.authService, this.flyersService,
      this.addressService);

  @override
  void onInit() async {
    super.onInit();
    var currentUser = await authService.checkUser();
    if (currentUser != null) {
      user$.value = currentUser;
    }

    productList$.value = await productsService.getTop();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    favoriteProducts$.value = await productsService.getFavorites();
    flyerList$.value = await flyersService.get();
    addressList$.value = await addressService.getFromCurrent();
    if (addressList$.isNotEmpty) {
      selectedAddress$.value =
          addressList$.where((element) => element.isDefault).toList().first;
    }
  }

  addCart(Product item) {
    item.cartValue++;
    productList$.refresh();
    findedProducts$.refresh();
    favoriteProducts$.refresh();
    _updateCartItems();
  }

  deleteCart(Product item) {
    item.cartValue--;
    productList$.refresh();
    findedProducts$.refresh();
    favoriteProducts$.refresh();
    _updateCartItems();
  }

  _updateCartItems() {
    cartItems$.value =
        productList$.value.map((e) => e.cartValue).reduce((a, b) => a + b);
    cartItems$.refresh();
  }

  toSearch(HomeController controller) {
    Get.to(() => SearchPage(controller));
  }

  search(BuildContext context) async {
    findedProducts$.value = await productsService.search(keywordCtrl.text);
    FocusScope.of(context).unfocus();
  }

  toFlyer(Flyer item) {
    Get.toNamed(MainRouting.PUBLICIDAD_ROUTE, arguments: item.url);
  }

  toProductDetail(Product item) {
    Get.toNamed(MainRouting.DETAIL_ROUTE, arguments: {
      'url': item.url,
      'name': item.name,
      'price': item.price,
    });
  }

  addressSelect(Address item, BuildContext context) {
    selectedAddress$.value = item;
    Navigator.pop(context);
  }
}
