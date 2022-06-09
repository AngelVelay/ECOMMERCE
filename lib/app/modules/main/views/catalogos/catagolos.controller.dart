import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/catalogues-tab.dart';
import 'package:jexpoints/app/modules/main/services/catalogues/catalogues.contract.dart';

class CatalogosController extends GetxController {
  final ICatalogueService catalogoService;
  late var catalogueList$ = <Catalogue>[].obs;

  CatalogosController(this.catalogoService);

  @override
  void onInit() async {
    super.onInit();
    catalogueList$.value = await catalogoService.get();
  }
}
