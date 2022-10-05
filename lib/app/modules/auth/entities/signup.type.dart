import 'dart:convert';

import 'user-data.type.dart';

class Signup {
  Signup({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.registrationCode,
    required this.validationCode,
    required this.userData,
  });

  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? registrationCode;
  String? validationCode;
  UserData userData;

  factory Signup.fromRawJson(String str) => Signup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"] != null ? json["password"] : '',
        registrationCode:
            json["registrationCode"] != null ? json["registrationCode"] : '',
        userData: UserData.fromJson(json["userData"]),
        validationCode:
            json["validationCode"] != null ? json["validationCode"] : '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "registrationCode": registrationCode,
        "validationCode": validationCode,
        "userData": userData.toJson(),
      };
}
