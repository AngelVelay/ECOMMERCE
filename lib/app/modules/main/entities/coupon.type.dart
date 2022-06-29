class Coupon {
  Coupon({
    required this.id,
    required this.name,
    required this.url,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.terms,
    required this.couponPriorityId,
    required this.order,
    required this.validTo,
    required this.couponTypeId,
    required this.amount,
    required this.code,
  });

  int id;
  String name;
  String url;
  String title;
  String shortDescription;
  String description;
  String terms;
  int order;
  int couponPriorityId;
  DateTime validTo;
  int couponTypeId;
  double amount;
  String code;
  String? formattedValidTo;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        terms: json["terms"],
        couponPriorityId: json["couponPriorityId"],
        order: json["order"],
        validTo: json["validTo"],
        couponTypeId: json["couponTypeId"],
        amount: json["amount"],
        code: json["code"],
      );

  factory Coupon.fromVoid() => Coupon(
      id: 0,
      name: '',
      url: '',
      title: '',
      shortDescription: '',
      description: '',
      terms: '',
      couponPriorityId: 0,
      order: 0,
      validTo: DateTime.now(),
      couponTypeId: 1,
      amount: 0,
      code: '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "title": title,
        "shortDescription": shortDescription,
        "description": description,
        "terms": terms,
        "couponPriorityId": couponPriorityId,
        "order": order,
        "validTo": validTo,
        "couponTypeId": couponTypeId,
        "amount": amount,
        "code": code,
      };
}
