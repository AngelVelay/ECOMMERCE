import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/main/entities/my-shopping.type.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';
import 'package:jexpoints/app/modules/main/views/checkout/checkout.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';

import '../../../../components/map_ubication/map_ubication.dart';
import 'components/home-delivery.dart';
import 'components/qr-pickup.dart';
import 'components/timeline.dart';

class ConsumeController extends GetxController {
  final IShoppingService shoppingService;

  late var shoppingList$ = <MyShopping>[].obs;
  final keywordCtrl = TextEditingController();
  late var findedProducts$ = <MyShopping>[].obs;

  ConsumeController(this.shoppingService);

  @override
  void onInit() async {
    super.onInit();
    shoppingList$.value = await shoppingService.get();
  }

  search(BuildContext context, String query) async {
    findedProducts$.value = await shoppingService.search(keywordCtrl.text);
    FocusScope.of(context).unfocus();
  }

  @override
  Future<List<MyShopping>> getByName(String query) async {
    //filter by name
    return shoppingList$.value.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  consumeTapMap(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0XFF22222222),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: QrPickUp(),
        ),
      ),
    );
  }

  consumeTapDeliveryInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: HomeDelivery()),
      ),
    );
  }

  void selectedDeliveryType(MyShopping item, BuildContext context) {
    if (item.deliveryType == DeliveryType.envioADomicilio) {
      consumeTapDeliveryInfo(context);
    } else {
      consumeTapMap(context);
    }
  }
}
