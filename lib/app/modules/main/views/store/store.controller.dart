import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/entities/category.type.dart';
import 'package:jexpoints/app/modules/main/services/business-lines/business-lines.contract.dart';
import '../../main.module.dart';

class StoreController extends GetxController {
  final IBusinessLinesService businessLinesService;
  late var businessLines$ = <BusinessLine>[].obs;

  StoreController(this.businessLinesService);

  @override
  void onInit() async {
    super.onInit();
    businessLines$.value = await businessLinesService.get();
  }

  toCategoryProducts(Category category) {
    Get.toNamed(MainRouting.STORE_CATEGORY_PRODUCTS_ROUTE,
        arguments: {"category": category});
  }
}
