import 'package:flutter/material.dart';

class CreditCard {
  CreditCard({
    required this.id,
    required this.color,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
    required this.isDefault,
  });

  int id;
  String cardExpiration;

  String cardHolder;

  String cardNumber;

  String color;

  bool isDefault;

  factory CreditCard.fromVoid() => CreditCard(
      id: 1,
      color: '',
      cardNumber: '',
      cardHolder: '',
      cardExpiration: '',
      isDefault: false);

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        id: json["id"],
        cardExpiration: json["cardExpiration"],
        cardHolder: json["cardHolder"],
        cardNumber: json["cardNumber"],
        color: (json["color"]),
        isDefault: json["isDefault"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cardExpiration": cardExpiration,
        "cardHolder": cardHolder,
        "cardNumber": cardNumber,
        "color": color,
      };
}
