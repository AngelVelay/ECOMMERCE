// To parse this JSON data, do
//
//     final impulseProducts = impulseProductsFromJson(jsonString);

import 'dart:convert';

import 'package:jexpoints/app/modules/main/entities/product.type.dart';

class ImpulseProducts {
  ImpulseProducts({
    required this.productId,
    required this.product,
    required this.order,
    required this.id,
    required this.isNew,
  });

  String productId;
  Product product;
  int order;
  int id;
  bool isNew;

  factory ImpulseProducts.fromRawJson(String str) =>
      ImpulseProducts.fromJson(json.decode(str));

  get cartValue => null;

  String toRawJson() => json.encode(toJson());

  factory ImpulseProducts.fromJson(Map<String, dynamic> json) =>
      ImpulseProducts(
        productId: json["productId"],
        product: Product.fromJson(json["product"]),
        order: json["order"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "product": product.toJson(),
        "order": order,
        "id": id,
        "isNew": isNew,
      };
}
