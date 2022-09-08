// To parse this JSON data, do
//
//     final paymentMethods = paymentMethodsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class PaymentMethods {
  PaymentMethods({
    required this.userId,
    @required this.user,
    required this.fullName,
    required this.cardNumber,
    required this.expirationDate,
    required this.isDefault,
    required this.cvv,
    required this.id,
    required this.isNew,
  });

  int userId;
  dynamic user;
  String fullName;
  String cardNumber;
  String expirationDate;
  bool isDefault;
  String cvv;
  int id;
  bool isNew;

  factory PaymentMethods.fromRawJson(String str) =>
      PaymentMethods.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
        userId: json["userId"],
        user: json["user"],
        fullName: json["fullName"],
        cardNumber: json["cardNumber"],
        expirationDate: json["expirationDate"],
        isDefault: json["isDefault"],
        cvv: json["cvv"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "user": user,
        "fullName": fullName,
        "cardNumber": cardNumber,
        "expirationDate": expirationDate,
        "isDefault": isDefault,
        "cvv": cvv,
        "id": id,
        "isNew": isNew,
      };
}
