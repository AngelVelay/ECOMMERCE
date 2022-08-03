import 'dart:convert';

import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    required this.isActive,
    required this.businessLineId,
    this.businessLine,
    this.imageFileId,
    this.imageLink,
    this.externalId,
  });

  String id;
  String name;
  bool isActive;
  String businessLineId;
  BusinessLine? businessLine;
  String? imageFileId;
  String? imageLink;
  String? externalId;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        businessLineId: json["businessLineId"],
        businessLine: json["businessLine"],
        externalId: json["externalId"],
        imageFileId: json["imageFileId"],
        imageLink: json["imageLink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "businessLineId": businessLineId,
        "businessLine": businessLine,
        "externalId": externalId,
        "imageFileId": imageFileId,
        "imageLink": imageLink,
      };
}
