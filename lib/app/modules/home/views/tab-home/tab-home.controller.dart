// ignore_for_file: iterable_contains_unrelated_type

import 'package:flutter/material.dart'
    show BuildContext, FocusScope, Navigator, TextEditingController;
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/entities/user.type.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/home/services/flyers/flyers.contract.dart';
import 'package:jexpoints/app/modules/home/views/tab-home-search/tab-home-search.page.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/main/services/address/address.contract.dart';

import '../../../cart/cart.module.dart';
import '../../../main/services/creditCard/creditCard.contract.dart';
import '../../../main/services/products/products.contract.dart';
import '../../../rewards/entities/coupon.type.dart';
import '../../../rewards/rewards.module.dart';
import '../../../rewards/services/coupons/coupons.contract.dart';
import '../../entities/banners.type.dart';
import '../../entities/flyer.type.dart';
import '../../home.module.dart';

class HomeController extends GetxController {
  final IProductsService productsService;
  final IFlyersService flyersService;
  final IAuthService authService;
  final IAddressService addressService;
  final ICouponsService couponsService;
  final ICreditCardService creditCardService;

  final keywordCtrl = TextEditingController();
  late var flyerList$ = <dynamic>[].obs;
  late var productList$ = <Product>[].obs;
  late var productsPackList$ = <Product>[].obs;
  late var variableProductsList$ = <Product>[].obs;
  late var cartItems$ = 0.obs;
  late var findedProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var user$ = User.fromVoid().obs;
  late var addressList$ = <Address>[].obs;
  late var selectedCreditCard$ = <CreditCard>[].obs;
  late var selectedAddress$ = Address.fromVoid().obs;
  late var coupons$ = <Coupon>[].obs;
  late var defaultCoupon$ = Coupon.fromVoid().obs;
  late double total$ = 0.0;
  late double subtotal$ = 0.0;
  var category = "";

  HomeController(this.productsService, this.authService, this.flyersService,
      this.addressService, this.couponsService, this.creditCardService);

  @override
  void onInit() async {
    super.onInit();
    var currentUser = await authService.checkUser();
    if (currentUser != null) {
      user$.value = currentUser;
    }
    total$ = 0.0;
    subtotal$ = 0.0;
    var banners = await flyersService.getAll();
    var bannersList = flyersService.getFileId();
    var imagesBanner = flyersService.getBanners();

    variableProductsList$.value = await productsService.getProductsVariable();
    // productsPackList$.value = await productsService.addVariableProducts(
    //      productsPackList$.value);
    productList$.value = await productsService.getTop();
    flyerList$.value = await flyersService.getBanners();

    // flyerList$.value = await flyersService.getFlyers();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    favoriteProducts$.value = await productsService.getFavorites();
    flyerList$.value = await flyersService.getBanners();
    if (flyerList$.isEmpty) {
      flyerList$.value = await flyersService.getBanners();
    } else {
      print('Error');
    }

    coupons$.value = await couponsService.getAll();
    if (coupons$.isNotEmpty) {
      defaultCoupon$.value = coupons$.first;
    }
    addressList$.value = await addressService.getFromCurrent();
    if (addressList$.isNotEmpty) {
      selectedAddress$.value =
          addressList$.where((element) => element.isDefault).toList().first;
    }
  }

  addCart(Product item, context) {
    item.cartValue = item.cartValue! + 1;
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
    item.cartValue = item.cartValue! - 1;
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
        cartProducts$.map((e) => e.cartValue!).reduce((a, b) => a + b);
    cartItems$.refresh();
  }

  toSearch(HomeController controller) {
    Get.to(() => HomeSearchPage(controller));
  }

  search(BuildContext context) async {
    findedProducts$.value = await productsService.search(keywordCtrl.text);
    FocusScope.of(context).unfocus();
  }

  // toFlyer(Flyer item) {
  //   Get.toNamed(HomeRouting.PUBLICIDAD_ROUTE, arguments: item.url);
  // }

  toProductDetail(Product item) {
    Get.toNamed(HomeRouting.DETAIL_ROUTE, arguments: {"product": item});
  }

  addressSelect(Address item, BuildContext context) {
    selectedAddress$.value = item;
    // Navigator.pop(context);
    // Get.toNamed('/confirm-compra');
  }

  toPayment() {
    Get.toNamed(CartRouting.PAY_ROUTE);
  }

  toAddCreditCard() {
    Get.toNamed(CartRouting.ADD_CREDIT_CARD_ROUTE);
  }

  toSuggestions() {
    Get.toNamed(CartRouting.SUGGESTIONS);
  }

  toCoupons() {
    Get.toNamed(RewardsRouting.COUPONS_ROUTE);
  }

  toCouponDetail() {
    Get.toNamed(RewardsRouting.COUPON_DETAIL_ROUTE,
        arguments: [defaultCoupon$.value]);
  }

  totalBuy() {
    return total$ = subtotal$ - defaultCoupon$.value.amount;
  }

  // couponDiscount() {
  //   total$ = subtotal$ - defaultCoupon$.value.amount;
  // }

  subtotalBuy() {
    return subtotal$ = double.parse(cartProducts$
        .map((e) => e.price * e.cartValue!)
        .reduce((a, b) => a + b)
        .toString());
  }

  toCheckout() {
    Get.toNamed(CartRouting.CHECKOUT_ROUTE, arguments: {
      'total': total$,
      'cartProducts': cartProducts$,
      'selectedAddress': selectedAddress$.value,
      'defaultCoupon': defaultCoupon$.value,
      'selectedCreditCard': selectedCreditCard$,
    });
  }

  toHome() {
    Get.off(MainRouting.MAIN_ROUTE);
  }

  addProductToPack(Product item) {
    if (!productsPackList$.any((element) => element.id == item.id)) {
      productsPackList$.add(item);
    }
  }
}
