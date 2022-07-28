import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/main/entities/category.type.dart';

class BusinessLine {
  BusinessLine({
    required this.id,
    required this.name,
  });

  int id;
  String name;
  List<Category>? categories;

  factory BusinessLine.fromJson(Map<String, dynamic> json) => BusinessLine(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
