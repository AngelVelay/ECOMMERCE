class Review {
  Review({
    required this.id,
    required this.name,
    required this.productURL,
    required this.userId,
    required this.rating,
    required this.comment,
  });

  int id;
  String name;
  String productURL;
  int userId;
  double rating;
  String comment;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        name: json["name"],
        productURL: json["productURL"],
        userId: json["userId"],
        rating: json["rating"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productURL": productURL,
        "userId": userId,
        "rating": rating,
        "comment": comment,
      };
}
