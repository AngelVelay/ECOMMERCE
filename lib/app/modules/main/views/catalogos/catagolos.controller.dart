import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/catalogues-tab.dart';
import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.contract.dart';

import '../../entities/product.type.dart';
import '../../main.module.dart';
import '../../services/products/products.contract.dart';
import '../tab-home-search/tab-home-search.page.dart';
import '../tab-home/tab-home.controller.dart';
import 'components/catalog-search.dart';

class CatalogosController extends GetxController {
  final ICatalogueService catalogoService;
  final IProductsService productsService;

  late var catalogueList$ = <Catalogue>[].obs;
  late var catalogueListSantoGallo$ = <Catalogue>[].obs;
  late var catalogsList$ = <Product>[].obs;

  CatalogosController(this.catalogoService, this.productsService);

  @override
  void onInit() async {
    super.onInit();
    catalogueList$.value = await catalogoService.get();
    catalogueListSantoGallo$.value = await catalogoService.getSantoGallo();
  }

    catalogList(BuildContext context) async {
    catalogsList$.value = await productsService.catalogsList();
  }

    toProductDetail(Product item) {
    Get.toNamed(MainRouting.DETAIL_ROUTE, arguments: {
      'url': item.url,
      'name': item.name,
      'price': item.price,
    });
  }
}
