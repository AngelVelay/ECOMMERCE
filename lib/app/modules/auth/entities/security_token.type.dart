// To parse this JSON data, do
//
//     final securityToken = securityTokenFromJson(jsonString);

import 'dart:convert';

class SecurityToken {
    SecurityToken({
        required this.accessToken,
        required this.refreshToken,
        required this.validTo,
    });

    String accessToken;
    String refreshToken;
    DateTime validTo;

    factory SecurityToken.fromRawJson(String str) => SecurityToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SecurityToken.fromJson(Map<String, dynamic> json) => SecurityToken(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        validTo: DateTime.parse(json["validTo"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "validTo": validTo.toIso8601String(),
    };
}
