import 'package:flutter/material.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.businessLineId,
  });

  int id;
  String name;
  String image;
  int businessLineId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        businessLineId: json["businessLineId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "businessLineId": businessLineId,
      };
}
