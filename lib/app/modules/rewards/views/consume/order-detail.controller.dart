import 'dart:developer';

import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/home/services/address/address.contract.dart';
import 'package:jexpoints/app/modules/main/entities/order.type.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';

class OrderDetailController extends GetxController {
  var order$ = Order.fromVoid().obs;
  final IShoppingService shoppingService;
  final IAddressService _addressService;

  late var addressList$ = <UserAddress>[].obs;
  late var selectedAddress$ = UserAddress.fromVoid().obs;

  OrderDetailController(this.shoppingService, this._addressService);

  @override
  void onInit() async {
    super.onInit();
    addressList$.value = await _addressService.getFromCurrent();
  }

  setOrder(Order item) async {
    order$.value = await shoppingService.getById(item.id);
  }
}
