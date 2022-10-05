import 'dart:convert';

class UserData {
  UserData({
    required this.username,
    required this.id,
    required this.passwordSalt,
    required this.password,
  });

  String username;
  String id;
  String passwordSalt;
  String password;

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        username: json["username"],
        id: json["id"],
        passwordSalt: json["passwordSalt"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "passwordSalt": passwordSalt,
        "password": password,
      };
}
