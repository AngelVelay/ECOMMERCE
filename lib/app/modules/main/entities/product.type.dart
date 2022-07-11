enum Categories {
  rosticeria,
  pasteleria,
  panderia,
  refrescos,
  papas,
  antojoExtra,
  comida,
  bebida,
  complemento,
  otro
}

enum Quantity {
  chica,
  media,
  grande,
}

// enum ProductType {
//   product,
//   cart,
// }

class Product {
  Product({
    required this.id,
    required this.name,
    required this.url,
    required this.price,
    required this.cartValue,
    required this.isFavorite,
    required this.topRate,
    required this.points,
    required this.category,
    this.quantity,
  });

  int id;
  String name;
  String url;
  double price;
  int cartValue;
  bool isFavorite;
  int topRate;
  int points;
  Categories category;
  Map<Quantity, dynamic>? quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        price: json["price"],
        cartValue: json["cartValue"],
        isFavorite: json["isFavorite"],
        topRate: json["topRate"],
        points: json["points"],
        category: json["category"],
        quantity: json["quantity"],
      );
  factory Product.fromVoid() => Product(
        id: 1,
        name: '',
        url: '',
        price: 0,
        cartValue: 0,
        isFavorite: false,
        topRate: 0,
        points: 0,
        category: Categories.otro,
        quantity: {
          Quantity.chica: 0,
          Quantity.media: 0,
          Quantity.grande: 0,
        },
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "price": price,
        "cartValue": cartValue,
        "isFavorite": isFavorite,
        "topRate": topRate,
        "points": points,
        "category": category,
      };
}
