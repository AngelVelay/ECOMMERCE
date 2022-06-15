// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/address/address.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditContract.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/flyers/flyers.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/products/products.fake.service.dart';
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.controller.dart';
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.page.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catagolos.controller.dart';
import 'package:jexpoints/app/modules/main/views/catalogs_list/catalogs_list.page.dart';
import 'package:jexpoints/app/modules/main/views/checkout/checkout.controller.dart';
import 'package:jexpoints/app/modules/main/views/checkout/checkout.page.dart';
import 'package:jexpoints/app/modules/main/views/confirm_compra/confirm-compra.controller.dart';
import 'package:jexpoints/app/modules/main/views/confirm_compra/confirm-compra.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.controller.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.page.dart';
import 'package:jexpoints/app/modules/main/views/main/main.controller.dart';
import 'package:jexpoints/app/modules/main/views/pay_page/pay.controller.dart';
import 'package:jexpoints/app/modules/main/views/pay_page/pay.page.dart';
import 'package:jexpoints/app/modules/main/views/points/points.controller.dart';
import 'package:jexpoints/app/modules/main/views/points/points.page.dart';
import 'package:jexpoints/app/modules/main/views/profile/profile.page.dart';
import 'package:jexpoints/app/modules/main/views/publicidad_detail/publicidad.controller.dart';
import 'package:jexpoints/app/modules/main/views/publicidad_detail/publicidad.page.dart';
import 'package:jexpoints/app/modules/main/views/qr-generate/generate.qr.controller.dart';
import 'package:jexpoints/app/modules/main/views/qr-generate/generate.qr.page.dart';
import 'package:jexpoints/app/modules/main/views/ubications-list/ubicationsList.controller.dart';
import 'package:jexpoints/app/modules/main/views/ubications-list/ubicationsList.page.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.page.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catalogos.page.dart';
import 'package:jexpoints/app/modules/main/views/main/main.page.dart';
import 'package:jexpoints/app/modules/main/views/profile/profile.controller.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';

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
    GetPage(
        name: UBICATIONS_ROUTE,
        page: () => UbicationsPage(),
        binding: UbicationsBinding()),
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
        page: () => ConfirmBuyPage(),
        binding: ConfirmPagodBinding()),
    GetPage(
        name: CATALOGS_LIST_ROUTE,
        page: () => CatalogsListPage(),
        binding: ConfirmPagodBinding()),
    GetPage(
        name: CHECKOUT_ROUTE,
        page: () => CheckOutPage(),
        binding: CheckOutBinding()),
  ];
}

class MainBinding implements Bindings {
  var authService = AuthFakeService();
  MainBinding() {
    Get.lazyPut<HomeController>(
        () => HomeController(ProductsFakeService(), authService,
            FlyersFakeService(), AddressFakeService()),
        fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(authService),
        fenix: true);
    Get.lazyPut<ConsumeController>(() => ConsumeController(), fenix: true);
    Get.lazyPut<PayController>(() => PayController(), fenix: true);
    Get.lazyPut<PointsController>(() => PointsController(), fenix: true);
    Get.lazyPut<CatalogosController>(
        () => CatalogosController(CatalogueFakeService()),
        fenix: true);
    Get.lazyPut<CheckOutController>(() => CheckOutController(), fenix: true);
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
    Get.lazyPut<ProfileController>(() => ProfileController(AuthFakeService()));
  }
}

class ConsumeBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<ConsumeController>(() => ConsumeController());
  }
}

class QrGenerateBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<QrGenerateController>(() => QrGenerateController());
  }
}

class UbicationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbicationsController>(() => UbicationsController());
  }
}

class UbicationsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbicationsListController>(() => UbicationsListController());
  }
}

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
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
    Get.lazyPut<CatalogosController>(
        () => CatalogosController(CatalogueFakeService()));
  }
}

class PayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayController>(() => PayController());
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
    Get.lazyPut<ConfirmPagoController>(
        () => ConfirmPagoController(CreditCardFakeService()));
  }
}

class CatalogsListBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(() => HomeController());
  }
}

class CheckOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(() => CheckOutController());
  }
}
