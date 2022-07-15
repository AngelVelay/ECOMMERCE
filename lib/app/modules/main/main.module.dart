// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/address/address.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/coupons/coupons.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditContract.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/flyers/flyers.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/products/products.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/reviews/reviews.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.fake.service.dart';
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.controller.dart';
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.page.dart';
import 'package:jexpoints/app/modules/main/views/address-detail/address-detail.page.dart';
import 'package:jexpoints/app/modules/main/views/address/address.controller.dart';
import 'package:jexpoints/app/modules/main/views/address/address.page.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catagolos.controller.dart';
import 'package:jexpoints/app/modules/main/views/catalogs_list/catagolos_list.controller.dart';
import 'package:jexpoints/app/modules/main/views/catalogs_list/catalogs_list.page.dart';
import 'package:jexpoints/app/modules/main/views/checkout/checkout.controller.dart';
import 'package:jexpoints/app/modules/main/views/checkout/checkout.page.dart';
import 'package:jexpoints/app/modules/main/views/confirm_compra/confirm-compra.controller.dart';
import 'package:jexpoints/app/modules/main/views/confirm_compra/confirm-compra.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.controller.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/order-detail.controller.dart';
import 'package:jexpoints/app/modules/main/views/coupon-detail/coupon-detail.controller.dart';
import 'package:jexpoints/app/modules/main/views/coupon-detail/coupon-detail.page.dart';
import 'package:jexpoints/app/modules/main/views/coupons/coupons.controller.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.page.dart';
import 'package:jexpoints/app/modules/main/views/main/main.controller.dart';
import 'package:jexpoints/app/modules/main/views/pay_page/pay.controller.dart';
import 'package:jexpoints/app/modules/main/views/pay_page/pay.page.dart';
import 'package:jexpoints/app/modules/main/views/payment-methods/payment-methods.controller.dart';
import 'package:jexpoints/app/modules/main/views/payment-methods/payment-methods.page.dart';
import 'package:jexpoints/app/modules/main/views/pickup-cart/pickup-cart.page.dart';
import 'package:jexpoints/app/modules/main/views/points/points.controller.dart';
import 'package:jexpoints/app/modules/main/views/points/points.page.dart';
import 'package:jexpoints/app/modules/main/views/profile/profile.page.dart';
import 'package:jexpoints/app/modules/main/views/publicidad_detail/publicidad.controller.dart';
import 'package:jexpoints/app/modules/main/views/publicidad_detail/publicidad.page.dart';
import 'package:jexpoints/app/modules/main/views/qr-generate/generate.qr.controller.dart';
import 'package:jexpoints/app/modules/main/views/qr-generate/generate.qr.page.dart';
import 'package:jexpoints/app/modules/main/views/tab-rewards/tab-rewards.controller.dart';
import 'package:jexpoints/app/modules/main/views/terms/terms.page.dart';
import 'package:jexpoints/app/modules/main/views/ubications-list/ubicationsList.controller.dart';
import 'package:jexpoints/app/modules/main/views/ubications-list/ubicationsList.page.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.page.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catalogos.page.dart';
import 'package:jexpoints/app/modules/main/views/main/main.page.dart';
import 'package:jexpoints/app/modules/main/views/profile/profile.controller.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';

import 'views/address-detail/address-detail.controller.dart';
import 'views/coupons/coupons.page.dart';
import 'views/pickup-cart/pickup-cart.controller.dart';

class MainRouting {
  static const MAIN_ROUTE = '/main';

  // static const HOME_ROUTE = '/home';
  static const PROFILE_ROUTE = '/profile';
  static const CONSUME_ROUTE = '/consume';
  static const GENERATE_QR_ROUTE = '/generate-qr';
  static const UBICATIONS_ROUTE = '/ubications';
  static const UBICATIONS_LIST_ROUTE = '/ubications-list';
  static const DETAIL_ROUTE = '/detail';
  static const PUBLICIDAD_ROUTE = '/publicidad';
  static const CATALOGOS_ROUTE = '/catalogos';
  static const PAY_ROUTE = '/pay';
  static const POINTS_ROUTE = '/points';
  static const ADD_CREDIT_CARD_ROUTE = '/add-credit-card';
  static const CONFIRM_COMPRA_ROUTE = '/confirm-compra';
  static const CATALOGS_LIST_ROUTE = '/catalogs-list';
  static const CHECKOUT_ROUTE = '/checkout';
  static const COUPONS_ROUTE = '/coupons';
  static const COUPON_DETAIL_ROUTE = '/coupon/detail';
  static const PICKUP_ROUTE = '/pickup';
  static const REWARDS_ROUTE = '/rewards';
  static const ADDRESS_ROUTE = '/address';
  static const ADDRESS_DETAIL_ROUTE = '/address-detail';
  static const PAYMENT_METHODS_ROUTE = '/payment-methods';
  static const TERMS_ROUTE = '/terms';

  static final routes = [
    GetPage(name: MAIN_ROUTE, page: () => MainPage(), binding: MainBinding()),
    GetPage(
        name: PROFILE_ROUTE,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: CONSUME_ROUTE,
        page: () => ConsumePage(),
        binding: ConsumeBinding()),
    GetPage(
        name: GENERATE_QR_ROUTE,
        page: () => QrGeneratePage(),
        binding: QrGenerateBinding()),
    // GetPage(
    //     name: UBICATIONS_ROUTE,
    //     page: () => UbicationsPage(),
    //     binding: UbicationsBinding()),
    GetPage(
        name: UBICATIONS_LIST_ROUTE,
        page: () => UbicationsListPage(),
        binding: UbicationsListBinding()),
    GetPage(
        name: DETAIL_ROUTE, page: () => DetailPage(), binding: DetailBinding()),
    GetPage(
        name: PUBLICIDAD_ROUTE,
        page: () => PublicidadPage(),
        binding: PublicidadBinding()),
    GetPage(
        name: CATALOGOS_ROUTE,
        page: () => CatalogosPage(),
        binding: CatalogosBinding()),
    GetPage(name: PAY_ROUTE, page: () => PayPage(), binding: PayBinding()),
    GetPage(
        name: POINTS_ROUTE, page: () => PointsPage(), binding: PointsBinding()),
    GetPage(
        name: ADD_CREDIT_CARD_ROUTE,
        page: () => addCreditCard(),
        binding: AddCardBinding()),
    GetPage(
        name: CONFIRM_COMPRA_ROUTE,
        page: () => ConfirmPagoPage(),
        binding: ConfirmPagodBinding()),
    GetPage(
        name: CATALOGS_LIST_ROUTE,
        page: () => CatalogsListPage(),
        binding: CatalogsListBinding()),
    GetPage(
        name: CHECKOUT_ROUTE,
        page: () => CheckOutPage(),
        binding: CheckOutBinding()),
    GetPage(
        name: COUPONS_ROUTE,
        page: () => const CouponsPage(),
        binding: CouponsBinding()),
    GetPage(
        name: COUPON_DETAIL_ROUTE,
        page: () => const CouponDetailPage(),
        binding: CouponDetailBinding()),
    GetPage(
      name: PICKUP_ROUTE,
      page: () => const PickupPage(),
      binding: PickUpBinding(),
    ),
    GetPage(
        name: PROFILE_ROUTE,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: ADDRESS_ROUTE,
        page: () => AddressPage(),
        binding: AddressBinding()),
    GetPage(
        name: ADDRESS_DETAIL_ROUTE,
        page: () => const AddressDetailPage(),
        binding: AddressDetailBinding()),
    GetPage(
        name: PAYMENT_METHODS_ROUTE,
        page: () => const PaymentMethodsPage(),
        binding: PaymentMethodsBinding()),
    GetPage(name: TERMS_ROUTE, page: () => TermsPage()),
  ];
}

class MainBinding implements Bindings {
  var authService = AuthFakeService();
  MainBinding() {
    Get.lazyPut<HomeController>(
        () => HomeController(
            ProductsFakeService(),
            authService,
            FlyersFakeService(),
            AddressFakeService(),
            CouponsFakeService(),
            CreditCardFakeService()),
        fenix: true);
    Get.lazyPut<ProfileController>(
        () => ProfileController(
            authService, CouponsFakeService(), ReviewsFakeService()),
        fenix: true);
    Get.lazyPut<ConsumeController>(
        () => ConsumeController(ShoppingFakeService()),
        fenix: true);
    Get.lazyPut<PayController>(() => PayController(CreditCardFakeService()),
        fenix: true);
    Get.lazyPut<PointsController>(() => PointsController(), fenix: true);
    Get.lazyPut<CatalogosController>(
        () =>
            CatalogosController(CatalogueFakeService(), ProductsFakeService()),
        fenix: true);
    Get.lazyPut<CheckOutController>(
        () => CheckOutController(AddressFakeService(), CreditCardFakeService()),
        fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(
        AuthFakeService(), CouponsFakeService(), ReviewsFakeService()));
    Get.lazyPut<ConsumeController>(
        () => ConsumeController(ShoppingFakeService()));
    Get.lazyPut<PayController>(() => PayController(CreditCardFakeService()));
    Get.lazyPut<PointsController>(() => PointsController());
    Get.lazyPut<CatalogosController>(() =>
        CatalogosController(CatalogueFakeService(), ProductsFakeService()));
    Get.lazyPut<CheckOutController>(() =>
        CheckOutController(AddressFakeService(), CreditCardFakeService()));
    Get.lazyPut<RewardsController>(() => RewardsController(authService),
        fenix: true);
    Get.lazyPut<CatalogosListController>(() =>
        CatalogosListController(CatalogueFakeService(), ProductsFakeService()));
  }

  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
  }
}

class ProfileBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(
        AuthFakeService(), CouponsFakeService(), ReviewsFakeService()));
  }
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

class QrGenerateBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<QrGenerateController>(() => QrGenerateController());
  }
}

// class UbicationsBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<UbicationsController>(() => UbicationsController(),
//         fenix: true);
//   }
// }

class UbicationsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbicationsListController>(() => UbicationsListController());
  }
}

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
      () => DetailController(ReviewsFakeService(), ProductsFakeService()),
    );
  }
}

class PublicidadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicidadController>(() => PublicidadController());
  }
}

class CatalogosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogosController>(() =>
        CatalogosController(CatalogueFakeService(), ProductsFakeService()));
  }
}

class PayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayController>(() => PayController(CreditCardFakeService()));
  }
}

class PointsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointsController>(() => PointsController());
  }
}

class AddCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCardController>(
        () => AddCardController(CreditCardFakeService()));
  }
}

class ConfirmPagodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmPagoController>(() =>
        ConfirmPagoController(CreditCardFakeService(), ProductsFakeService()));
  }
}

class CatalogsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogosListController>(() =>
        CatalogosListController(CatalogueFakeService(), ProductsFakeService()));
  }
}

class CheckOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(() =>
        CheckOutController(AddressFakeService(), CreditCardFakeService()));
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

class PickUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickUpController>(() => PickUpController());
  }
}

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(
        () => AddressController(AddressFakeService()));
  }
}

class AddressDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressDetailController>(
        () => AddressDetailController(AddressFakeService()));
  }
}

class PaymentMethodsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodsController>(
        () => PaymentMethodsController(CreditCardFakeService()));
  }
}
