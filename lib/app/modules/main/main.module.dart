// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/auth/services/auth/auth.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/employees/employees.fake.service.dart';
import 'package:jexpoints/app/modules/main/services/products/products.fake.service.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catagolos.controller.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catalogos.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.controller.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.page.dart';
import 'package:jexpoints/app/modules/main/views/home/home.controller.dart';
import 'package:jexpoints/app/modules/main/views/home/home.page.dart';
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
import 'views/main/widgets/menu/menu.controller.dart';
import 'views/profile/profile.controller.dart';
import 'views/search/search.page.dart';
import 'views/tst/tst.controller.dart';

class MainRouting {
  static const MAIN_ROUTE = '/main';

  static const HOME_ROUTE = '/home';
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

  static final routes = [
    // GetPage(name: MAIN_ROUTE, page: () => MainPage(), binding: MainBinding()),
    GetPage(name: HOME_ROUTE, page: () => HomePage(), binding: HomeBinding()),
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
  ];
}

class MainBinding implements Bindings {
  var authService = AuthFakeService();
  MainBinding() {
    Get.lazyPut(() => TstController(EmployeesFakeService()));
    Get.lazyPut(() => MenuController(authService));
    Get.lazyPut<ProfileController>(() => ProfileController(AuthFakeService()));
    Get.lazyPut<ConsumeController>(() => ConsumeController());
    Get.lazyPut<PayController>(() => PayController());
    Get.lazyPut<PointsController>(() => PointsController());
  }

  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(authService));
  }
}

class HomeBinding implements Bindings {
  var authService = AuthFakeService();
  var productsService = ProductsFakeService();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(productsService));
    Get.lazyPut<ProfileController>(() => ProfileController(AuthFakeService()));
    Get.lazyPut<ConsumeController>(() => ConsumeController());
    Get.lazyPut<CatalogosController>(() => CatalogosController());

    Get.lazyPut(() => MenuController(authService));
    Get.lazyPut<PayController>(() => PayController());
    Get.lazyPut<PointsController>(() => PointsController());
  }
}

class ProfileBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(AuthFakeService()));
    Get.lazyPut(() => MenuController(authService));
  }
}

class ConsumeBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<ConsumeController>(() => ConsumeController());
    Get.lazyPut(() => MenuController(authService));
  }
}

class QrGenerateBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<QrGenerateController>(() => QrGenerateController());
    Get.lazyPut(() => MenuController(authService));
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
    Get.lazyPut<CatalogosController>(() => CatalogosController());
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
