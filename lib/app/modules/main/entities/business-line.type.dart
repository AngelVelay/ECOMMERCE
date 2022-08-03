import 'dart:convert';

import 'category.type.dart';

class BusinessLine {
  BusinessLine(
      {required this.id,
      required this.name,
      required this.isActive,
      this.imageFileId,
      this.imageLink,
      this.categories});

  String id;
  String name;
  bool isActive;
  String? imageFileId;
  String? imageLink;
  List<Category>? categories;

  factory BusinessLine.fromRawJson(String str) =>
      BusinessLine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessLine.fromJson(Map<String, dynamic> json) => BusinessLine(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        imageFileId: json["imageFileId"],
        imageLink: json["imageLink"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "imageFileId": imageFileId,
        "imageLink": imageLink,
      };
}
