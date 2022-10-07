// To parse this JSON data, do
//
//     final pointLevel = pointLevelFromJson(jsonString);

import 'dart:convert';

class PointLevel {
  PointLevel({
    required this.cardBackgroundFileId,
    required this.cardBackgroundFile,
    required this.cardHeaderFileId,
    required this.cardHeaderFile,
    required this.headerFileId,
    required this.headerFile,
    required this.color,
    required this.initialPoints,
    required this.discountPercentage,
    required this.name,
    required this.isActive,
    required this.id,
  });

  String? cardBackgroundFileId;
  String? cardBackgroundFile;
  String? cardHeaderFileId;
  String? cardHeaderFile;
  String? headerFileId;
  String? headerFile;
  String color;
  int initialPoints;
  double discountPercentage;
  String name;
  bool isActive;
  String id;

  factory PointLevel.fromRawJson(String str) =>
      PointLevel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PointLevel.fromJson(Map<String, dynamic> json) => PointLevel(
        cardBackgroundFileId:
            json["cardBackgroundFileId"] ?? json["cardBackgroundFileId"],
        cardBackgroundFile:
            json["cardBackgroundFile"] ?? json["cardBackgroundFile"],
        cardHeaderFileId: json["cardHeaderFileId"] ?? json["cardHeaderFileId"],
        cardHeaderFile: json["cardHeaderFile"] ?? json["cardHeaderFile"],
        headerFileId: json["headerFileId"] ?? json["headerFileId"],
        headerFile: json["headerFile"] ?? json["headerFile"],
        color: json["color"],
        initialPoints: json["initialPoints"],
        discountPercentage: json["discountPercentage"].toDouble(),
        name: json["name"],
        isActive: json["isActive"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "cardBackgroundFileId": cardBackgroundFileId,
        "cardBackgroundFile": cardBackgroundFile,
        "cardHeaderFileId": cardHeaderFileId,
        "cardHeaderFile": cardHeaderFile,
        "headerFileId": headerFileId,
        "headerFile": headerFile,
        "color": color,
        "initialPoints": initialPoints,
        "discountPercentage": discountPercentage,
        "name": name,
        "isActive": isActive,
        "id": id,
      };
}
