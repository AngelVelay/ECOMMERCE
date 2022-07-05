import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditCard.contract.dart';

class AddCardController extends GetxController {
  final ICreditCardService creditCardService;

  late var creditCardList$ = <CreditCard>[].obs;
  late var selectedCreditCard = CreditCard.fromVoid().obs;

  AddCardController(this.creditCardService);

  @override
  void onInit() async {
    super.onInit();
    creditCardList$.value = await creditCardService.get();
    if (creditCardList$.isNotEmpty) {
      selectedCreditCard.value = creditCardList$
              .where((element) => element.isDefault)
              .toList()
              .isNotEmpty
          ? creditCardList$.where((element) => element.isDefault).toList()[0]
          : creditCardList$.first;
    }
  }

  // addCreditCard() async {
  //   creditCardList$.add(CreditCard(
  //     id: creditCardList$.length + 1,
  //     color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
  //         .withOpacity(1.0),
  //     cardNumber: cardNumber.text,
  //     cardHolder: cardHolder.text,
  //     cardExpiration: cardExpiration.text,
  //     cvv: cardCVV.text,
  //     isDefault: false,
  //   ));
  // }

  creditCardSelect(CreditCard item, BuildContext context) {
    selectedCreditCard.value = item;
  }
}
