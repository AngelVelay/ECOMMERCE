import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/views/home/home.controller.dart';
import 'package:jexpoints/app/modules/home/views/home/home.page.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';

import '../auth/services/auth/auth.fake.service.dart';
import '../main/views/main/widgets/menu/menu.controller.dart';

class HomeRouting {
  static const HOME_ROUTE = '/home';

  static final routes = [
    GetPage(name: HOME_ROUTE, page: () => HomePage(), binding: HomeBinding()),
  ];
}

class PruebaBinding implements Bindings {
  var authService = AuthFakeService();
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut(() => MenuController(authService));
  }
}
