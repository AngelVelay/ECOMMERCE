import 'package:get/get.dart';

import '../../../main/entities/business-line.type.dart';
import '../../../main/entities/category.type.dart';
import '../../../main/main.module.dart';
import '../../../main/services/business-lines/business-lines.contract.dart';
import '../../store.module.dart';

class StoreController extends GetxController {
  final IBusinessLinesService businessLinesService;
  late var businessLines$ = <BusinessLine>[].obs;

  StoreController(this.businessLinesService);

  @override
  void onInit() async {
    super.onInit();
    // businessLines$.value = await businessLinesService.get();
    // businessLines$.where((element) => element.isActive == true);

    businessLines$.value = await businessLinesService.get();
    businessLines$.where((element) {
      return element.isActive == true;
    }).toList();
  }
}

toCategoryProducts(Category category) {
  Get.toNamed(StoreRouting.STORE_CATEGORY_PRODUCTS_ROUTE,
      arguments: {"category": category});
}
