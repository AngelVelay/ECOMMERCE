class Coupon {
//   Coupon({
//     // required this.id,
//     // required this.name,
//     // required this.url,
//     // required this.title,
//     // required this.shortDescription,
//     // required this.description,
//     // required this.terms,
//     // required this.couponPriorityId,
//     // required this.order,
//     // required this.validTo,
//     // required this.couponTypeId,
//     // required this.amount,
//     // required this.code,
// });

  Coupon(
      {required this.title,
      required this.description,
      required this.shortDescription,
      required this.couponTypeId,
      required this.amount,
      required this.code,
      required this.beginDate,
      required this.endDate,
      required this.terms,
      required this.faq,
      required this.fileManagerId,
      required this.fileManagerThumbnail,
      required this.name,
      required this.isActive,
      required this.isBySystem,
      required this.couponPriorityId,
      required this.order,
      // required this.validTo,
      // required this.url,
      required this.id,
      required this.isNew});

  int? id;
  String name;
  // String url;
  String title;
  String shortDescription;
  String description;
  String terms;
  String? beginDate;
  String? endDate;
  String? faq;
  int? code;
  String? fileManagerId;
  String? fileManagerThumbnail;
  bool? isActive;
  bool? isBySystem;
  bool? isNew;

  int? order;
  int? couponPriorityId;
  // DateTime validTo;
  int? couponTypeId;
  double amount;
  String? formattedValidTo;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        terms: json["terms"],
        couponTypeId: json["couponTypeId"],
        amount: json["amount"],
        code: json["code"],
        beginDate: json['beginDate'],
        endDate: json['endDate'],
        faq: json['faq'],
        fileManagerId: json['fileManagerId'],
        fileManagerThumbnail: json['fileManagerThumbnail'],
        isActive: json['isActive'],
        isBySystem: json['isBySystem'],
        isNew: json['isNew'],
        couponPriorityId: json['couponPriorityId'],
        order: json['order'],
        // url: json['url'],
        // validTo: json['validTo'],
      );

  factory Coupon.fromVoid() => Coupon(
        id: 0,
        name: '',
        title: '',
        shortDescription: '',
        description: '',
        terms: '',
        couponTypeId: 1,
        amount: 0,
        code: 0,
        beginDate: '',
        endDate: '',
        faq: '',
        fileManagerId: '',
        fileManagerThumbnail: '',
        isActive: null,
        isBySystem: null,
        isNew: null,
        couponPriorityId: 0,
        order: 0,
        // url: '',
        // validTo: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "title": "Cupon",
        "description": "<p>Cupon cupon prueba</p>\n",
        "shortDescription": "Cupon",
        "couponTypeId": 5,
        "couponType": null,
        "amount": 100,
        "code": 84739,
        "beginDate": "2022-07-26T00:00:00",
        "endDate": "2022-07-31T00:00:00",
        "terms": "<p>terminos</p>\n",
        "faq": "<p>preguntas frecuentes</p>\n",
        "fileManagerId": "f8e85a14-286e-436c-97f2-a7aa8ab46bdd",
        "fileManagerThumbnail": null,
        "name": "Cupon actualizado v.20",
        "isActive": true,
        "isBySystem": false,
        "id": 1,
        "isNew": false
      };
}
