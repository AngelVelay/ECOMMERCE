import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';
import 'package:jexpoints/app/modules/rewards/services/payment-methods/payment-methods.contract.dart';

class AddCardController extends GetxController {
  // final ICreditCardService creditCardService;
  final IPaymentMethodsService paymentMethodsService;

  late var creditCardList$ = <PaymentMethods>[].obs;
  late var selectedCreditCard = PaymentMethods.fromVoid().obs;

  AddCardController(this.paymentMethodsService);

  @override
  void onInit() async {
    super.onInit();
    creditCardList$.value = await paymentMethodsService.getPayment();
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

  creditCardSelect(PaymentMethods item, BuildContext context) {
    selectedCreditCard.value = item;
  }
}
