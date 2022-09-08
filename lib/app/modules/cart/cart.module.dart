// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';

import 'package:jexpoints/app/modules/cart/views/add_credit_card/addCreditCard.controller.dart';
import 'package:jexpoints/app/modules/cart/views/add_credit_card/addCreditCard.page.dart';
import 'package:jexpoints/app/modules/cart/views/address-detail/address-detail.controller.dart';
import 'package:jexpoints/app/modules/cart/views/address-detail/address-detail.page.dart';
import 'package:jexpoints/app/modules/cart/views/checkout/checkout.controller.dart';
import 'package:jexpoints/app/modules/cart/views/checkout/checkout.page.dart';
import 'package:jexpoints/app/modules/cart/views/confirm_compra/confirm-compra.controller.dart';
import 'package:jexpoints/app/modules/cart/views/confirm_compra/confirm-compra.page.dart';
import 'package:jexpoints/app/modules/cart/views/pay_page/pay.controller.dart';
import 'package:jexpoints/app/modules/cart/views/pay_page/pay.page.dart';

import 'package:jexpoints/app/modules/cart/views/pickup-cart/pickup-cart.controller.dart';
import 'package:jexpoints/app/modules/cart/views/pickup-cart/pickup-cart.page.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditContract.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/products/products.fake.service.dart';

import '../main/services/address/address.fake.service.dart';
import 'views/suggestions/suggestions.controller.dart';
import 'views/suggestions/suggestions.page.dart';

class CartRouting {
  static const ADD_CREDIT_CARD_ROUTE = '/add-credit-card';
  static const ADDRESS_DETAIL_ROUTE = '/address-detail';
  static const CHECKOUT_ROUTE = '/checkout';
  static const CONFIRM_COMPRA_ROUTE = '/confirm-compra';
  static const PICKUP_ROUTE = '/pickup';
  static const PAY_ROUTE = '/pay';
  static const PAYMENT_METHODS_ROUTE = '/payment-methods';
  static const SUGGESTIONS = '/suggestions';

  static final IAuthService authService = AuthFakeService();

  static final routes = [
    GetPage(
        name: ADD_CREDIT_CARD_ROUTE,
        page: () => addCreditCard(),
        binding: AddCardBinding()),
    GetPage(
        name: ADDRESS_DETAIL_ROUTE,
        page: () => const AddressDetailPage(),
        binding: AddressDetailBinding()),
    GetPage(
        name: CHECKOUT_ROUTE,
        page: () => CheckOutPage(),
        binding: CheckOutBinding()),
    GetPage(
        name: CONFIRM_COMPRA_ROUTE,
        page: () => ConfirmPagoPage(),
        binding: ConfirmPagodBinding()),
    GetPage(
      name: PICKUP_ROUTE,
      page: () => const PickupPage(),
      binding: PickUpBinding(),
    ),
    GetPage(name: PAY_ROUTE, page: () => PayPage(), binding: PayBinding()),
    GetPage(
        name: SUGGESTIONS,
        page: () => const SuggestionsPage(),
        binding: SuggestionsBinding()),
  ];
}

// class AddressBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<AddressController>(
//         () => AddressController(AddressFakeService()));
//   }
// }

class AddressDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressDetailController>(
        () => AddressDetailController(AddressFakeService()));
  }
}

class PickUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickUpController>(() => PickUpController());
  }
}

class CheckOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(() =>
        CheckOutController(AddressFakeService(), CreditCardFakeService()));
  }
}

class ConfirmPagodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmPagoController>(() =>
        ConfirmPagoController(CreditCardFakeService(), ProductsFakeService()));
  }
}

class AddCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCardController>(
        () => AddCardController(CreditCardFakeService()));
  }
}

class PayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayController>(() => PayController(CreditCardFakeService()));
  }
}

class SuggestionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuggestionsController>(() => SuggestionsController());
  }
}
