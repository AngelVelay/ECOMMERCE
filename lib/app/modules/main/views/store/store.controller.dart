import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/services/business-lines/business-lines.contract.dart';

import '../../entities/product.type.dart';
import '../../main.module.dart';
import '../../services/categories/categories.contract.dart';
import '../../services/products/products.contract.dart';

class StoreController extends GetxController {
  final IBusinessLinesService businessLinesService;
  final ICategoriesService categoriesService;
  final IProductsService productsService;

  late var businessLines$ = <BusinessLine>[].obs;

  StoreController(
      this.businessLinesService, this.categoriesService, this.productsService);

  @override
  void onInit() async {
    super.onInit();
    var categories = await categoriesService.get();
    var businessLines = await businessLinesService.get();

    businessLines.forEach((bl) {
      bl.categories = categories
          .where((element) => element.businessLineId == bl.id)
          .toList();
    });
    businessLines$.value = businessLines;
  }

  // catalogList(BuildContext context) async {
  //   catalogsList$.value = await productsService.catalogsList();
  // }

  toProductDetail(Product item) {
    Get.toNamed(MainRouting.DETAIL_ROUTE, arguments: {
      'url': item.url,
      'name': item.name,
      'price': item.price,
    });
  }
}
