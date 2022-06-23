import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:jexpoints/app/modules/main/views/add_credit_card/addCreditCard.page.dart';

import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../services/creditCard/creditCard.contract.dart';

class PayController extends GetxController {
  final ICreditCardService creditCardService;

  PayController(this.creditCardService);

  late var creditCardList$ = <CreditCard>[].obs;
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
  void onInit() {
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

    cardNUmberFormatter = MaskTextInputFormatter(
        mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  }

  @override
  void dispose() {
    cardNumber.dispose();
    cardHolder.dispose();
    cardExpiration.dispose();
    cardCVV.dispose();

    super.dispose();
  }

  addCreditCard() async {
    creditCardList$.add(CreditCard(
      id: creditCardList$.length + 1,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      cardNumber: cardNumber.text,
      cardHolder: cardHolder.text,
      cardExpiration: cardExpiration.text,
      cvv: cardCVV.text,
      isDefault: false,
    ));
  }
}


//  id: creditCardList$.length + 1,
//         color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
//             .withOpacity(1.0),
//         isDefault: false,
//         cardNumber: cardNumber.text,
//         cardHolder: cardHolder.text,
//         cardExpiration: cardExpiration.text,
//         cvv: cardCVV.text
  // // void addCreditCard() {
    // //   creditCardService.addCreditCard().then((value) {
    // //     creditCardList$.value = value;
    //   });

      //   void addCreditCard() async => creditCardList$.add(CreditCard(
      //         id: creditCardList$.length + 1,
      //         color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      //             .withOpacity(1.0),
      //         cardNumber: cardNumber$.value,
      //         cardHolder: cardHolder$.value,
      //         cardExpiration: cardExpiration$.value,
      //         cvv: cvv$.value,
      //         isDefault: false,
      //       ));
      // }