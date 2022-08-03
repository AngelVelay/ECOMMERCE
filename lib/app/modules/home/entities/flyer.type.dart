class Flyer {
  Flyer({required this.id, required this.url});

  int id;
  String url;

  factory Flyer.fromJson(Map<String, dynamic> json) => Flyer(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
