import 'package:flutter/material.dart';
import 'dart:math' as math;

class CreditCard {
  CreditCard({
    required this.id,
    required this.color,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
    required this.cvv,
    required this.isDefault,
  });

  int id;
  String cardExpiration;

  String cardHolder;

  String cardNumber;

  String cvv;

  Color color;

  bool isDefault;

  factory CreditCard.fromVoid() => CreditCard(
        id: 1,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        cardNumber: '',
        cardHolder: '',
        cardExpiration: '',
        isDefault: false,
        cvv: '',
      );

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        id: json["id"],
        cardExpiration: json["cardExpiration"],
        cardHolder: json["cardHolder"],
        cardNumber: json["cardNumber"],
        color: (json["color"]),
        isDefault: json["isDefault"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "cardExpiration": cardExpiration,
        // "cardHolder": cardHolder,
        // "cardNumber": cardNumber,
        // "color": color,
        // "isDefault": isDefault,
        // "cvv": cvv,
      };
}
