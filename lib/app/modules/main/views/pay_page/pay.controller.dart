import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.page.dart';

import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../main.module.dart';
import '../../services/creditCard/creditCard.contract.dart';

class PayController extends GetxController {
  final ICreditCardService creditCardService;

  PayController(this.creditCardService);
  late var selectedCreditCard = CreditCard.fromVoid().obs;

  late var creditCardList$ = <CreditCard>[].obs;
  late var newCreditCard = <CreditCard>[].obs;
  late var cardNumber = TextEditingController();
  late var cardHolder = TextEditingController();
  late var cardExpiration = TextEditingController();
  late var cardCVV = TextEditingController();

  RxString cardCVV$ = ''.obs;
  RxString cardNumber$ = ''.obs;
  RxString cardHolder$ = ''.obs;
  RxString cardExpiration$ = ''.obs;

  late var cardNUmberFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  late var cardCVVFormatter =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});
  late var cardExpirationFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  late var cardHolderFormatter = MaskTextInputFormatter(
      mask: '# # # # # # # # # # # # # # # # # # # # #',
      filter: {"#": RegExp(r'[0-9]')});

  @override
  void onInit() async {
    super.onInit();

    cardNumber.addListener(() {
      cardNumber$.value = cardNumber.text;
    });
    cardHolder.addListener(() {
      cardHolder$.value = cardHolder.text;
    });

    cardExpiration.addListener(() {
      cardExpiration$.value = cardExpiration.text;
    });

    cardCVV.addListener(() {
      cardCVV$.value = cardCVV.text;
    });

    creditCardList$.value = await creditCardService.get();
    creditCardList$.value = await creditCardService.getFromCurrent();
    if (creditCardList$.isNotEmpty) {
      selectedCreditCard.value = creditCardList$
              .where((element) => element.isDefault)
              .toList()
              .isNotEmpty
          ? creditCardList$.where((element) => element.isDefault).toList()[0]
          : creditCardList$.first;
    }
  }

  @override
  void dispose() {
    cardNumber.dispose();
    cardHolder.dispose();
    cardExpiration.dispose();
    cardCVV.dispose();

    super.dispose();
  }

  addCreditCard() {
    creditCardList$.add(CreditCard(
      id: creditCardList$.length + 1,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: cardNumber$.value,
      cardHolder: cardHolder$.value,
      cardExpiration: cardExpiration$.value,
      cvv: cardCVV$.value,
      isDefault: false,
    ));
    return creditCardList$.value;
  }

  creditCardSelect(CreditCard item, BuildContext context) {
    selectedCreditCard.value = item;
  }

  toProductDetail(CreditCard item) {
    Get.toNamed(MainRouting.CONFIRM_COMPRA_ROUTE, arguments: {
      'selectedCreditCard': selectedCreditCard.value,
    });
  }
}
