class Product {
  Product({
    required this.id,
    required this.name,
    required this.url,
    required this.price,
    required this.cartValue,
    required this.isFavorite,
    required this.topRate,
  });

  int id;
  String name;
  String url;
  double price;
  int cartValue;
  bool isFavorite;
  int topRate;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        price: json["price"],
        cartValue: json["cartValue"],
        isFavorite: json["isFavorite"],
        topRate: json["topRate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "price": price,
        "cartValue": cartValue,
        "isFavorite": isFavorite,
        "topRate": topRate,
      };
}
