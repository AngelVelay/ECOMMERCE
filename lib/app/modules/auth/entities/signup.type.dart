// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

class Signup {
  Signup({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  String name;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;

  factory Signup.fromRawJson(String str) => Signup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
