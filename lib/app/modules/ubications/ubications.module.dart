import 'package:get/get.dart';
import 'package:jexpoints/app/modules/ubications/services/branches-tags/branches-tags.api.service.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications-list/ubicationsList.controller.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications-list/ubicationsList.page.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications/ubications.controller.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications/ubications.page.dart';

class UbicationsRouting {
  static const UBICATIONS_ROUTE = '/ubications';
  static const UBICATIONS_LIST_ROUTE = '/ubications-list';

  static final routes = [
    GetPage(
        name: UBICATIONS_LIST_ROUTE,
        page: () => UbicationsListPage(),
        binding: UbicationsListBinding()),
    GetPage(
        name: UBICATIONS_ROUTE,
        page: () => UbicationsPage(),
        binding: UbicationsBinding()),
  ];
}

class UbicationsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbicationsListController>(() => UbicationsListController());
  }
}

class UbicationsBinding implements Bindings {
  var branchesTagsService = BranchesTagsService();

  @override
  void dependencies() {
    Get.lazyPut<UbicationsController>(
        () => UbicationsController(branchesTagsService),
        fenix: true);
  }
}
