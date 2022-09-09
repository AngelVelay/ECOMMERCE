// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
// import 'package:jexpoints/app/modules/main/services/creditCard/creditCard.contract.dart';

// import 'package:jexpoints/app/shared/values/mock-data.dart';

// class CreditCardFakeService implements ICreditCardService {
//   List<CreditCard> get _creditCardList {
//     return MockData.creditCardList;
//   }

//   set _creditCardList(List<CreditCard> list) {
//     MockData.creditCardList = list;
//   }

//   @override
//   Future<List<CreditCard>> get() async {
//     return _creditCardList;
//   }

//   @override
//   Future<CreditCard> save(CreditCard item) async {
//     if (item.id == 0) {
//       item.id = _creditCardList.length + 1;
//       _creditCardList.add(item);
//     } else {
//       var current =
//           _creditCardList.firstWhere((element) => element.id == item.id);
//       _creditCardList[_creditCardList.indexOf(current)] = item;
//     }
//     return item;
//   }
// }
