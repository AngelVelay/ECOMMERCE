// To parse this JSON data, do
//
//     final impulseProducts = impulseProductsFromJson(jsonString);

import 'dart:convert';

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

class Product {
  Product({
    required this.categoryId,
    this.category,
    required this.externalId,
    required this.externalCode,
    required this.imageFileId,
    required this.imageLink,
    required this.price,
    required this.points,
    required this.description,
    this.seoUri,
    this.seoAltText,
    this.seoTitle,
    this.seoDescription,
    required this.isCategoryImpulseProduct,
    required this.businessLines,
    this.imageAlterId,
    this.imageAlterLink,
    required this.topRate,
    required this.name,
    required this.isActive,
    required this.isBySystem,
    required this.id,
    required this.isNew,
  });

  String categoryId;
  dynamic category;
  String externalId;
  String externalCode;
  String imageFileId;
  String imageLink;
  double? price;
  int points;
  String description;
  dynamic seoUri;
  dynamic seoAltText;
  dynamic seoTitle;
  dynamic seoDescription;
  bool isCategoryImpulseProduct;
  String businessLines;
  dynamic imageAlterId;
  dynamic imageAlterLink;
  int topRate;
  String name;
  bool isActive;
  bool isBySystem;
  String id;
  bool isNew;

  int? cartValue;
  bool? isFavorite;
  dynamic quantity;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoryId: json["categoryId"],
        category: json["category"],
        externalId: json["externalId"],
        externalCode: json["externalCode"],
        imageFileId: json["imageFileId"],
        imageLink: json["imageLink"],
        price: json["price"],
        points: json["points"],
        description: json["description"],
        seoUri: json["seoUri"],
        seoAltText: json["seoAltText"],
        seoTitle: json["seoTitle"],
        seoDescription: json["seoDescription"],
        isCategoryImpulseProduct: json["isCategoryImpulseProduct"],
        businessLines: json["businessLines"],
        imageAlterId: json["imageAlterId"],
        imageAlterLink: json["imageAlterLink"],
        topRate: json["topRate"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "category": category,
        "externalId": externalId,
        "externalCode": externalCode,
        "imageFileId": imageFileId,
        "imageLink": imageLink,
        "price": price,
        "points": points,
        "description": description,
        "seoUri": seoUri,
        "seoAltText": seoAltText,
        "seoTitle": seoTitle,
        "seoDescription": seoDescription,
        "isCategoryImpulseProduct": isCategoryImpulseProduct,
        "businessLines": businessLines,
        "imageAlterId": imageAlterId,
        "imageAlterLink": imageAlterLink,
        "topRate": topRate,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew,
      };
}
