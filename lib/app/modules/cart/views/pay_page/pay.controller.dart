import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';
import 'package:jexpoints/app/modules/rewards/services/payment-methods/payment-methods.contract.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../main/services/creditCard/creditCard.contract.dart';
import '../../cart.module.dart';
import '../add_credit_card/addCreditCard.page.dart';

class PayController extends GetxController {
  // final ICreditCardService creditCardService;
  final IPaymentMethodsService paymentMethodsService;

  PayController(this.paymentMethodsService, {Key? key});
  late var selectedCreditCard = PaymentMethods.fromVoid().obs;

  late var creditCardList$ = <PaymentMethods>[].obs;
  late var newCreditCard = <PaymentMethods>[].obs;
  late var cardNumber = TextEditingController();
  late var cardHolder = TextEditingController();
  late var cardExpiration = TextEditingController();
  late var cardCVV = TextEditingController();
  late var card$ = PaymentMethods.fromVoid().obs;

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
      card$.value = args[0] as PaymentMethods;
      cardNumber.text = card$.value.cardNumber;
      cardNumber$.value = card$.value.cardNumber;
      cardHolder.text = card$.value.fullName;
      cardHolder$.value = card$.value.fullName;
      cardCVV.text = card$.value.cvv;
      cardCVV$.value = card$.value.cvv;
      cardExpiration.text = card$.value.expirationDate;
      cardExpiration$.value = card$.value.expirationDate;
    } else {
      card$.value = PaymentMethods.fromVoid();
    }

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
    cardToAdd.fullName = cardHolder$.value;
    cardToAdd.expirationDate = cardExpiration$.value;
    cardToAdd.cvv = cardCVV$.value;
    await paymentMethodsService.save(cardToAdd);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => addCreditCard(),
      ),
    );
  }

  creditCardSelect(PaymentMethods item, BuildContext context) {
    selectedCreditCard.value = item;
  }

  toProductDetail(PaymentMethods item) {
    Get.toNamed(CartRouting.CONFIRM_COMPRA_ROUTE, arguments: {
      'selectedCreditCard': selectedCreditCard.value,
    });
  }

  // creditCardLogo() async {
  //   if (cardNumber.text.characters.first == '4') {
  //     return Image.asset(
  //       'assets/images/visa.png',
  //       height: 40,
  //       width: 40,
  //     );
  //   } else if (cardNumber.text.characters.first == '5') {
  //     return Image.asset(
  //       'assets/images/mastercard.png',
  //       height: 40,
  //       width: 40,
  //     );
  //   } else if (cardNumber.text.characters.first == '3') {
  //     return Image.asset(
  //       'assets/images/amex.png',
  //       height: 40,
  //       width: 40,
  //     );
  //   } else {
  //     return Image.asset(
  //       'assets/images/credit-card.png',
  //       height: 40,
  //       width: 40,
  //     );
  //   }
  // }
}
