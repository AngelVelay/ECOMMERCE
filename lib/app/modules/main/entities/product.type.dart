class Product {
  Product({
    required this.id,
    required this.name,
    required this.url,
    required this.price,
    required this.cartValue,
  });

  int id;
  String name;
  String url;
  double price;
  int cartValue;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        price: json["price"],
        cartValue: json["cartValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "price": price,
        "cartValue": cartValue,
      };
}
