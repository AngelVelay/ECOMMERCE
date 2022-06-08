import 'package:flutter/material.dart';

class Catalogue {
  Catalogue({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
