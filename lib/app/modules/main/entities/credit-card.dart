import 'package:flutter/material.dart';

class CreditCard {
  CreditCard({
    required this.id,
    required this.color,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
  });

  int id;
  String cardExpiration;

  String cardHolder;

  String cardNumber;

  String color;

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        id: json["id"],
        cardExpiration: json["cardExpiration"],
        cardHolder: json["cardHolder"],
        cardNumber: json["cardNumber"],
        color: (json["color"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cardExpiration": cardExpiration,
        "cardHolder": cardHolder,
        "cardNumber": cardNumber,
        "color": color,
      };
}
