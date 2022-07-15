import 'dart:developer';

import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';

class OrderDetailController extends GetxController {
  var order$ = Order.fromVoid().obs;
  final IShoppingService shoppingService;

  OrderDetailController(this.shoppingService);

  @override
  void onInit() async {
    super.onInit();
  }

  setOrder(Order item) async {
    order$.value = await shoppingService.getById(item.id);
  }
}
