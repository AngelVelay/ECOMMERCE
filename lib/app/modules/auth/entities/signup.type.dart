// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

class Signup {
  Signup({
    this.name,
    this.email,
    this.phone,
    this.registrationCode,
    this.validationCode,
    this.password,
    this.birthdate,
    // this.userData,
  });

  String? name;
  String? email;
  int? phone;
  String? registrationCode;
  String? validationCode;
  String? password;
  String? birthdate;
  // UserData? userData;

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
        // birthdate: json["birthdate"] != null
        //     ? DateTime.parse(json["birthdate"])
        //     : null,
        // userData: UserData.fromJson(json["userData"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone.toString(),
        "registrationCode": registrationCode,
        "validationCode": validationCode,
        "password": password,
        "birthdate": birthdate,
        // "userData": userData.toJson(),
      };
}

// class UserData {
//     UserData({
//         this.insertDate,
//         this.id,
//         this.name,
//         this.isActive,
//         this.isBySystem,
//         this.levelId,
//         this.level,
//         this.userId,
//         this.user,
//         this.phone,
//         this.cardNumber,
//         this.birthdate,
//         this.points,
//         this.percent,
//     });

//     DateTime insertDate;
//     String id;
//     String name;
//     bool isActive;
//     bool isBySystem;
//     String levelId;
//     Level level;
//     int userId;
//     User user;
//     String phone;
//     int cardNumber;
//     DateTime birthdate;
//     int points;
//     int percent;

//     factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         insertDate: DateTime.parse(json["insertDate"]),
//         id: json["id"],
//         name: json["name"],
//         isActive: json["isActive"],
//         isBySystem: json["isBySystem"],
//         levelId: json["levelId"],
//         level: Level.fromJson(json["level"]),
//         userId: json["userId"],
//         user: User.fromJson(json["user"]),
//         phone: json["phone"],
//         cardNumber: json["cardNumber"],
//         birthdate: DateTime.parse(json["birthdate"]),
//         points: json["points"],
//         percent: json["percent"],
//     );

//     Map<String, dynamic> toJson() => {
//         "insertDate": insertDate.toIso8601String(),
//         "id": id,
//         "name": name,
//         "isActive": isActive,
//         "isBySystem": isBySystem,
//         "levelId": levelId,
//         "level": level.toJson(),
//         "userId": userId,
//         "user": user.toJson(),
//         "phone": phone,
//         "cardNumber": cardNumber,
//         "birthdate": birthdate.toIso8601String(),
//         "points": points,
//         "percent": percent,
//     };
// }

// class Level {
//     Level({
//         this.insertDate,
//         this.id,
//         this.name,
//         this.isActive,
//         this.isBySystem,
//         this.cardBackgroundFileId,
//         this.cardBackgroundFile,
//         this.cardHeaderFileId,
//         this.cardHeaderFile,
//         this.headerFileId,
//         this.headerFile,
//         this.color,
//         this.initialPoints,
//         this.discountPercentage,
//     });

//     DateTime insertDate;
//     String id;
//     String name;
//     bool isActive;
//     bool isBySystem;
//     String cardBackgroundFileId;
//     String cardBackgroundFile;
//     String cardHeaderFileId;
//     String cardHeaderFile;
//     String headerFileId;
//     String headerFile;
//     String color;
//     int initialPoints;
//     int discountPercentage;

//     factory Level.fromRawJson(String str) => Level.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Level.fromJson(Map<String, dynamic> json) => Level(
//         insertDate: DateTime.parse(json["insertDate"]),
//         id: json["id"],
//         name: json["name"],
//         isActive: json["isActive"],
//         isBySystem: json["isBySystem"],
//         cardBackgroundFileId: json["cardBackgroundFileId"],
//         cardBackgroundFile: json["cardBackgroundFile"],
//         cardHeaderFileId: json["cardHeaderFileId"],
//         cardHeaderFile: json["cardHeaderFile"],
//         headerFileId: json["headerFileId"],
//         headerFile: json["headerFile"],
//         color: json["color"],
//         initialPoints: json["initialPoints"],
//         discountPercentage: json["discountPercentage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "insertDate": insertDate.toIso8601String(),
//         "id": id,
//         "name": name,
//         "isActive": isActive,
//         "isBySystem": isBySystem,
//         "cardBackgroundFileId": cardBackgroundFileId,
//         "cardBackgroundFile": cardBackgroundFile,
//         "cardHeaderFileId": cardHeaderFileId,
//         "cardHeaderFile": cardHeaderFile,
//         "headerFileId": headerFileId,
//         "headerFile": headerFile,
//         "color": color,
//         "initialPoints": initialPoints,
//         "discountPercentage": discountPercentage,
//     };
// }

// class User {
//     User({
//         this.insertDate,
//         this.id,
//         this.username,
//         this.passwordSalt,
//     });

//     DateTime insertDate;
//     int id;
//     String username;
//     String passwordSalt;

//     factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         insertDate: DateTime.parse(json["insertDate"]),
//         id: json["id"],
//         username: json["username"],
//         passwordSalt: json["passwordSalt"],
//     );

//     Map<String, dynamic> toJson() => {
//         "insertDate": insertDate.toIso8601String(),
//         "id": id,
//         "username": username,
//         "passwordSalt": passwordSalt,
//     };
// }
