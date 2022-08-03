import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';
import 'components/order-detail-delivery.dart';
import 'components/order-detail-pickup.dart';
import 'order-detail.controller.dart';

class ConsumeController extends GetxController {
  final IShoppingService shoppingService;

  late var shoppingList$ = <Order>[].obs;
  final keywordCtrl = TextEditingController();
  late var findedProducts$ = <Order>[].obs;

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
  Future<List<Order>> getByName(String query) async {
    //filter by name
    return shoppingList$.value.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  showDetailPickup(BuildContext context, Order order) {
    showModalBottomSheet(
      backgroundColor: const Color(0XFF22222222),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: const OrderDetailPickup(),
        ),
      ),
    );
  }

  showDetailDelivery(BuildContext context, Order order) {
    SheetUtils.show(context, const OrderDetailDelivery(),
        title: 'Pedido #${order.id}');
  }

  void showDetail(Order item, BuildContext context) {
    var ctrl = Get.find<OrderDetailController>();
    ctrl.setOrder(item);
    if (item.deliveryType == DeliveryType.envioADomicilio) {
      showDetailDelivery(context, item);
    } else {
      showDetailPickup(context, item);
    }
  }
}
