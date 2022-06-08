import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';
import 'package:jexpoints/app/modules/main/services/creditCard/creditCard.contract.dart';

class CreditCardFakeService implements ICreditCardService {
  final _creditCardList = <CreditCard>[
    // CreditCard(
    //   id: 1,
    //   color: '0xffe61919',
    //   cardNumber: '4566 9876 XXXX XXXX',
    //   cardHolder: 'ANGEL VELAY',
    //   cardExpiration: '09/2024',
    // ),
    CreditCard(
      id: 2,
      color: '0xff2222222',
      cardNumber: '5662 9876 XXXX XXXX',
      cardHolder: 'JUAN ',
      cardExpiration: '06/2024',
    ),
    CreditCard(
      id: 3,
      color: '0xffbf930d',
      cardNumber: '3543 9876 XXXX XXXX',
      cardHolder: 'FERNANDO P',
      cardExpiration: '02/2024',
    ),
  ];

  @override
  Future<List<CreditCard>> get() async {
    return _creditCardList;
  }
}
