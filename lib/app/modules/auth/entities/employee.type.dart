import 'dart:convert';

class Employee {
  Employee({
    required this.organizationId,
    required this.organization,
    required this.email,
    required this.name,
    required this.isActive,
    required this.isBySystem,
    this.id,
    this.picture,
    this.externalCode,
    this.externalId,
  });

  String organizationId;
  dynamic organization;
  String email;
  String name;
  bool isActive;
  bool isBySystem;
  String? id;
  String? picture;
  String? externalCode;
  int? externalId;

  factory Employee.fromRawJson(String str) =>
      Employee.fromJson(json.decode(str));

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        organizationId: json["organizationId"],
        organization: json["organization"],
        email: json["email"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        externalCode: json["externalCode"],
        externalId: json["externalId"],
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "organization": organization,
        "email": email,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "externalCode": externalCode,
        "externalId": externalId,
      };
}
