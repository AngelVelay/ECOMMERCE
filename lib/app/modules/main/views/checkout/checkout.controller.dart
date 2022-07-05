import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../entities/credit-card.dart';
import '../../main.module.dart';
import '../../services/address/address.contract.dart';
import '../../services/creditCard/creditCard.contract.dart';
import '../tab-home/components/address-choose.widget.dart';
import '../tab-home/tab-home.controller.dart';

class CheckOutController extends GetxController {
  final IAddressService addressService;
  final ICreditCardService creditCardService;
  CheckOutController(this.addressService, this.creditCardService);

  late var selectedCreditCard$ = <CreditCard>[].obs;

  final String data =
      "Pastel de Chocolate comprado en la Esperanza Sucursal Valle";

  final total = Get.arguments['total'];
  final cartProducts = Get.arguments['cartProducts'];
  final selectedAddress = Get.arguments['selectedAddress'];
  final coupons = Get.arguments['defaultCoupon'];
  final selectedCreditCard = Get.arguments['selectedCreditCard'];

  @override
  void onInit() async {
    super.onInit();
    selectedCreditCard$.value = await creditCardService.get();
    selectedCreditCard$.value = selectedCreditCard;
  }

  adreesTap(BuildContext context) {
    final homeController = Get.find<HomeController>();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Cambiar dirección',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.48,
            child: HomeAddressSelect(homeController),
          ),
        ],
      ),
    );
  }

  toPickup() {
    Get.toNamed(MainRouting.PICKUP_ROUTE);
  }
}
