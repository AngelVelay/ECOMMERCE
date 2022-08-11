import 'package:jexpoints/app/modules/main/entities/cfdi.type.dart';

class Billing {
  Billing({
    required this.rfc,
    required this.business,
    required this.mail,
    required this.cfdi,
    required this.type,
  });

  String rfc;
  String business;
  String mail;
  Cfdi? cfdi;
  Map<String, dynamic> type;

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
      rfc: json["rfc"],
      business: json["business"],
      mail: json["mail"],
      cfdi: Cfdi.fromJson(json["cfdiId"]),
      type: {"value": json["type"], "label": json["type"]});

  factory Billing.fromVoid() => Billing(
      rfc: '',
      business: '',
      mail: '',
      cfdi: Cfdi.fromVoid(),
      type: {"value": '', "label": ''});

  Map<String, dynamic> toJson() => {
        "rfc": rfc,
        "business": business,
        "mail": mail,
        "cfdi": Cfdi.fromJson(
          cfdi!.toJson(),
        ),
        "type": type["value"],
      };
}
