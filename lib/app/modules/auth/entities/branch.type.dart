import 'dart:convert';

class Branch {
  Branch({
    required this.externalCode,
    required this.externalId,
    required this.name,
    required this.isActive,
    required this.isBySystem,
    required this.id,
    required this.description,
    this.companyId,
    this.company,
  });

  String? companyId;
  String description;
  String externalCode;
  int externalId;
  String name;
  bool isActive;
  bool isBySystem;
  int id;
  dynamic company;

  factory Branch.fromRawJson(String str) => Branch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        companyId: json["companyId"],
        externalCode: json["externalCode"],
        externalId: json["externalId"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        company: json["company"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "externalCode": externalCode,
        "externalId": externalId,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "company": company,
        "description": description
      };
}
