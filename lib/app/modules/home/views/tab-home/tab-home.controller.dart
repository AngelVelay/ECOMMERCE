import 'package:flutter/material.dart'
    show BuildContext, FocusScope, Navigator, TextEditingController;
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/entities/user.type.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/home/entities/impulse-products.type.dart';
import 'package:jexpoints/app/modules/home/services/address/address.api.service.dart';
import 'package:jexpoints/app/modules/home/services/impulse-products/impulse-products.contract.dart';
import 'package:jexpoints/app/modules/home/views/tab-home-search/tab-home-search.page.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/rewards/entities/point-level.type.dart';
import 'package:jexpoints/app/modules/rewards/services/point-level/point-level.contract.dart';

import '../../../auth/entities/user-data.type.dart';
import '../../../cart/cart.module.dart';
import '../../../main/services/products/products.contract.dart';
import '../../../rewards/entities/coupon.type.dart';
import '../../../rewards/rewards.module.dart';
import '../../../rewards/services/coupons/coupons.contract.dart';

import '../../entities/posters.type.dart';
import '../../home.module.dart';
import '../../services/posters/posters.contract.dart';

class HomeController extends GetxController {
  final IProductsService productsService;
  final IPostersService postersService;
  final IAuthService authService;
  final AddressService addressService;
  final ICouponsService couponsService;
  final IPointLevelService pointLevelService;
  final IProductsImpulseService productsImpulseService;

  final keywordCtrl = TextEditingController();
  late var flyerList$ = <dynamic>[].obs;
  late var posterList$ = <dynamic>[].obs;
  final couponImage$ = <dynamic>[].obs;

  late var productList$ = <Product>[].obs;
  late var productsPackList$ = <Product>[].obs;
  late var variableProductsList$ = <Product>[].obs;
  late var productsImpulseList$ = <ImpulseProducts>[].obs;
  late var cartItems$ = 0.obs;
  late var findedProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var likedProducts$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var user$ = UserData.fromVoid().obs;
  late var addressList$ = <UserAddress>[].obs;
  late var selectedCreditCard$ = <CreditCard>[].obs;
  late var selectedAddress$ = UserAddress.fromVoid().obs;
  late var coupons$ = <Coupon>[].obs;
  late var defaultCoupon$ = Coupon.fromVoid().obs;
  late var pointsLevel$ = <PointLevel>[].obs;
  late var showPickUpButton$ = false.obs;
  late var showDeliveryButton$ = false.obs;
  late var toogleDelete$ = false.obs;
  late var toogleTotal$ = false.obs;
  late var isFavorite$ = false.obs;
  late var cartValue$ = 0.obs;

  var showDeliveryType$ = false.obs;
  var showDeliveryisVisible$ = false.obs;

  final isLoading$ = false.obs;

  late double total$ = 0.0;
  late double subtotal$ = 0.0;
  var category = "";

  HomeController(
      this.productsService,
      this.authService,
      this.postersService,
      this.addressService,
      this.couponsService,
      this.pointLevelService,
      this.productsImpulseService);

  @override
  void onInit() async {
    super.onInit();
    isLoading$.value = true;
    var currentUser = await authService.checkUser();
    if (currentUser != null) {
      user$.value = currentUser;
    }
    final showDeliveryType = showDeliveryisVisible$.value;

    total$ = 0.0;
    subtotal$ = 0.0;
    var banners = await postersService.getAll();
    var bannersList = postersService.getFileId();
    var imagesBanner = postersService.getBanners();

    variableProductsList$.value = await productsService.getProductsVariable();
    productsImpulseList$.value =
        await productsImpulseService.getProductsImpulse();
    // productsPackList$.value = await productsService.addVariableProducts(
    //      productsPackList$.value);
    productList$.value = await productsService.getTop();
    flyerList$.value = await postersService.getBanners();
    posterList$.value = await postersService.getAll();

    pointsLevel$.value = await pointLevelService.getPoints();

    // flyerList$.value = await flyersService.getFlyers();
    productList$.sort((a, b) => a.topRate.compareTo(b.topRate));
    favoriteProducts$.value = await productsService.getFavorites();
    flyerList$.value = await postersService.getBanners();
    if (flyerList$.isEmpty) {
      flyerList$.value = await postersService.getBanners();
    } else {
      print('Error');
    }

    coupons$.value = await couponsService.getAll();
    if (coupons$.isNotEmpty) {
      defaultCoupon$.value = coupons$.first;
    }

    couponImage$.value = await couponsService.getImages();

    addressList$.value = await addressService.getFromCurrent();
    if (addressList$.isNotEmpty) {
      selectedAddress$.value =
          addressList$.where((element) => element.isDefault).toList().first;
    } else {
      selectedAddress$.value.zipcode = 000000;
    }

    isLoading$.value = false;
  }

  addCart(Product item, context) {
    item.cartValue = item.cartValue + 1;
    if (!cartProducts$.any((element) => element.id == item.id)) {
      cartProducts$.add(item);
    }
    cartItems$.refresh();
    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    productsImpulseList$.refresh();
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
    productsImpulseList$.refresh();
    cartValue$.refresh();
    updateCartItems();
  }

  updateCartItems() {
    cartItems$.value = cartProducts$.length;
    cartItems$.refresh();
  }

  deleteCartItems(Product item) {
    cartProducts$.remove(item);
    cartItems$.refresh();
    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    productsImpulseList$.refresh();
    updateCartItems();
  }

  toSearch(HomeController controller) {
    Get.to(() => HomeSearchPage(controller));
  }

  search(BuildContext context) async {
    findedProducts$.where((element) => element.isActive == true).toList();
    findedProducts$.value = await productsService.search(keywordCtrl.text);
    FocusScope.of(context).unfocus();
  }

  toFlyer(Posters item) {
    Get.toNamed(HomeRouting.POSTER_ROUTE, arguments: [item]);
  }

  toProductDetail(Product item) {
    Get.toNamed(HomeRouting.DETAIL_ROUTE, arguments: {"product": item});
  }

  addressSelect(UserAddress item, BuildContext context) {
    selectedAddress$.value = item;
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

  couponDiscount() {
    return defaultCoupon$.value.amount;
  }

  subtotalBuy() {
    return subtotal$ = double.parse(cartProducts$
        .map((e) => e.price * e.cartValue.toInt())
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

  addFavorite(Product item) {
    if (!likedProducts$.any((element) => element.id == item.id)) {
      likedProducts$.add(item);
    }

    likedProducts$.refresh();
  }

  deleteFavorite(Product item) {
    likedProducts$.remove(item);

    likedProducts$.refresh();
  }
}


// addCart(Product item, context) {
//   item.cartValue = item.cartValue + 1;
//   if (!cartProducts$.any((element) => element.id == item.id)) {
//     cartProducts$.add(item);
//   }
//   cartItems$.refresh();
//   cartProducts$.refresh();
//   productList$.refresh();
//   findedProducts$.refresh();
//   catalogsList$.refresh();
//   favoriteProducts$.refresh();
//   productsImpulseList$.refresh();
//   // cartValue$.value = cartValue$.value + 1;
//   // cartValue$.refresh();
//   updateCartItems();
// }

// deleteCart(Product item) {
//   item.cartValue = item.cartValue - 1;
//   if (item.cartValue == 0) {
//     cartProducts$.remove(item);
//   }
//   cartProducts$.refresh();
//   productList$.refresh();
//   findedProducts$.refresh();
//   catalogsList$.refresh();
//   favoriteProducts$.refresh();
//   productsImpulseList$.refresh();
//   cartValue$.refresh();
//   updateCartItems();
// }

// updateCartItems() {
//   // cartItems$.value =
//   //     cartProducts$.map((e) => e.cartValue).reduce((a, b) => a + b) ;
//   cartItems$.value = cartProducts$.length;
//   cartItems$.refresh();
// }
