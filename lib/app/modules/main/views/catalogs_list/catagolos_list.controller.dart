import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/entities/category.type.dart';
import 'package:jexpoints/app/modules/main/services/business-lines/business-lines.contract.dart';
import '../../entities/product.type.dart';
import '../../main.module.dart';
import '../../services/categories/categories.contract.dart';
import '../../services/products/products.contract.dart';

class CatalogosListController extends GetxController {
  late final ICategoriesService categoriesService;
  late final IBusinessLinesService businessLinesService;
  late final IProductsService productsService;

  late final keywordCtrl = TextEditingController();

  late var categoriesList$ = <Category>[].obs;
  late var businessLines$ = <BusinessLine>[].obs;

  late var findedProducts$ = <Product>[].obs;
  late var catalogsList$ = <Product>[].obs;
  late var favoriteProducts$ = <Product>[].obs;
  late var cartProducts$ = <Product>[].obs;
  late var productList$ = <Product>[].obs;
  late var cartItems$ = 0.obs;
  var category = "";

  final categoria = Get.arguments['category'];

  CatalogosListController(this.categoriesService, this.productsService);

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

  addCart(Product item) {
    item.cartValue++;
    if (!cartProducts$.any((element) => element.id == item.id)) {
      cartProducts$.add(item);
    }

    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    _updateCartItems();
  }

  deleteCart(Product item) {
    item.cartValue--;
    if (item.cartValue == 0) {
      cartProducts$.remove(item);
    }
    cartProducts$.refresh();
    productList$.refresh();
    findedProducts$.refresh();
    catalogsList$.refresh();
    favoriteProducts$.refresh();
    _updateCartItems();
  }

  _updateCartItems() {
    cartItems$.value =
        cartProducts$.map((e) => e.cartValue).reduce((a, b) => a + b);
    cartItems$.refresh();
  }

  catalogList(BuildContext context) async {
    catalogsList$.value = await productsService.catalogsList();

    findedProducts$.value = catalogsList$
        .where((e) => e.category.toString().contains(category.toLowerCase()))
        .toList();
    print(category);

    productList$.value = findedProducts$.value;

    findedProducts$.value = productList$
        .where((e) =>
            e.name.toLowerCase().contains(keywordCtrl.text.toLowerCase()))
        .toList();
  }

  toSearch(CatalogosListController controller) {
    // Get.to(() => CatalogSearchPage(controller));
  }

  search(BuildContext context) async {
    // productList$.value = await productsService.search(keywordCtrl.text);
    findedProducts$.value = productList$
        .where((e) => e.category.toString().contains(category.toLowerCase()))
        .toList();
    FocusScope.of(context).unfocus();
  }

  toProductDetail(Product item) {
    Get.toNamed(MainRouting.DETAIL_ROUTE, arguments: {
      'url': item.url,
      'name': item.name,
      'price': item.price,
    });
  }
}
