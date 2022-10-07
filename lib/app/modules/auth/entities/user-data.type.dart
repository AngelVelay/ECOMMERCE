// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

import 'package:jexpoints/app/modules/auth/entities/user.type.dart';

import '../../rewards/entities/point-level.type.dart';

class UserData {
  UserData({
    required this.id,
    required this.levelId,
    required this.userId,
    required this.phone,
    required this.cardNumber,
    required this.points,
    required this.percent,
    required this.formattedCardNumber,
    required this.name,
    required this.isActive,
    this.level,
    this.user,
    this.birthdate,
    this.avatarFileId,
    this.avatarFileThumbnail,
  });

  String id;
  String levelId;
  int userId;
  String phone;
  int cardNumber;
  String? birthdate;
  int points;
  int percent;
  String? avatarFileId;
  String? avatarFileThumbnail;
  String formattedCardNumber;
  String name;
  bool isActive;
  PointLevel? level;
  User? user;

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromVoid() => UserData(
      id: '',
      levelId: '',
      userId: 0,
      phone: '',
      cardNumber: 0,
      points: 0,
      percent: 0,
      formattedCardNumber: '',
      name: '',
      isActive: false);

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json["id"],
        levelId: json["levelId"],
        userId: json["userId"],
        phone: json["phone"],
        cardNumber: json["cardNumber"],
        points: json["points"],
        percent: json["percent"],
        avatarFileId: json["avatarFileId"],
        avatarFileThumbnail: json["avatarFileThumbnail"],
        formattedCardNumber: json["formattedCardNumber"],
        name: json["name"],
        isActive: json["isActive"],
        birthdate: json["birthdate"] ?? json["birthdate"],
        level:
            json["level"] != null ? PointLevel.fromJson(json["level"]) : null,
        user: json["user"] != null ? User.fromJson(json["user"]) : null);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "levelId": levelId,
        "userId": userId,
        "phone": phone,
        "cardNumber": cardNumber,
        "points": points,
        "percent": percent,
        "avatarFileId": avatarFileId,
        "avatarFileThumbnail": avatarFileThumbnail,
        "formattedCardNumber": formattedCardNumber,
        "name": name,
        "isActive": isActive,
        "level": level?.toJson(),
        "user": user?.toJson(),
        "birthdate": birthdate,
      };
}

// class Level {
//     Level({
//         this.cardBackgroundFileId,
//         this.cardBackgroundFile,
//         this.cardHeaderFileId,
//         this.cardHeaderFile,
//         this.headerFileId,
//         this.headerFile,
//         this.color,
//         this.initialPoints,
//         this.discountPercentage,
//         this.name,
//         this.isActive,
//         this.isBySystem,
//         this.id,
//         this.isNew,
//         this.insertDate,
//     });

//     String cardBackgroundFileId;
//     String cardBackgroundFile;
//     String cardHeaderFileId;
//     String cardHeaderFile;
//     String headerFileId;
//     String headerFile;
//     String color;
//     int initialPoints;
//     int discountPercentage;
//     String name;
//     bool isActive;
//     bool isBySystem;
//     String id;
//     bool isNew;
//     DateTime insertDate;

//     factory Level.fromRawJson(String str) => Level.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Level.fromJson(Map<String, dynamic> json) => Level(
//         cardBackgroundFileId: json["cardBackgroundFileId"],
//         cardBackgroundFile: json["cardBackgroundFile"],
//         cardHeaderFileId: json["cardHeaderFileId"],
//         cardHeaderFile: json["cardHeaderFile"],
//         headerFileId: json["headerFileId"],
//         headerFile: json["headerFile"],
//         color: json["color"],
//         initialPoints: json["initialPoints"],
//         discountPercentage: json["discountPercentage"],
//         name: json["name"],
//         isActive: json["isActive"],
//         isBySystem: json["isBySystem"],
//         id: json["id"],
//         isNew: json["isNew"],
//         insertDate: DateTime.parse(json["insertDate"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "cardBackgroundFileId": cardBackgroundFileId,
//         "cardBackgroundFile": cardBackgroundFile,
//         "cardHeaderFileId": cardHeaderFileId,
//         "cardHeaderFile": cardHeaderFile,
//         "headerFileId": headerFileId,
//         "headerFile": headerFile,
//         "color": color,
//         "initialPoints": initialPoints,
//         "discountPercentage": discountPercentage,
//         "name": name,
//         "isActive": isActive,
//         "isBySystem": isBySystem,
//         "id": id,
//         "isNew": isNew,
//         "insertDate": insertDate.toIso8601String(),
//     };
// }

// class User {
//     User({
//         this.username,
//         this.passwordSalt,
//         this.id,
//         this.isNew,
//         this.insertDate,
//     });

//     String username;
//     String passwordSalt;
//     int id;
//     bool isNew;
//     DateTime insertDate;

//     factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         username: json["username"],
//         passwordSalt: json["passwordSalt"],
//         id: json["id"],
//         isNew: json["isNew"],
//         insertDate: DateTime.parse(json["insertDate"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "username": username,
//         "passwordSalt": passwordSalt,
//         "id": id,
//         "isNew": isNew,
//         "insertDate": insertDate.toIso8601String(),
//     };
// }
