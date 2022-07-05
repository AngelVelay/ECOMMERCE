import 'dart:developer';

import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import 'package:jexpoints/app/modules/main/services/address/address.contract.dart';

class AddressController extends GetxController {
  final IAddressService _addressService;

  late var addressList$ = <Address>[].obs;

  AddressController(this._addressService);

  @override
  void onInit() async {
    super.onInit();
    addressList$.value = await _addressService.getFromCurrent();
  }

  toAdd() {
    Get.toNamed(MainRouting.ADDRESS_DETAIL_ROUTE);
  }

  toAddessDetail(Address address) {
    Get.toNamed(MainRouting.ADDRESS_DETAIL_ROUTE, arguments: [address]);
  }
}
