import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/views/order-home/order-home.page.dart';

import 'views/home/home.controller.dart';
import 'views/home/home.page.dart';
import 'views/order-problems/order-problems.page.dart';
import 'views/order_detail/order_detail.page.dart';

class HomeRouting {
  static const String HOME_ROUTE = '/home';
  static const String ORDER_HOME_ROUTE = '/order-home';
  static const String ORDER_DETAIL_ROUTE = '/order-detail';
  static const String ORDER_PROBLEMS_ROUTE = '/order-detail-edit';

  static final routes = [
    GetPage(
      name: HOME_ROUTE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ORDER_HOME_ROUTE,
      page: () => OrderHomePage(),
    ),
    GetPage(
      name: ORDER_DETAIL_ROUTE,
      page: () => OrderDetailPage(),
    ),
    GetPage(
      name: ORDER_PROBLEMS_ROUTE,
      page: () => OrderProblemsPage(),
    ),
  ];
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
