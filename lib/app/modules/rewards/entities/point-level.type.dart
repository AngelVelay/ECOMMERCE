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
    required this.isBySystem,
    required this.id,
    required this.isNew,
  });

  String? cardBackgroundFileId;
  String? cardBackgroundFile;
  String? cardHeaderFileId;
  String? cardHeaderFile;
  String? headerFileId;
  String? headerFile;
  String? color;
  int? initialPoints;
  int? discountPercentage;
  String? name;
  bool isActive;
  bool isBySystem;
  String id;
  bool isNew;

  factory PointLevel.fromRawJson(String str) =>
      PointLevel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PointLevel.fromJson(Map<String, dynamic> json) => PointLevel(
        cardBackgroundFileId: json["cardBackgroundFileId"],
        cardBackgroundFile: json["cardBackgroundFile"],
        cardHeaderFileId: json["cardHeaderFileId"],
        cardHeaderFile: json["cardHeaderFile"],
        headerFileId: json["headerFileId"],
        headerFile: json["headerFile"],
        color: json["color"],
        initialPoints: json["initialPoints"],
        discountPercentage: json["discountPercentage"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
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
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew,
      };
}
