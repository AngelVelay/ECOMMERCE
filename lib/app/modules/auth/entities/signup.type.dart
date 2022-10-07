// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

import 'package:jexpoints/app/modules/auth/entities/user-data.type.dart';

class Signup {
  Signup({
    this.name,
    this.email,
    this.phone,
    this.registrationCode,
    this.validationCode,
    this.password,
    this.birthdate,
    this.userData,
  });

  String? name;
  String? email;
  int? phone;
  String? registrationCode;
  String? validationCode;
  String? password;
  String? birthdate;
  UserData? userData;

  factory Signup.fromRawJson(String str) => Signup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        name: json["name"],
        email: json["email"],
        phone:
            json["phone"] != null ? int.parse(json["phone"].toString()) : null,
        registrationCode: json["registrationCode"],
        validationCode: json["validationCode"],
        password: json["password"],
        birthdate: json["birthdate"],
        userData: UserData.fromJson(json["userData"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone.toString(),
        "registrationCode": registrationCode,
        "validationCode": validationCode,
        "password": password,
        "birthdate": birthdate,
        "userData": userData?.toJson(),
      };
}
