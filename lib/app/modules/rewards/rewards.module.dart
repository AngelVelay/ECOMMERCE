// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/home/views/address/address.controller.dart';
import 'package:jexpoints/app/modules/main/services/branch/branch.fake.service.dart';
import 'package:jexpoints/app/modules/rewards/services/coupons/coupons.api.service.dart';
import 'package:jexpoints/app/modules/rewards/services/coupons/coupons.fake.service.dart';
import 'package:jexpoints/app/modules/rewards/services/payment-methods/payment-method.api.service.dart';

import 'package:jexpoints/app/modules/rewards/views/billing/billing_apply/billing_apply.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/billing/billing_apply/billing_apply.dart';
import 'package:jexpoints/app/modules/rewards/views/billing/billing_valid/billing.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/billing/billing_valid/billing.page.dart';

import 'package:jexpoints/app/modules/rewards/views/consume/consume.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/consume/consume.page.dart';
import 'package:jexpoints/app/modules/rewards/views/consume/order-detail.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/coupon-detail/coupon-detail.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/coupon-detail/coupon-detail.page.dart';
import 'package:jexpoints/app/modules/rewards/views/coupons/coupons.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/coupons/coupons.page.dart';
import 'package:jexpoints/app/modules/rewards/views/payment-methods/payment-methods.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/payment-methods/payment-methods.page.dart';
import 'package:jexpoints/app/modules/rewards/views/terms/terms.page.dart';

import '../auth/services/auth/auth.api.service.dart';
import '../cart/services/creditCard/creditContract.fake.service.dart';
import '../home/services/address/address.api.service.dart';
import '../main/services/address/address.fake.service.dart';
import '../main/services/shopping/shopping.fake.service.dart';

class RewardsRouting {
  static const CONSUME_ROUTE = '/consume';
  static const COUPONS_ROUTE = '/coupons';
  static const COUPON_DETAIL_ROUTE = '/coupon/detail';
  static const REWARDS_ROUTE = '/rewards';
  static const BILLING_ROUTE = '/billing';
  static const BILLING_APPLY_ROUTE = '/billing-apply';
  static const TERMS_ROUTE = '/terms';
  static const PAYMENT_METHODS_ROUTE = '/payment-methods';

  static final IAuthService authService = AuthApiService();

  static final routes = [
    GetPage(
        name: CONSUME_ROUTE,
        page: () => ConsumePage(),
        binding: ConsumeBinding()),
    GetPage(
        name: COUPONS_ROUTE,
        page: () => const CouponsPage(),
        binding: CouponsBinding()),
    GetPage(
        name: COUPON_DETAIL_ROUTE,
        page: () => const CouponDetailPage(),
        binding: CouponDetailBinding()),
    GetPage(name: TERMS_ROUTE, page: () => TermsPage()),
    GetPage(
      name: BILLING_ROUTE,
      page: () => const BillingPage(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: BILLING_APPLY_ROUTE,
      page: () => const BillingApplyPage(),
      binding: BillingApplyBinding(),
    ),
    GetPage(
        name: PAYMENT_METHODS_ROUTE,
        page: () => const PaymentMethodsPage(),
        binding: PaymentMethodsBinding()),
  ];
}

class ConsumeBinding implements Bindings {
  var authService = AuthApiService();
  var shoppingService = ShoppingFakeService();
  // var paymentMethodsService = CreditCardFakeService();
  var addressService = AddressService();
  var paymentService = PaymentMethodsService();
  @override
  void dependencies() {
    Get.lazyPut<ConsumeController>(() => ConsumeController(shoppingService));
    Get.lazyPut<OrderDetailController>(
        () => OrderDetailController(shoppingService, addressService));
    Get.lazyPut<PaymentMethodsController>(
        () => PaymentMethodsController(paymentService));
    Get.lazyPut<AddressController>(() => AddressController(addressService));
  }
}

class CouponsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponsController>(
        () => CouponsController(CouponsApiService()));
  }
}

class CouponDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponDetailController>(() => CouponDetailController());
  }
}

class PaymentMethodsBinding implements Bindings {
  var paymentService = PaymentMethodsService();

  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodsController>(
        () => PaymentMethodsController(paymentService));
  }
}

class BillingBinding implements Bindings {
  var authService = AuthApiService();
  @override
  void dependencies() {
    Get.lazyPut<BillingController>(
        () => BillingController(authService, BranchFakesService()));
  }
}

class BillingApplyBinding implements Bindings {
  var authService = AuthApiService();
  @override
  void dependencies() {
    Get.lazyPut<BillingApplyController>(
        () => BillingApplyController(BranchFakesService()));
  }
}
