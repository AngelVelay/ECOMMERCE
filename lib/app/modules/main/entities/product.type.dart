import 'dart:convert';

import 'category.type.dart';

// enum Categories {
//   rosticeria,
//   pasteleria,
//   panderia,
//   refrescos,
//   papas,
//   antojoExtra,
//   comida,
//   bebida,
//   complemento,
//   otro
// }

enum Quantity {
  chica,
  media,
  grande,
}

class Product {
  Product(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.categoryId,
      required this.imageFileId,
      required this.imageLink,
      required this.price,
      required this.points,
      required this.topRate,
      this.description,
      this.category,
      this.externalId,
      this.externalCode,
      this.cartValue,
      this.isFavorite,
      this.quantity});

  String id;
  String name;
  bool isActive;
  String categoryId;
  String imageFileId;
  String imageLink;
  double price;
  int points;
  int topRate;
  String? description;
  Category? category;
  String? externalId;
  String? externalCode;

  int? cartValue;
  bool? isFavorite;
  dynamic quantity;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        categoryId: json["categoryId"],
        category: json["category"],
        externalId: json["externalId"],
        externalCode: json["externalCode"],
        imageFileId: json["imageFileId"],
        imageLink: json["imageLink"],
        price: json["price"],
        points: json["points"],
        description: json["description"],
        topRate: json["topRate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "categoryId": categoryId,
        "category": category,
        "externalId": externalId,
        "externalCode": externalCode,
        "imageFileId": imageFileId,
        "imageLink": imageLink,
        "price": price,
        "points": points,
        "description": description,
        "topRate": topRate,
      };
}
