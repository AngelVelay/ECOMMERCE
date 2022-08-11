// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/branch/branch.fake.service.dart';

import 'package:jexpoints/app/modules/main/services/coupons/coupons.fake.service.dart';
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

import '../cart/services/creditCard/creditContract.fake.service.dart';
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

  static final IAuthService authService = AuthFakeService();

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
  var authService = AuthFakeService();
  var shoppingService = ShoppingFakeService();
  @override
  void dependencies() {
    Get.lazyPut<ConsumeController>(() => ConsumeController(shoppingService));
    Get.lazyPut<OrderDetailController>(
        () => OrderDetailController(shoppingService));
  }
}

class CouponsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponsController>(
        () => CouponsController(CouponsFakeService()));
  }
}

class CouponDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponDetailController>(() => CouponDetailController());
  }
}

class PaymentMethodsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodsController>(
        () => PaymentMethodsController(CreditCardFakeService()));
  }
}

class BillingBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<BillingController>(
        () => BillingController(authService, BranchFakesService()));
  }
}

class BillingApplyBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<BillingApplyController>(
        () => BillingApplyController(BranchFakesService()));
  }
}
