import 'dart:developer';

import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/home/services/address/address.contract.dart';

import '../../home.module.dart';

class AddressController extends GetxController {
  // final IAddressService _addressService;
  final IAddressService _addressService;

  late var addressList$ = <UserAddress>[].obs;

  AddressController(this._addressService);

  @override
  void onInit() async {
    super.onInit();
    addressList$.value = await _addressService.getFromCurrent();
    addressList$.value = await _addressService.getFromCurrent();
  }

  toAdd() {
    Get.toNamed(HomeRouting.ADDRESS_DETAIL_ROUTE);
  }

  toAddessDetail(UserAddress address) {
    Get.toNamed(HomeRouting.ADDRESS_DETAIL_ROUTE, arguments: [address]);
  }
}
