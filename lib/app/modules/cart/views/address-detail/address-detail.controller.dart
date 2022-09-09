import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/msg.utils.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/services/address/address.contract.dart';

class AddressDetailController extends GetxController {
  final IAddressService _addressService;
  late var address$ = UserAddress.fromVoid().obs;
  final formKey = GlobalKey<FormBuilderState>();

  var tst = "";

  AddressDetailController(this._addressService);

  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    if (args != null) {
      address$.value = args[0];
    } else {
      address$.value = UserAddress.fromVoid();
    }
  }

  save() async {
    formKey.currentState?.save();
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      var tst = formKey.currentState;
      await _addressService.save(Address.fromJson(formKey.currentState!.value));
      Get.back();
      MsgUtils.success('Domicilio actualizado correctamente');
    }
  }
}
