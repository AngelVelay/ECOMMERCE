import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../main/main.module.dart';
import '../../../main/services/creditCard/creditCard.contract.dart';
import '../../cart.module.dart';
import '../add_credit_card/addCreditCard.page.dart';

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
  late var card$ = CreditCard.fromVoid().obs;

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
    var args = Get.arguments;
    if (args != null) {
      card$.value = args[0] as CreditCard;
      cardNumber.text = card$.value.cardNumber;
      cardNumber$.value = card$.value.cardNumber;
      cardHolder.text = card$.value.cardHolder;
      cardHolder$.value = card$.value.cardHolder;
      cardCVV.text = card$.value.cvv;
      cardCVV$.value = card$.value.cvv;
      cardExpiration.text = card$.value.cardExpiration;
      cardExpiration$.value = card$.value.cardExpiration;
    } else {
      card$.value = CreditCard.fromVoid();
    }

    cardNumber.addListener(() {
      cardNumber$.value = cardNumber.text;
      creditCardLogo() => cardNumber.text;
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

  void save(BuildContext context) async {
    var cardToAdd = card$.value;
    cardToAdd.cardNumber = cardNumber$.value;
    cardToAdd.cardHolder = cardHolder$.value;
    cardToAdd.cardExpiration = cardExpiration$.value;
    cardToAdd.cvv = cardCVV$.value;
    await creditCardService.save(cardToAdd);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => addCreditCard(),
      ),
    );
  }

  creditCardSelect(CreditCard item, BuildContext context) {
    selectedCreditCard.value = item;
  }

  toProductDetail(CreditCard item) {
    Get.toNamed(CartRouting.CONFIRM_COMPRA_ROUTE, arguments: {
      'selectedCreditCard': selectedCreditCard.value,
    });
  }

  creditCardLogo() async {
    if (cardNumber.text.characters.first == '4') {
      return Image.asset(
        'assets/images/visa.png',
        height: 40,
        width: 40,
      );
    } else if (cardNumber.text.characters.first == '5') {
      return Image.asset(
        'assets/images/mastercard.png',
        height: 40,
        width: 40,
      );
    } else if (cardNumber.text.characters.first == '3') {
      return Image.asset(
        'assets/images/amex.png',
        height: 40,
        width: 40,
      );
    } else {
      return Image.asset(
        'assets/images/credit-card.png',
        height: 40,
        width: 40,
      );
    }
  }
}
