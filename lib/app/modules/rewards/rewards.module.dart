// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.contract.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';

import 'package:jexpoints/app/modules/main/services/coupons/coupons.fake.service.dart';

import 'package:jexpoints/app/modules/rewards/views/consume/consume.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/consume/consume.page.dart';
import 'package:jexpoints/app/modules/rewards/views/consume/order-detail.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/coupon-detail/coupon-detail.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/coupon-detail/coupon-detail.page.dart';
import 'package:jexpoints/app/modules/rewards/views/coupons/coupons.controller.dart';
import 'package:jexpoints/app/modules/rewards/views/coupons/coupons.page.dart';
import 'package:jexpoints/app/modules/rewards/views/terms/terms.page.dart';

import '../main/services/shopping/shopping.fake.service.dart';

class RewardsRouting {
  static const CONSUME_ROUTE = '/consume';
  static const COUPONS_ROUTE = '/coupons';
  static const COUPON_DETAIL_ROUTE = '/coupon/detail';
  static const REWARDS_ROUTE = '/rewards';
  static const TERMS_ROUTE = '/terms';

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
