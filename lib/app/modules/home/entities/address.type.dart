// To parse this JSON data, do
//
//     final userAddress = userAddressFromJson(jsonString);

import 'dart:convert';

class UserAddress {
  UserAddress({
    this.userId,
    this.user,
    required this.alias,
    required this.street,
    required this.outsideNumber,
    required this.insidelNumber,
    required this.suburb,
    required this.town,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.contactName,
    required this.contactPhone,
    required this.streetNotes,
    required this.betweenStreets,
    required this.additionalInformation,
    this.isDefault,
    required this.id,
    required this.isNew,
  });

  dynamic userId;
  dynamic user;
  String alias;
  String street;
  String outsideNumber;
  String insidelNumber;
  String suburb;
  String town;
  String state;
  String country;
  int zipcode;
  String contactName;
  int contactPhone;
  String streetNotes;
  String? betweenStreets;
  String? additionalInformation;
  dynamic isDefault;
  int id;
  bool isNew;

  factory UserAddress.fromVoid() => UserAddress(
      id: 0,
      alias: '',
      street: '',
      outsideNumber: '',
      insidelNumber: '',
      suburb: '',
      town: '',
      state: '',
      country: '',
      zipcode: 0,
      isDefault: false,
      contactName: '',
      contactPhone: 0,
      additionalInformation: '',
      betweenStreets: '',
      isNew: false,
      streetNotes: '');

  factory UserAddress.fromRawJson(String str) =>
      UserAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        userId: json["userId"],
        user: json["user"],
        alias: json["alias"],
        street: json["street"],
        outsideNumber: json["outsideNumber"],
        insidelNumber: json["insidelNumber"],
        suburb: json["suburb"],
        town: json["town"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        streetNotes: json["streetNotes"],
        betweenStreets: json["betweenStreets"],
        additionalInformation: json["additionalInformation"],
        isDefault: json["isDefault"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "user": user,
        "alias": alias,
        "street": street,
        "outsideNumber": outsideNumber,
        "insidelNumber": insidelNumber,
        "suburb": suburb,
        "town": town,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "streetNotes": streetNotes,
        "betweenStreets": betweenStreets,
        "additionalInformation": additionalInformation,
        "isDefault": isDefault,
        "id": id,
        "isNew": isNew,
      };
}
